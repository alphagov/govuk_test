require 'govuk_test'

RSpec.describe GovukTest do
  describe ".configure" do
    it "sets headless chrome as Capybara javascript_driver" do
      Capybara.javascript_driver = nil
      expect { GovukTest.configure }
        .to change { Capybara.javascript_driver }
        .to(:headless_chrome)
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
