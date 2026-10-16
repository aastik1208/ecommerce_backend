module Brandsday
  class AdminService < BaseService

    RELATIVE_PATHS = {
      admin_login: "/rest/V1/integration/admin/token",
      categories: "/rest/V1/categories"
    }

    def login
      service = HttpService::Connection.new(get_url(:admin_login))
      service.post_json(login_data, basic_auth_headers)
    end

    def get_categories
      Rails.cache.fetch("get_api_categories", expires_in: 1.hour) do
        get_api_categories
      end
    end

    private

    def login_data
      {
        username: "decabits",
        password: "Bd#!2021"
      }
    end

    def password_email_data(params)
      {
        email: params[:email],
        template: params[:template]
      }
    end

    def password_reset_params(params)
      {
        email: params[:email],
        resetToken: params[:reset_token],
        newPassword: params[:new_password]
      }
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end

    def get_api_categories
      data = all_categories

      data["children_data"].map do |category|
        {
          id: category["id"],
          name: category["name"],
          is_active: category["is_active"],
          product_count: category["product_count"]
        }
      end
    end

    def all_categories
      token = login
      service = HttpService::Connection.new(get_url(:categories))
      service.get_json(admin_auth_headers(token))
    end
  end
end