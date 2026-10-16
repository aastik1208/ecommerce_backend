module Brandsday
  class BannerService < BaseService

     RELATIVE_PATHS = {
      get_slider: '/rest/V1/categories',
      get_banner: '/rest/V1/api/bannersliders',
      get_category: '/rest/V1/categories',
      get_image: '/media/catalog/category'
    }

    def sliderId(oauth_token, params)
      url = get_url(:get_slider)
      service = HttpService::Connection.new("#{url}/#{params[:category_id]}")
      service.get_json(admin_auth_headers(oauth_token))
    end

    def fetchBanners(oauth_token, params)
      url = get_url(:get_banner)
      service = HttpService::Connection.new("#{url}/#{params[:slider_id]}")
      service.get_json(admin_auth_headers(oauth_token))
    end

    def fetchCategory(oauth_token, params)
      category_img_details = []
      category_ids = params[:category_id].split(',').map{|n|eval n}
      category_ids.each do |category_id|
        url = get_url(:get_category)
        service = HttpService::Connection.new("#{url}/#{category_id}")
        result = service.get_json(admin_auth_headers(oauth_token))

        if (result["custom_attributes"] && result["custom_attributes"][11]).present? && result["custom_attributes"][11]["attribute_code"] == "thumbnail"
                          category_img_details << {
                                        id:  result["id"],
                                        label: result["name"],
                                        img_url: "https://staging.brandsday.com/media/catalog/category/#{result["custom_attributes"][11]["value"]}"
                                        }
        else
                          category_img_details << {
                                        id:  result["id"],
                                        label: result["name"],
                                        img_url: ""
                                        }
        end
      end
      return category_img_details
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end
  end
end
