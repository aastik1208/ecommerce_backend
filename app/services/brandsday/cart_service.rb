module Brandsday
  class CartService < BaseService

     RELATIVE_PATHS = {
      get_cart_id: '/rest/V1/carts/mine',
      add_product: '/rest/V1/carts/mine/items',
      get_cart: '/rest/V1/carts/mine',
      billing_address: '/rest/V1/carts/mine/billing-address',
      shipping_info: '/rest/V1/carts/mine/shipping-information',
      shipping_methods: '/rest/V1/carts/mine/shipping-methods',
      estimate_shipping_costs: '/rest/V1/carts/mine/estimate-shipping-methods',
      payment_info: '/rest/V1/carts/mine/payment-information',
      cart_total: '/rest/V1/carts/mine/totals',
      add_coupon: '/rest/V1/carts/mine/coupons',
      remove_coupon: '/rest/V1/carts/mine/coupons'
    }

    def get_user_cart(oauth_token)
      service = HttpService::Connection.new(get_url(:get_cart_id))
      service.post_json({}, admin_auth_headers(oauth_token))
    end

    def cart_details(oauth_token)
      service = HttpService::Connection.new(get_url(:get_cart))
      service.get_json(admin_auth_headers(oauth_token))
    end

    def add_to_cart(params, oauth_token)
      service = HttpService::Connection.new(get_url(:add_product))
      service.post_json(cart_data(params), admin_auth_headers(oauth_token))
    end

    def update_cart(params, oauth_token)
      url = get_url(:add_product)
      service = HttpService::Connection.new("#{url}/#{params[:product_id]}")
      service.put_json(update_cart_data(params), admin_auth_headers(oauth_token))
    end

    def delete_product_from_cart(params, oauth_token)
      url = get_url(:add_product)
      service = HttpService::Connection.new("#{url}/#{params[:product_id]}")
      service.delete_json(admin_auth_headers(oauth_token))
    end

    def cart_total(oauth_token)
      service = HttpService::Connection.new(get_url(:cart_total))
      service.get_json(admin_auth_headers(oauth_token))
    end

    def add_billing_address(params, oauth_token)
      service = HttpService::Connection.new(get_url(:billing_address))
      service.post_json(billing_params(params), admin_auth_headers(oauth_token))
    end

    def add_shipping_info(params, oauth_token)
      service = HttpService::Connection.new(get_url(:shipping_info))
      service.post_json(address_information(params), admin_auth_headers(oauth_token))
    end

    def get_shipping_methods(oauth_token)
      service = HttpService::Connection.new(get_url(:shipping_methods))
      service.get_json(admin_auth_headers(oauth_token))
    end

    def estimate_shipping_cost(params, oauth_token)
      service = HttpService::Connection.new(get_url(:estimate_shipping_costs))
      service.post_json(estimate_shipping_cost_params(params) , admin_auth_headers(oauth_token))
    end

    def payment_info(params, oauth_token)
      service = HttpService::Connection.new(get_url(:payment_info))
      service.post_json(payment_method_params(params), admin_auth_headers(oauth_token))
    end

    def update_coupon_to_cart(params, oauth_token)
      url = get_url(:add_coupon)
      service = HttpService::Connection.new("#{url}/#{params[:coupon_name]}")
      service.put_json(update_cart_data(params), admin_auth_headers(oauth_token))
    end

    def remove_coupon_from_cart(oauth_token)
      url = get_url(:remove_coupon)
      service = HttpService::Connection.new("#{url}/")
      service.delete_json(admin_auth_headers(oauth_token))
    end

    def cart_data params
      {
        cart_item: {
          quote_id: params[:cart_id],
          sku: params[:sku],
          qty: params[:quantity]
        }
      }
    end

    def update_cart_data params
      {
        cartItem: {
          quote_id: params[:cart_id],
          sku: params[:sku],
          qty: params[:quantity]
        }
      }
    end

    def billing_params params
      {
        address: address_hash(params[:address]),
        useForShipping: params[:useForShipping]
      }
    end

    def address_information params
      {  
        addressInformation: {
          shipping_address: shipping_address_hash(params[:addressInformation][:shipping_address]),
          billing_address: shipping_address_hash(params[:addressInformation][:billing_address]),
          shipping_carrier_code: params[:addressInformation][:shipping_carrier_code],
          shipping_method_code: params[:addressInformation][:shipping_method_code]
        }
      }
    end

    def payment_method_params params
      {
        paymentMethod: {
          method: params[:paymentMethod][:method]
        },
        billing_address: shipping_address_hash(params[:billing_address])
      }
    end

    def estimate_shipping_cost_params params
      {
        address: shipping_address_hash(params[:address]) 
      }
    end

    def shipping_address_hash params
      {
        city: params[:city],
        region_id: params[:region_id],
        region_code: params[:region_code],
        country_id: params[:country_id],
        email: params[:email],
        firstname: params[:firstname],
        lastname: params[:lastname],
        postcode: params[:postcode],
        region: params[:region],
        street: params[:street],
        telephone: params[:telephone]
      }
    end

    def address_hash params
      {
        city: params[:city],
        company: params[:company],
        countryId: params[:countryId],
        email: params[:email],
        firstname: params[:firstname],
        lastname: params[:lastname],
        postcode: params[:postcode],
        region: params[:region],
        saveInAddressBook: params[:saveInAddressBook],
        street: params[:street],
        telephone: params[:telephone]
      }
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end

  end
end
