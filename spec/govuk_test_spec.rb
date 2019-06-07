require 'govuk_test'

RSpec.describe GovukTest do
  let(:app) { double(:app) }
  let(:default_args) { %w(headless disable-gpu) }

  before do
    allow(Capybara).to receive(:register_driver).with(:headless_chrome).and_yield(app)
  end

  context ".configure without options" do
    it "uses default options" do
      expect(Selenium::WebDriver::Remote::Capabilities).to receive(:chrome)
        .with(chromeOptions: { args: default_args })

      GovukTest.configure
    end
  end

  context ".configure with options" do
    context "with :window_size" do
      let(:window_size) { "1366,768" }
      let(:expected_args) { default_args << "--window-size=#{window_size}" }

      it "appends the :window_size option to default options" do
        expect(Selenium::WebDriver::Remote::Capabilities).to receive(:chrome)
          .with(chromeOptions: { args: expected_args })

        GovukTest.configure(window_size: window_size)
      end
    end

    context "with :chrome_options" do
      it "merges the :chrome_options option to the :chromeOptions" do
        expect(Selenium::WebDriver::Remote::Capabilities).to receive(:chrome)
          .with(chromeOptions: { args: default_args, some_key: 'some value' })

        GovukTest.configure(chrome_options: { some_key: 'some value' })
      end
    end
  end
end
