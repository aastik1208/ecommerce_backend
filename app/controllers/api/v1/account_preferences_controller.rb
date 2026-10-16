module Api
  module V1
    class AccountPreferencesController < BaseController

      before_action :validate_preferences, only: :create

      def index
        result = current_account.account_preferences.uniq { |x| x.magento_category_id }
        render_success({preferences: result}, "")
      end

      def preferences
        service = Brandsday::CustomerService.new.categories_listing(oauth_token: current_customer.oauth_token)
        render_success({preferences: service}, "")
      end

      def create
        render json: { success: true }
      end

      def remove
        current_account.remove_preferences(params)
        render json: { success: true }
      end

      def store
        @result = current_account.get_store.page(params[:page])
        render json: @result,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@result),
                adapter: :json
      end

      def global_store
        @result = current_account.get_global_store(params).page(params[:page])
        render json: @result,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@result),
                adapter: :json

      end

      private

      def validate_preferences
        @errors = []
        @selected_categories = current_account.account_preferences.pluck(:magento_category_id)
        params[:preferences].each do |obj|
          unless @selected_categories.include?(obj[:magento_category_id])
            AccountPreference.create(magento_category_id: obj[:magento_category_id],
                                      account_id: current_account.id,
                                      parent_id: obj[:parent_id],
                                      level: obj[:level],
                                      created_at: DateTime.now,
                                      updated_at: DateTime.now)
          end
        end
      end

    end
  end
end
