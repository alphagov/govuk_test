require "govuk_test/version"

require "capybara"
require "puma"
require "selenium-webdriver"

unless ENV['GOVUK_TEST_USE_SYSTEM_CHROMEDRIVER']
  require 'webdrivers'

  # This stop webdrivers doing a lazy check for new versions
  # of chromedriver, which interferes with WebMock.disable_net_connect
  if ::Selenium::WebDriver::Service.respond_to? :driver_path=
    Selenium::WebDriver::Chrome::Service.driver_path = Webdrivers::Chromedriver.update
  else
    Selenium::WebDriver::Chrome.driver_path = Webdrivers::Chromedriver.update
  end
end

module GovukTest
  def self.configure(options = {})
    chrome_options = %w(headless disable-gpu)
    chrome_options << "--window-size=#{options[:window_size]}" if options[:window_size]

    Capybara.register_driver :headless_chrome do |app|
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: { args: chrome_options }
      )

      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: capabilities
      )
    end

    Capybara.javascript_driver = :headless_chrome
    Capybara.server = :puma, { Silent: true }
  end
end
