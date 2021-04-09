require "govuk_test"

namespace :pact do
  desc "Verify the API contract for a specific branch"
  task "verify:branch", [:branch_name] => :environment do |t, args|
    begin
      require "pact/tasks"
      require "pact/tasks/task_helper"
    rescue LoadError
      abort "Pact must be added as a dependency in the downstream app."
    end
    abort "Please provide a branch name. eg rake #{t.name}[my_feature_branch]" unless args[:branch_name]
  
    pact_version = args[:branch_name] == "master" ? args[:branch_name] : "branch-#{args[:branch_name]}"
    ENV["GDS_API_ADAPTERS_PACT_VERSION"] = pact_version
    Pact::TaskHelper.handle_verification_failure do
      Pact::TaskHelper.execute_pact_verify
    end
  end
end
