module Api
  module V1
    class StoresController < BaseController
      def index
        @result = current_account.get_store(params).page(params[:page])
        render json: @result,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@result),
                adapter: :json
      end

      def specifications
        @specifications = Brandsday::CustomerService.new.get_filtes(params.merge(oauth_token: current_account.oauth_token))
        render json: @specifications
      end

    end
  end
end
