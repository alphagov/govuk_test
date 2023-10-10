require "govuk_test/version"

require "capybara"
require "puma"
require "selenium-webdriver"

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
      options.add_argument("--headless")
      options.add_argument("--no-sandbox") if ENV["GOVUK_TEST_CHROME_NO_SANDBOX"]
    end
  end
end
