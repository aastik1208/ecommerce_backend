# Author:: Ankit Bansal
module Api
  module V1
    class BaseController < ApiController
      skip_before_action :authenticate_account!, only: [:healthcheckup, :all_profile_info]

      def healthcheckup
        render json: {}
      end

      def all_profile_info
        render_success({
          countries: Brandsday::AppService.new.get_countries,
          brands: Brandsday::AppService.new.get_brands,
          categories: Brandsday::AdminService.new.get_categories
        }, "")
      end

      def validate_app_token!
        unless ("08970a7a4b0762bbb39d69b0d6d64252" ==  request.headers["X-APP-TOKEN"])
          render_error({message: "#{I18n.t('x_app_token')}"})
        end
      end

      def pagination_meta(object)
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.previous_page,
          total_pages: object.total_pages,
          total_count: object.total_entries
        }
      end
    end
  end
end
