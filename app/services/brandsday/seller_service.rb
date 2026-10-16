module Brandsday
  class SellerService < BaseService

    RELATIVE_PATHS = {
      signup_url: "/rest/V1/mpapi/sellers/create",
      get_products: "/rest/V1/mpapi/sellers/me/product",
      order_till_date: "/rest/V1/mpapi/sellers/orders",
      fetch_products: '/rest/V1/products',
    }

    def signup(params)
      service = HttpService::Connection.new(get_url(:signup_url))
      data = service.post_json(signup_data(params), basic_auth_headers)
      parse_response(service, data)
    end

    # def sellerProducts(params)
    #   url = get_url(:get_products)
    #   service = HttpService::Connection.new("#{url}")
    #   data = service.get_json(admin_auth_headers(params[:oauth_token]))
    # end

    def sellerProducts(params)  
      query_params = seller_product_params(params)
      url = get_url(:fetch_products)
      url = "#{url}?#{query_params}"
      url = URI.escape(url) unless url.ascii_only?
      service = HttpService::Connection.new(url)
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def orderTillDate(params)
      query_params = till_date_params(params)
      url = get_url(:order_till_date)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      data = service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    private

    def till_date_params(params)
      current_page = params[:current_page].present? ? params[:current_page] : 1
      page_size = params[:page_size].present? ? params[:page_size] : 10
      "id=#{params[:seller_id]}&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
    end

    def seller_product_params(params)
      currentPage = params[:current_page].present? ? params[:current_page] : 1
      pageSize = params[:page_size].present? ? params[:page_size] : 100000
      "searchCriteria[filter_groups][0][filters][0][value]=#{params[:seller_id]}&searchCriteria[filter_groups][0][filters][0][field]=seller_id&searchCriteria[filter_groups][0][filters][0][condition_type]=eq&searchCriteria[pageSize]=#{pageSize}&searchCriteria[currentPage]=#{currentPage}"
    end

    def parse_response(service, data)
      code = service.response.code.to_i
      { code: code, data: data, success: code == 200  }
    end

    def signup_data(params)
      {
        customer: {
          email: params[:email],
          firstname: params[:firstname],
          lastname: params[:lastname],
          storeId: 1,
          websiteId: 1
        },
        password: params[:password],
        is_seller: params[:is_seller],
        profileurl: params[:email],   #it should be uniq
        registered: 0
      }
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end

  end
end
