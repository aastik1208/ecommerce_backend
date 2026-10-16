module Brandsday
  class AppService < BaseService

    RELATIVE_PATHS = {
      countries: "/rest/V1/directory/countries",
      brands: "/rest/V1/api/brands/list"
    }

    def get_countries
      Rails.cache.fetch("get_api_countries", expires_in: 1.hour) do
        get_api_countries
      end
    end

    def get_brands
      Rails.cache.fetch("get_api_brands", expires_in: 1.hour) do
        get_api_brands
      end
    end

    private

    def get_api_countries
      service = HttpService::Connection.new(get_url(:countries))
      data = service.get_json(basic_auth_headers)
      data.map { |h| h.slice("id", "full_name_english") }
    end

    def get_api_brands
      service = HttpService::Connection.new(get_url(:brands))
      data = service.get_json(basic_auth_headers)["items"]
      data.map do |brand|
        {
          id: brand["entity_id"],
          brand_title: brand["brand_title"],
          brand_attr_value: brand["brand_attr_value"],
          brand_description: brand["brand_description"],
          brand_image: "#{PublicConstant::APP_URL}/pub/media/#{brand['brand_image']}",
          brand_logo: "#{PublicConstant::APP_URL}/pub/media/#{brand['brand_logo']}",
        }
      end
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end
  end
end