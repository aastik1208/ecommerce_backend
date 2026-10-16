module Api
  module V1
    class BannersController < BaseController

      def sliders
        response = Brandsday::BannerService.new.sliderId(current_customer.oauth_token, params)
        render json: response
      end

      def index
        response = Brandsday::BannerService.new.fetchBanners(current_customer.oauth_token, params)
        render json: response
      end

      def cagegory_logo
        response = Brandsday::BannerService.new.fetchCategory(current_customer.oauth_token, params)
        render json: response
      end

    end
  end
end
