module Api
  module V1
    class OrdersController < BaseController

    	def my_orders
        data = Brandsday::OrderService.new.my_order(params, current_customer)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
    	end

    	def cancel
        data = Brandsday::OrderService.new.cancel(params, current_customer.oauth_token)
        if data != true && data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
    	end

    	def return
        data = Brandsday::OrderService.new.return(params, current_customer.oauth_token)
        data = data["items"].to_a.reverse.to_h
        if data[0]["message"].present? && data[0]["status"] == "Failure"
          render json: { error: data[0]["message"] }, status: 422          
        else
          render json: { success: data[0]["message"] }, status: 200  
        end
    	end

      def order_addresses
        data = Brandsday::OrderService.new.order_addresses(params, current_customer.oauth_token)
        if data["message"].present?
          render json: { error: data["message"] }, status: 422
        else
          render json: data
        end
      end

      def status_timeline
        data = Brandsday::OrderService.new.status_timeline(params, current_customer.oauth_token)
        if data[0]["message"].present?
          render json: { error: data[0]["message"] }, status: 422
        else
          render json: data
        end
      end
    end
  end
end