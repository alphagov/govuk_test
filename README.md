# GOV.UK Test

Gem to package test dependencies and config for GOV.UK applications. Cousin of [govuk_app_config](https://github.com/alphagov/govuk_app_config).

## Installation

```ruby
gem 'govuk_test'
```

And then execute:

    $ bundle

## Usage

Somewhere in your `spec_helper`, `rails_helper`, or `spec/support/govuk_test.rb` put:

```rb
GovukTest.configure
```

It's also possible to pass optional arguments `:chrome_options` and/or `:window_size `
to `GovukTest.configure`:

```rb
GovukTest.configure(chrome_options: { some_key: "some value" })

# or

GovukTest.configure(window_size: "1366,768")

# or

GovukTest.configure(chrome_options: { some_key: "some value" }, window_size: "800,600")
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
