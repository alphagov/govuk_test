# Changelog

- We use the [GOV.UK versioning guidelines](https://docs.publishing.service.gov.uk/manual/publishing-a-ruby-gem.html#versioning).
- Mark breaking changes with `BREAKING:`. Be sure to include instructions on how applications should be upgraded.
- Include a link to your pull request.
- Don't include changes that are purely internal. The CHANGELOG should be a
  useful summary for people upgrading their application, not a replication
  of the commit log.

## 4.0.1

* Use `options` instead of `capabilities` in `Capybara::Selenium::Driver#initialize`. The use of `capabilities` was deprecated in selenium 4.8.0 and was removed in selenium 4.12.0.

## 4.0.0

* Replace call to deprecated `Selenium::WebDriver::Chrome::Options#headless!` method ([#63](https://github.com/alphagov/govuk_test/pull/63))
* Bump GitHub actions/checkout from 3 to 4 ([#59](https://github.com/alphagov/govuk_test/pull/59))
* Update rubocop-govuk requirement from = 4.11.0 to = 4.12.0 ([#58](https://github.com/alphagov/govuk_test/pull/58))
* Update rubocop-govuk requirement from = 4.10.0 to = 4.11.0 ([#57](https://github.com/alphagov/govuk_test/pull/57))
* Fix spec.files in govuk_test.gemspec ([#56](https://github.com/alphagov/govuk_test/pull/56))
* Add rubocop-govuk ([#55](https://github.com/alphagov/govuk_test/pull/55))
* BREAKING: Drop support for Ruby 2.7 ([#54](https://github.com/alphagov/govuk_test/pull/54))
* Use .yml for workflow files ([#52](https://github.com/alphagov/govuk_test/pull/52))
* Add Ruby 3.2 to CI test matrix ([#51](https://github.com/alphagov/govuk_test/pull/51))
* Link to MIT Licence in repository ([#50](https://github.com/alphagov/govuk_test/pull/50))
* Bump GitHub actions/checkout from 2 to 3 ([#49](https://github.com/alphagov/govuk_test/pull/49))
* Configure Dependabot for GitHub Actions ([#48](https://github.com/alphagov/govuk_test/pull/48))
* Configure Dependabot for Bundler ([#47](https://github.com/alphagov/govuk_test/pull/47))
* Switch from Jenkins to GitHub Actions for CI ([#46](https://github.com/alphagov/govuk_test/pull/46))
* Update Ruby from 2.6.6 to 2.7.6 ([#45](https://github.com/alphagov/govuk_test/pull/45))


## 3.0.1

* Resolve Selenium deprecation warning on options argument by requiring higher minimum versions ([#44](https://github.com/alphagov/govuk_test/pull/44))

## 3.0.0

* BREAKING: Remove dependency on `webdrivers` gem. It's now expected that ChromeDriver is present on the underlying operating system. ([#43](https://github.com/alphagov/govuk_test/pull/43))

## 2.3.0

* Update brakeman to fix false positive warning ([#41](https://github.com/alphagov/govuk_test/pull/41))

## 2.2.0

* Remove pact test branch verify rake task
* Remove `pact` and `climate_control` dependencies

## 2.1.2

* Mark `climate_control` as a dependency (rather than dev dependency)

## 2.1.1

* Add `pact` as a dependency

## 2.1.0

* Add pact test branch verify rake task
* Add Railtie to load rake tasks

## 2.0.0

* BREAKING: `.configure` no longer accepts options. If you need to modify the
  headless_chrome selenium driver you can re-register the driver with
  `Capybara.register_driver`.
* `GovukTest.headless_chrome_selenium_options` added to allow accessing the
  headless Chrome selenium options for other contexts (such as configuring
  Jasmine).
* `GOVUK_TEST_CHROME_NO_SANDBOX` can be set to default Chrome to be running
  with the `--no-sandbox` argument.

## 1.0.3

* Add Brakeman as a dependency.

## 1.0.2

* Allow new versions of 'webdrivers' above 4

## 1.0.1

* Ensure version of 'webdrivers' is at least 4

## 1.0.0

* BREAKING: `.configure` accepts a `chrome_options` argument of an instance of
  `Selenium::Webdriver::Chrome::Options` rather than a hash. The `window_size`
  argument is dropped and can be done by configuring the `chrome_options`
  instance, [example](https://github.com/alphagov/govuk_test/blob/dfd1a82e0114dbf1c668957fbea19cea04fd0d90/spec/govuk_test_spec.rb#L12-L22).

## 0.5.0

* No changes: new release for semantic versioning purposes (0.4.4 should have been 0.5.0)

## 0.4.4

* Allow `.configure` to accept extra chrome options

## 0.4.3

* Swap the deprecated chromedriver-helper gem for webdrivers gem

## 0.4.2

* Silence Puma logs during spec suite.

## 0.4.1

* Avoid issues with older versions of the chromedriver-helper gem, by
  only using chromedriver form the PATH if
  GOVUK_TEST_USE_SYSTEM_CHROMEDRIVER is set in the environment.

## 0.4.0

* Don't download chromedriver if it's already available.

## 0.3.1

* Revert "Don't force use of chromedriver-helper" - which seems to break apps in CI

## 0.3.0

* Don't download chromedriver if it's already available.

## 0.2.1

* Explicitly require the `chromedriver-helper` Gem to fix the path to the binary.

## 0.2.0

* Allow passing options to GovukTest.configure. Currently only `window_size` is supported. This is
  passed to the chrome driver capabilites. eg. `GovukTest.configure(window_size: "1280,720")`.

## 0.1.0

* Initial version, configures selenium headless chrome javascript driver by default.
