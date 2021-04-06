require "govuk_test"

require "pact/tasks"
require "pact/tasks/task_helper"

namespace :pact do
  desc "Verify the API contract for a specific branch"
  task "verify:branch", [:branch_name, :app_name] => :environment do |t, args|
    abort "Please provide a branch and application name. e.g. rake #{t.name}[my_feature_branch,gds-api-adapters]" unless args[:branch_name] && args[:app_name]
  
    pact_key = case args[:app_name]
    when "gds-api-adapters"
      "GDS_API_ADAPTERS_PACT_VERSION"
    when "publishing-api"
      "PUBLISHING_API_PACT_VERSION"
    end

    pact_version = args[:branch_name] == "master" ? args[:branch_name] : "branch-#{args[:branch_name]}"

    ENV[pact_key] = pact_version

    Pact::TaskHelper.handle_verification_failure do
      Pact::TaskHelper.execute_pact_verify
    end
  end
end
