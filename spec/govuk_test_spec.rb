require "govuk_test"
require "climate_control"

RSpec.describe GovukTest do
  describe ".configure" do
    it "sets headless chrome as Capybara javascript_driver" do
      Capybara.javascript_driver = nil
      expect { described_class.configure }
        .to change(Capybara, :javascript_driver)
        .to(:headless_chrome)
    end

    it "uses .headless_chrome_selenium_options to set default options" do
      described_class.configure
      driver = Capybara.drivers[:headless_chrome].call
      expect(driver.options[:options].args)
        .to eq(described_class.headless_chrome_selenium_options.args)
    end
  end

  describe ".headless_chrome_selenium_options" do
    it "returns an instance of Selenium::WebDriver::Chrome::Options set as headless" do
      options = described_class.headless_chrome_selenium_options

      expect(options).to be_instance_of(Selenium::WebDriver::Chrome::Options)
      expect(options.args).to include("--headless=new")
    end

    it "can be configured with an environment variable to run in no-sandbox" do
      expect(described_class.headless_chrome_selenium_options.args)
        .not_to include("--no-sandbox")

      ClimateControl.modify(GOVUK_TEST_CHROME_NO_SANDBOX: "1") do
        described_class.configure
        expect(described_class.headless_chrome_selenium_options.args)
          .to include("--no-sandbox")
      end
    end
  end
end
