module Api
  module V1
    class SellersController < BaseController

      skip_before_action :authenticate_account!, only: [:create, :update]
      before_action :validate_app_token!, only: [:create, :update]

      def create
        seller = Seller.new(seller_params.merge(provider: "email"))
        if seller.save!
          render json: {success: true }
        else
          render json: {success: false, errors: seller.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        seller = Seller.find_by(magento_id: seller_params[:magento_id])
        render json: {success: false, message: "Invalid seller" }, status: :unprocessable_entity and return unless seller.present?
        if seller.update(seller_params)
          render json: {success: true }
        else
          render json: {success: false, errors: seller.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # def products   #seller products
      #   seller = Seller.find_by(id: params[:seller_id])
      #   render json: {success: false, message: "Invalid seller" }, status: :unprocessable_entity and return unless seller.present?
      #   render json: {success: false, message: "Please login using this seller #{seller.id}" }, status: :unprocessable_entity and return unless seller.oauth_token.present?
      #   result = Brandsday::SellerService.new.sellerProducts(params.merge(oauth_token: seller.oauth_token))
      #   render json: {success: false, message: "#{result[0]["error"]}" }, status: :unprocessable_entity and return if result[0]["error"].present?
      #   @items = Item.product.where(content_id: result[0]["items"].pluck("mageproduct_id")).page(params[:page])
      #   render json: @items,
      #           each_serializer: ItemSerializer,
      #           meta: pagination_meta(@items),
      #           adapter: :json
      # end

      def products   #seller products
        result = Brandsday::SellerService.new.sellerProducts(params.merge(oauth_token: current_account.oauth_token))
        @items = Item.parent_product.where(content_id: result["items"].pluck("id")).page(params[:page])
          render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def abandoned_products
        result = Brandsday::ProductService.new.abandonedProduct(params.merge(oauth_token: current_account.oauth_token))  # "hes2vmzo81bxmtmtun5kdhn1k6bhdqxj"
        render json: {success: false, message: "#{result["message"]}" }, status: :unprocessable_entity and return unless (result[0].class == Integer)
        @items = Item.includes(:content).where( content_type: "Magento::Product", content_id: result ).order('updated_at DESC').page(params[:page])
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      private

      def seller_params
        params.require(:seller).permit(
          :email, :firstname,
          :lastname, :provider,
          :magento_id, :phone_number,
          :oauth_token, :is_seller
          )
      end

    end
  end
end
