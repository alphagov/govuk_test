require "govuk_test/pact"
require "govuk_test/railtie" if defined?(Rails)
require "govuk_test/version"

require "capybara"
require "puma"
require "selenium-webdriver"

unless ENV["GOVUK_TEST_USE_SYSTEM_CHROMEDRIVER"]
  require "webdrivers"

  # This stop webdrivers doing a lazy check for new versions
  # of chromedriver, which interferes with WebMock.disable_net_connect
  Selenium::WebDriver::Chrome::Service.driver_path = Webdrivers::Chromedriver.update
end

module GovukTest
  def self.configure
    Capybara.register_driver :headless_chrome do |app|
      Capybara::Selenium::Driver.new(app,
                                     browser: :chrome,
                                     options: headless_chrome_selenium_options)
    end

    Capybara.javascript_driver = :headless_chrome
    Capybara.server = :puma, { Silent: true }
  end

  def self.headless_chrome_selenium_options
    Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.headless!
      options.add_argument("--no-sandbox") if ENV["GOVUK_TEST_CHROME_NO_SANDBOX"]
    end
  end
end
