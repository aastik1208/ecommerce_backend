module Brandsday
  class BaseService

    attr_reader :base_url, :basic_auth_headers

    def initialize
      @base_url = PublicConstant::APP_URL
      @basic_auth_headers = get_basic_auth_headers
    end

    private

    def admin_auth_headers(token)
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer " + token
      }
    end

    def get_basic_auth_headers
      client_id = "test"
      client_secret = "test123@"
      get_pass_value = client_id + ":" + client_secret
      base_token = Base64.encode64(get_pass_value).gsub!("\n", '')

      {
        "Content-Type" => "application/json",
        "Authorization" => "Basic " + base_token
      }
    end
  end
end
