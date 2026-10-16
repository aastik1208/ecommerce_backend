module Brandsday
  class ProductService < BaseService

    RELATIVE_PATHS = {
      product_detail: '/rest/V1/products-render-info?storeId=1&currencyCode=AED&searchCriteria=',
      fetch_new_products: '/rest/V1/products?searchCriteria[sortOrders][0][field]=updated_at',
      fetch_products_by_sku: '/rest/V1/products',
      fetch_child_products: '/rest/V1/configurable-products',
      fetch_products: '/rest/V1/products',
      abandoned_product: '/rest/V1/sellers/cart/products',
      featured_product:  '/rest/V1/products',
      arrival_product: '/rest/V1/products'
    }

    def products(opts)
      token = AdminService.new.login
      service = HttpService::Connection.new(get_url(:product_detail))
      service.get_json(admin_auth_headers(token))["items"]
    end

    def fetch_new_products
      service = HttpService::Connection.new(get_url(:fetch_new_products))
      service.get_json(basic_auth_headers)["items"]
    end

    def productBySku(params)
      query_params = params[:sku]
      url = get_url(:fetch_products_by_sku)
      service = HttpService::Connection.new("#{url}/#{query_params}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def childProducts(params)
      url = get_url(:fetch_child_products)
      service = HttpService::Connection.new("#{url}/#{params[:sku]}/children")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def productSearch(params)   #by name
      query_params = product_search_params(params)
      url = get_url(:fetch_products)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def abandonedProduct(params)  # declined list of product of seller
      url = get_url(:abandoned_product)
      service = HttpService::Connection.new("#{url}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def featured_products(params)
      query_params = featured_product_params(params)
      url = get_url(:featured_product)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def new_arrival_product(params)
      query_params = arrival_product_params(params)
      url = get_url(:arrival_product)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    private

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end

    def product_search_params(params)
      currentPage = params[:current_page].present? ? params[:current_page] : 1
      pageSize = params[:page_size].present? ? params[:page_size] : 10
      search_params = ""
      params[:by_name].each_with_index do |value, index|
        search_params +=  "searchCriteria[filter_groups][0][filters][#{index}][field]=name&searchCriteria[filter_groups][0][filters][#{index}][value]=%#{value["name"]}%&searchCriteria[filter_groups][0][filters][#{index}][condition_type]=like&"
      end
      search_params + "searchCriteria[pageSize]=#{pageSize}&searchCriteria[currentPage]=#{currentPage}"
    end

    def featured_product_params(params)
      currentPage = params[:current_page].present? ? params[:current_page] : 1
      pageSize = params[:page_size].present? ? params[:page_size] : 10
      "searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=#{params[:category_id]}&searchCriteria[filter_groups][0][filters][0][condition_type]=eq&searchCriteria[filter_groups][1][filters][0][field]=website_id&searchCriteria[filter_groups][1][filters][0][value]=1&searchCriteria[filter_groups][1][filters][0][condition_type]=eq&searchCriteria[pageSize]=#{pageSize}&searchCriteria[currentPage]=#{currentPage}"
    end

    def arrival_product_params(params)
      pageSize = params[:page_size].present? ? params[:page_size] : 10
      "searchCriteria[filterGroups][0][filters][0][field]=category_id&searchCriteria[filterGroups][0][filters][0][value]=#{params[:category_id]}&searchCriteria[sortOrders][0][field]=updated_at&searchCriteria[pageSize]=#{pageSize}"
    end
  end
end
