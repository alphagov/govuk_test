require "govuk_test"
require "climate_control"

RSpec.describe GovukTest do
  describe ".configure" do
    it "sets headless chrome as Capybara javascript_driver" do
      Capybara.javascript_driver = nil
      expect { GovukTest.configure }
        .to change { Capybara.javascript_driver }
        .to(:headless_chrome)
    end

    it "can specify chrome to run in no sandbox mode" do
      GovukTest.configure
      driver = Capybara.drivers[:headless_chrome].call
      expect(driver.options[:options].args).not_to include("--no-sandbox")

      ClimateControl.modify(GOVUK_TEST_CHROME_NO_SANDBOX: "true") do
        GovukTest.configure
        driver = Capybara.drivers[:headless_chrome].call
        expect(driver.options[:options].args).to include("--no-sandbox")
      end
    end

    context "with chrome_options" do
      it "can set the options for the headless_chrome driver" do
        chrome_options = Selenium::WebDriver::Chrome::Options.new
        chrome_options.add_option(:window_size, "1366,768")

        GovukTest.configure(chrome_options: chrome_options)

        driver = Capybara.drivers[:headless_chrome].call

        expect(driver.options[:options]).to be(chrome_options)
      end
    end
  end
end
