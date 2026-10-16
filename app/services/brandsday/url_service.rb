module Brandsday
  class UrlService

    RELATIVE_PATHS = {
      customer_signup: "/rest/V1/customers",
      customer_login: "/rest/V1/integration/customer/token",
    }

    def get(type)
      "#{get_base_url}#{RELATIVE_PATHS[:type]}"
    end

    private

    def get_base_url
      "https://staging.brandsday.com"
    end
  end
end
