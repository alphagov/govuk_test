module GovukTest
  class Pact
    PACT_APP_PORTS = {
      publishing_api: 3001,
      organisation_api: 3002,
      bank_holidays_api: 3003,
      account_api: 3004,
    }

    def self.host(api)
      "http://localhost:#{host_port(api)}"
    end

    def self.host_port(api)
      raise "No Pact configuration found for API #{api}" unless PACT_APP_PORTS[api]

      PACT_APP_PORTS[api]
    end
  end
end
