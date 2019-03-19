require "govuk_test/version"

require "capybara"
require "ptools"
require "puma"
require "selenium-webdriver"

module GovukTest
  def self.configure(options = {})
    chrome_options = %w(headless disable-gpu)
    chrome_options << "--window-size=#{options[:window_size]}" if options[:window_size]

    chromedriver_from_path = File.which("chromedriver")

    # Check the size of the file, as older versions of the
    # chromedriver-helper gem (pre version 2) installed a binary with
    # the name "chromedriver" that doesn't work. The Rubygems
    # generated chromedriver file is 590 bytes in size, but say bigger
    # than 1000 just in case the file gets bigger.
    if chromedriver_from_path && File.lstat(chromedriver_from_path).size > 1000
      # Use the installed chromedriver, rather than chromedriver-helper
      Selenium::WebDriver::Chrome.driver_path = chromedriver_from_path
    else
      require 'chromedriver-helper'
    end

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
  end
end
