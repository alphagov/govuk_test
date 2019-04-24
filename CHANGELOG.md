# Changelog

- We use the [GOV.UK versioning guidelines](https://docs.publishing.service.gov.uk/manual/publishing-a-ruby-gem.html#versioning).
- Mark breaking changes with `BREAKING:`. Be sure to include instructions on how applications should be upgraded.
- Include a link to your pull request.
- Don't include changes that are purely internal. The CHANGELOG should be a
  useful summary for people upgrading their application, not a replication
  of the commit log.

* Remove the now-deprecated chromedriver-helper gem in favour of system binaries

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
