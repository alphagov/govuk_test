lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "govuk_test/version"

Gem::Specification.new do |spec|
  spec.name          = "govuk_test"
  spec.version       = GovukTest::VERSION
  spec.authors     = ["GOV.UK Dev"]
  spec.email       = ["govuk-dev@digital.cabinet-office.gov.uk"]

  spec.summary       = %q{Test setup for GOV.UK}
  spec.description   = %q{Test configuration and dependencies for applications on GOV.UK}
  spec.homepage      = "https://github.com/alphagov/govuk_test"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "brakeman", ">= 5.0.2"
  spec.add_dependency "capybara", ">= 3.36"
  spec.add_dependency "puma"
  spec.add_dependency "selenium-webdriver", ">= 4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "climate_control"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
