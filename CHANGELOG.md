# Changelog

- We use the [GOV.UK versioning guidelines](https://docs.publishing.service.gov.uk/manual/publishing-a-ruby-gem.html#versioning).
- Mark breaking changes with `BREAKING:`. Be sure to include instructions on how applications should be upgraded.
- Include a link to your pull request.
- Don't include changes that are purely internal. The CHANGELOG should be a
  useful summary for people upgrading their application, not a replication
  of the commit log.

## 0.2.0

* Allow passing options to GovukTest.configure. Currently only `window_size` is supported. This is
  passed to the chrome driver capabilites. eg. `GovukTest.configure(window_size: "1280,720")`.

## 0.1.0

* Initial version, configures selenium headless chrome javascript driver by default.
