module Brandsday
  class OrderService < BaseService

    RELATIVE_PATHS = {
      my_order: '/rest/V1/myorders',
      return: '/rest/V1/api/OrderReturns',
      cancel: '/rest/V1/cancelorder',
      timeline: '/rest/V1/order/status/timeline',
      order_address: '/rest/V1/orderAddresses'
    }

    def my_order(params, customer)
      query_params = my_order_params(params, customer.magento_id)
      url = get_url(:my_order)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      service.get_json(admin_auth_headers(customer.oauth_token))
    end

    def cancel(params, oauth_token)
      url = get_url(:cancel)
      service = HttpService::Connection.new(("#{url}/#{params[:id]}"))
      service.post_json({}, admin_auth_headers(oauth_token))
    end

    def return(params, oauth_token)
      url = get_url(:return)
      service = HttpService::Connection.new(("#{url}/#{params[:id]}"))
      service.post_json({}, admin_auth_headers(oauth_token))
    end

    def status_timeline(params, oauth_token)
      url = get_url(:timeline)
      service = HttpService::Connection.new(("#{url}/#{params[:id]}"))
      service.post_json({}, admin_auth_headers(oauth_token))
    end

    def my_order_params params, customer_id
      if params[:status].present? 
         "searchCriteria[filterGroups][0][filters][0][field]=customer_id&searchCriteria[filterGroups][0][filters][0][value]=#{customer_id}&searchCriteria[filterGroups][0][filters][0][condition_type]=eq&searchCriteria[currentPage]=#{params[:page]}&searchCriteria[pageSize]=#{params[:page_size]}&searchCriteria[filterGroups][1][filters][1][field]=status&searchCriteria[filterGroups][1][filters][1][value]=#{params[:status]}&searchCriteria[filterGroups][1][filters][1][condition_type]=eq"
      else
        "searchCriteria[filterGroups][0][filters][0][field]=customer_id&searchCriteria[filterGroups][0][filters][0][value]=#{customer_id}&searchCriteria[filterGroups][0][filters][0][condition_type]=eq&searchCriteria[currentPage]=#{params[:page]}&searchCriteria[pageSize]=#{params[:page_size]}"
      end
    end

    def order_addresses(params, oauth_token)
      query = "searchCriteria[filterGroups][0][filters][0][field]=parent_id&searchCriteria[filterGroups][0][filters][0][value]=#{params[:id]}&searchCriteria[filterGroups][0][filters][0][condition_type]=eq"
      url = get_url(:order_address)
      service = HttpService::Connection.new("#{url}?#{query}")
      service.get_json(admin_auth_headers(oauth_token))
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end

  end
end