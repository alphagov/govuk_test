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

    it "uses .chrome_selenium_options to set default options" do
      GovukTest.configure
      driver = Capybara.drivers[:headless_chrome].call
      expect(driver.options[:options].args)
        .to eq(GovukTest.chrome_selenium_options.args)
    end

    context "with chrome_options" do
      it "can override the options for the headless_chrome driver" do
        chrome_options = Selenium::WebDriver::Chrome::Options.new
        chrome_options.add_option(:window_size, "1366,768")

        GovukTest.configure(chrome_options: chrome_options)

        driver = Capybara.drivers[:headless_chrome].call

        expect(driver.options[:options]).to be(chrome_options)
      end
    end
  end

  describe ".chrome_selenium_options" do
    it "returns an instance of Selenium::WebDriver::Chrome::Options set as headless" do
      options = GovukTest.chrome_selenium_options

      expect(options).to be_instance_of(Selenium::WebDriver::Chrome::Options)
      expect(options.args).to include("--headless")
    end

    it "can be configured with an environment variable to run in no-sandbox" do
      expect(GovukTest.chrome_selenium_options.args).not_to include("--no-sandbox")

      ClimateControl.modify(GOVUK_TEST_CHROME_NO_SANDBOX: "1") do
        expect(GovukTest.chrome_selenium_options.args).to include("--no-sandbox")
      end
    end
  end
end
