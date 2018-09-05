require "govuk_test/version"

require "capybara"
require "puma"
require "selenium-webdriver"

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
  end
end
