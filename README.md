# GOV.UK Test

Gem to package test dependencies and config for GOV.UK applications. Cousin of [govuk_app_config](https://github.com/alphagov/govuk_app_config).

## Installation

```ruby
gem 'govuk_test'
```

And then execute:

    $ bundle

## Usage

Somewhere in your `spec_helper` put:

```rb
GovukTest.configure
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
