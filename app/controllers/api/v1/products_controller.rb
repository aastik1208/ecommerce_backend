# Author:: Ankit Bansal
module Api
  module V1
    class ProductsController < BaseController

      before_action :get_attr_obj, only: [:add_like, :remove_like]
      before_action :set_relatable_type, only: [:add_review, :all_reviews]

      def product_list
        products = Brandsday::ProductService.new.products(params)
        render_success(Api::V1::Products::ListSerializer.new(products), "")
      end

      def add_review
        review = current_customer.reviews.new({
          relatable_type: @relatable_type,
          relatable_id: params[:product_id],
          comment: params[:comment],
        })

        if review.save
          render_success(Api::V1::ReviewSerializer.new(review), "")
        else
          render_error({ errors: review.errors.full_messages }, "Review Creation Failed")
        end
      end

      def all_reviews
        reviews = App.get_product_reviews(@relatable_type, params[:product_id])
        render_collection(reviews, Api::V1::ReviewSerializer)
      end

      def viewed
        # @attr_obj.increment_counter(:views_count)
        # render_success({}, "")
      end

      def add_to_cart
        # @attr_obj.increment_counter(:carts_count)
        # render_success({}, "")
      end

      def remove_from_cart
        # @attr_obj.increment_counter(:carts_count)
        # render_success({}, "")
      end

      def add_like
        @attr_obj.increment!(:likes_count)
        render_success({}, "")
      end

      def remove_like
        @attr_obj.decrement!(:likes_count)
        render_success({}, "")
      end

      def product_by_sku
        products = Brandsday::ProductService.new.productBySku(params.merge(oauth_token: current_account.oauth_token))
          render json: {
            success: true,
            products: products
          }
      end

      def child_product
        render json: {success: false, message: 'Please provide sku' } and return unless params[:sku].present?
        products = Brandsday::ProductService.new.childProducts(params.merge(oauth_token: current_account.oauth_token))
          render json: {
            success: true,
            products: products
          }
      end

      def searchByName
        result = Brandsday::ProductService.new.productSearch(params.merge(oauth_token: current_account.oauth_token))
        @items = Item.where(content_id: result["items"].pluck("id")).page(params[:page])
          render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def featuredProduct
        result = Brandsday::ProductService.new.featured_products(params.merge(oauth_token: current_account.oauth_token))
        @items = Item.product.where(content_id: result["items"].pluck("id")).page(params[:page])
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def arrivalProduct #new arrival products
        result = Brandsday::ProductService.new.new_arrival_product(params.merge(oauth_token: current_account.oauth_token))
        @items = Item.product.where(content_id: result["items"].pluck("id")).page(params[:page])
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      private

      def get_attr_obj
        @attr_obj = current_customer.catalogue_product_attrs.first_or_create(product_id: params[:product_id])
      end

      def set_relatable_type
        @relatable_type = params[:post_type].presence || 'Product'

        unless ['UserPost', 'Product'].include?(@relatable_type)
          render_error({error: true}, "Wrong post_type.")
        end
      end
    end
  end
end
