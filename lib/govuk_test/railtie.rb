require "govuk_test"

module GovukTest
  class Railtie < Rails::Railtie
    rake_tasks do
      Dir[File.expand_path('../tasks/**/*.rake', File.dirname(__FILE__))].each { |f| load f }
    end
  end
end
