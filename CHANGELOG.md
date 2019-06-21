# Changelog

- We use the [GOV.UK versioning guidelines](https://docs.publishing.service.gov.uk/manual/publishing-a-ruby-gem.html#versioning).
- Mark breaking changes with `BREAKING:`. Be sure to include instructions on how applications should be upgraded.
- Include a link to your pull request.
- Don't include changes that are purely internal. The CHANGELOG should be a
  useful summary for people upgrading their application, not a replication
  of the commit log.

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
