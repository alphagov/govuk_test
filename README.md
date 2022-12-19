# GOV.UK Test

Gem to package test dependencies and config for GOV.UK applications. Cousin of [govuk_app_config](https://github.com/alphagov/govuk_app_config).

## Installation

```ruby
gem "govuk_test"
```

And then execute:

```
$ bundle
```

## Usage

Somewhere in your `spec_helper.rb`, `rails_helper.rb`, or
`spec/support/govuk_test.rb` put:

```ruby
GovukTest.configure
```

This will configure [Capybara][] to run any JavaScript enabled tests
against a [Selenium][] driven instance of
[headless Google Chrome][headless-chrome].

If you need to use this as a root user (such as within some docker containers)
you will need to set a `GOVUK_TEST_CHROME_NO_SANDBOX` environment variable.

You can reuse the Selenium options for headless Google Chrome for configuring
other Selenium driven tests, such as [Jasmine][]:

```ruby
class ChromeHeadlessJasmineConfigurer < JasmineSeleniumRunner::ConfigureJasmine
  def selenium_options
    { options: GovukTest.headless_chrome_selenium_options }
  end
end
```

Should you need to configure the options for your application the recommended
approach is to re-register the headless Google Chrome driver:

```ruby
GovukTest.configure

Capybara.register_driver :headless_chrome do |app|
  chrome_options = GovukTest.headless_chrome_selenium_options
  chrome_options.add_argument("--disable-web-security")
  chrome_options.add_argument("--window-size=1400,1400")

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: { acceptInsecureCerts: true },
    options: chrome_options,
  )
end
```

[Capybara]: https://github.com/teamcapybara/capybara
[Selenium]: https://selenium.dev
[headless-chrome]: https://developers.google.com/web/updates/2017/04/headless-chrome
[Jasmine]: https://github.com/jasmine/jasmine_selenium_runner

## Licence

The gem is available as open source under the terms of the [MIT License](LICENCE).
