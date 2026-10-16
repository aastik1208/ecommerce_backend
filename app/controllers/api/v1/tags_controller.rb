module Api
  module V1
    class TagsController < BaseController
      before_action :set_account, only: [:index]

      def index
        @items = Item.tagged_items(@account).
                  page(params[:page])
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      private
      
      def set_account
        if params[:account_id].present?
          @account = Account.find_by(id: params[:account_id])
        else
          @account = current_account
        end
      end

    end
  end
end
