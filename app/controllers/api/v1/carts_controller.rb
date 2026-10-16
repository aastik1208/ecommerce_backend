module Api
  module V1
    class CartsController < BaseController
      include CartHelper

      def get_cart_id
        cart_id = Brandsday::CartService.new.get_user_cart(current_customer.oauth_token)
        render json: {
          cart_id: cart_id
        }
      end

      def cart_details
        response = Brandsday::CartService.new.cart_details(current_customer.oauth_token)
        if response["message"].present?
          render json: { error: response["message"] }, status: 422
        else
          result = post_process_cart(response)
          render json: response
        end
      end

      def add_to_cart
        data = Brandsday::CartService.new.add_to_cart(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def update_item_to_cart
        data = Brandsday::CartService.new.update_cart(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def delete_item_from_cart
        data = Brandsday::CartService.new.delete_product_from_cart(params, current_customer.oauth_token)
        if data != true && data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def cart_total
        response = Brandsday::CartService.new.cart_total(current_customer.oauth_token)
        if response["message"].present?
          render json: { error: response["message"] }, status: 422
        else
          render json: response
        end
      end

      def add_billing_address
        data = Brandsday::CartService.new.add_billing_address(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def add_shipping_info
        data = Brandsday::CartService.new.add_shipping_info(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def estimate_shipping_cost
        data = Brandsday::CartService.new.estimate_shipping_cost(params, current_customer.oauth_token)
        render json: data
      end

      def payment_info
        data = Brandsday::CartService.new.payment_info(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def get_shipping_methods
        response = Brandsday::CartService.new.get_shipping_methods(current_customer.oauth_token)
        render json: response
      end

      def apply_coupon
        response = Brandsday::CartService.new.update_coupon_to_cart(params, current_customer.oauth_token)
        render json: response
      end

      def remove_coupon
        response = Brandsday::CartService.new.remove_coupon_from_cart(current_customer.oauth_token)
        render json: response
      end
    end
  end
end
