lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "govuk_test/version"

Gem::Specification.new do |spec|
  spec.name          = "govuk_test"
  spec.version       = GovukTest::VERSION
  spec.authors       = ["GOV.UK Dev"]
  spec.email         = ["govuk-dev@digital.cabinet-office.gov.uk"]

  spec.summary       = "Test setup for GOV.UK"
  spec.description   = "Test configuration and dependencies for applications on GOV.UK"
  spec.homepage      = "https://github.com/alphagov/govuk_test"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.1"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency "brakeman", ">= 5.0.2"
  spec.add_dependency "capybara", ">= 3.36"
  spec.add_dependency "puma"
  spec.add_dependency "selenium-webdriver", ">= 4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "climate_control"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-govuk", "5.1.5"
  spec.add_development_dependency "simplecov"
end
