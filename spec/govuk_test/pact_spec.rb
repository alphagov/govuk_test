require "govuk_test"

RSpec.describe GovukTest::Pact do
  describe ".host_port" do
    it "retrieves the full Pact host of the app" do
      expect(GovukTest::Pact.host_port(:publishing_api)).to eq(3001)
      expect(GovukTest::Pact.host_port(:organisation_api)).to eq(3002)
      expect(GovukTest::Pact.host_port(:bank_holidays_api)).to eq(3003)
      expect(GovukTest::Pact.host_port(:account_api)).to eq(3004)
    end

    it "raises an error if the app isn't recognised" do
      expect { GovukTest::Pact.host_port(:made_up_api) }
        .to raise_error("No Pact configuration found for API made_up_api")
    end
  end

  describe ".host" do
    it "retrieves the full Pact host of the app" do
      expect(GovukTest::Pact.host(:organisation_api))
        .to eq("http://localhost:3002")
    end

    it "raises an error if the app isn't recognised" do
      expect { GovukTest::Pact.host(:made_up_api) }
        .to raise_error("No Pact configuration found for API made_up_api")
    end
  end
end
