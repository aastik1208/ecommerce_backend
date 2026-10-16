module Api
  module V1
    class WishlistsController  < BaseController
      before_action :load_wishlist
      before_action :authorize_account, only: [:add_item, :remove_item]
      before_action :load_item, only: [:remove_item]

      def index
        result = Item.where(id: @wishlist.wishlisted_items.pluck(:item_id)).order('updated_at DESC')
        if params[:query].present?
          product_params = {:by_name =>[{'name' => params[:query]}]}
          search_result = Brandsday::ProductService.new.productSearch(product_params.merge(oauth_token: current_account.oauth_token))
          item_ids = result.collect(&:content_id)
          search_result_item_ids = search_result["items"].pluck("id")
          common_ids = search_result_item_ids & item_ids
          @items = Item.where(content_id: common_ids).page(params[:page])
        else
          @items = result.page(params[:page])
        end
        render json: @items,
              each_serializer: ItemSerializer,
              meta: pagination_meta(@items),
              adapter: :json
      end

      def add_item
        item = @wishlist.wishlisted_items.new(item_id: params[:item_id], account_id: current_account.id)
        if item.save
          render_success({message: "#{I18n.t('wishlist.item_added')}"}, "")
        else
          render json: { errors: item.errors.full_messages.join(', ') }, status: 422
        end
      end

      def remove_item
        if @item.delete
          render_success({message: "#{I18n.t('wishlist.item_removed')}"}, "")
        else
          render json: { errors: @item.errors.full_messages.join(', ') }, status: 422
        end
      end

      private

      def load_wishlist
        get_account = load_account
        account = get_account.present? ? get_account : current_account
        @wishlist = account.wishlists.find_or_create_by(account_id: account.id)
      end

      def load_item
        @item = @wishlist.wishlisted_items.where(item_id: params[:item_id]).last
         unless @item.present?
          render_error({ message: "#{I18n.t('wishlist.item_not_found')}" })
        end
      end

      def load_account
        return false unless params[:account_id].present?
        @account = Account.find_by(id: params[:account_id])
        return @account if @account.present?
      end

      def authorize_account
        return true unless params[:account_id].present?
        render_error({ message: "#{I18n.t('wishlist.no_access')}" }) unless(current_account.id == @account.id)
      end

    end
  end
end
