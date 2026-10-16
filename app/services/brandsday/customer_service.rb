module Brandsday
  class CustomerService < BaseService

    RELATIVE_PATHS = {
      customer_signup: "/rest/V1/customers",
      customer_login: "/rest/V1/integration/customer/token",
      customer_password_email: "/rest/V1/customers/password",
      customer_password_reset: "/rest/V1/customers/resetPassword",
      update_profile: "/rest/V1/customers/me",
      set_address: "/rest/V1/addaddresses",
      update_cutomer_address: 'rest/V1/customers/me',
      set_shiping_address: "/rest/V1/carts/mine/shipping-information",
      change_password: "rest/V1/customers/me/password",
      set_country: "/rest/V1/directory/countries/",
      get_categories: "/rest/V1/getcategories",
      get_products: "/rest/V1/products",
      get_filters: "/rest/V1/getFilters",
      get_account_details: "/rest/V1/mpapi/sellers/me"
    }

    def signup(params)
      service = HttpService::Connection.new(get_url(:customer_signup))
      data = service.post_json(signup_data(params), basic_auth_headers)
      parse_response(service, data)
    end

    def login(params)
      service = HttpService::Connection.new(get_url(:customer_login))
      data = service.post_json(login_data(params), basic_auth_headers)
      parse_response(service, data)
    end

    def password_email(params)
      service = HttpService::Connection.new(get_url(:customer_password_email))
      data = service.put_json(password_email_data(params), basic_auth_headers)
      { code: 200, data: data, success: true  }
    end

    def update_profile(params)
      service = HttpService::Connection.new(get_url(:update_profile))
      data = service.put_json(update_profile_data(params), admin_auth_headers(params[:oauth_token]))
    end

    def get_profile(params)
      service = HttpService::Connection.new(get_url(:update_profile))
      data = service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def create_address(params)
      service = HttpService::Connection.new(get_url(:set_address))
      data = service.post_json(set_address_data(params), admin_auth_headers(params[:oauth_token]))
    end

    def update_address(params)
      service = HttpService::Connection.new(get_url(:update_cutomer_address))
      data = service.put_json(params, admin_auth_headers(params[:oauth_token]))
    end

    def reset_password(params)
      @email= params[:email]
      @passwd= params[:password]
      @salt=Digest::MD5.new.hexdigest  (Random.rand * 100).to_i.to_s
      ActiveRecord::Base.connection.execute("UPDATE customer_entity SET password_hash = CONCAT(SHA2(CONCAT('#{@salt}', '#{@passwd}'), 256), ':', '#{@salt}', ':1') WHERE email = '#{@email}';")
    end

    def country_listing(params)
      service = HttpService::Connection.new(get_url(:set_country))
      data = service.get_json(params, admin_auth_headers(params[:oauth_token]))
    end

    def categories_listing(params)
      service = HttpService::Connection.new(get_url(:get_categories))
      data = service.get_json(params, admin_auth_headers(params[:oauth_token]))
    end

    def get_product_details_for_store(params)
      query_params = category_search_params(params)
      url = get_url(:get_products)
      service = HttpService::Connection.new("#{url}?#{query_params}")
      service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    def get_filtes(params)
      url = get_url(:get_filters)
      service = HttpService::Connection.new("#{url}/#{params[:category_id]}")
      data = service.post_json(params[:category_id], admin_auth_headers(params[:oauth_token]))
    end

    def details_of_account(params)
      url = get_url(:get_account_details)
      service = HttpService::Connection.new("#{url}")
      data = service.get_json(admin_auth_headers(params[:oauth_token]))
    end

    private

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
          websiteId: 1,

        extension_attributes: {
            is_subscribed: true,
            is_requested_for_influencer: params[:requested_influencer]
            }
      },
        password: params[:password],
      }
    end

    def login_data(params)
      {
        username: params[:username],
        password: params[:password]
      }
    end

    def password_email_data(params)
      {
        email: params[:email],
        template: params[:template]
      }
    end

    def password_reset_params(params)
      {
        email: params[:email],
        resetToken: params[:reset_token],
        newPassword: params[:new_password]
      }
    end

    def update_profile_data(params)
      {
        customer: {
            email: params[:email],
            firstname: params[:firstname],
            lastname: params[:lastname],
            website_id: 1
          }
      }
    end

    def set_address_data(params)
      {
        address:{
          customer_id: params[:customer_id],
          defaultShipping: params[:defaultShipping],
          defaultBilling: params[:defaultBilling],
          region: params[:region],
          country_id: params[:country_id],
          street: ["#{params[:street]}"],
          postcode: params[:postcode],
          city: params[:city],
          firstname: params[:firstname],
          lastname: params[:lastname],
          telephone: params[:telephone],
          countryId: params[:country_id]
        }
      }

    end

    def reset_password_data(params)
      {
        customer_id: params[:magento_id].to_i,
        current_password: params[:old_password],
        new_password: params[:new_password]
      }
    end

    def category_search_params params
      page_size = params[:page_size].present? ? params[:page_size] : 1000
      current_page = params[:current_page].present? ? params[:current_page] : 1
      if params[:global_store].present? && params[:category_ids].blank?
        search_params = ""
        if params[:filter_by].present?
          params[:filter_by].each do |obj|
            obj[1].each do |objj|
              search_params +=  "searchCriteria[filter_groups][#{objj[0].to_i}][filters][#{objj[0].to_i}][field]=#{objj[1]["name"]}&searchCriteria[filter_groups][#{objj[0].to_i}][filters][#{objj[0].to_i}][value]=#{objj[1]["value"]}&searchCriteria[filter_groups][#{objj[0].to_i}][filters][#{objj[0].to_i}][condition_type]=in&"
            end
          end
          if params[:sort_by].present?  #sort filter with fiter according to attributes
            return sort_after_filter(search_params, params, page_size, current_page)
          else
            return search_params+"&searchCriteria[filter_groups][1][filters][0][field]=website_id&searchCriteria[filter_groups][1][filters][0][value]=1&searchCriteria[filter_groups][1][filters][0][condition_type]=eq&"+"&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
          end
        end
        if params[:sort_by].present?
          sort_with_price(params, page_size, current_page)
        else
          return "&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
        end
      else #according to preferences
        "searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=#{params[:category_ids].join(",")}&searchCriteria[filter_groups][0][filters][0][condition_type]=in&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
      end
    end

    def sort_after_filter(search_params_, params, page_size, current_page)
      if params[:sort_by][:price_desc].present?
        sort_by_price(search_params_, params, page_size, current_page)
      elsif(params[:sort_by][:price_asc].present?)
        sort_by_price(search_params_, params, page_size, current_page)
      elsif(params[:sort_by][:newest_first].present?)
        sort_by_newest(search_params_, params, page_size, current_page)
      elsif(params[:sort_by][:popularity].present?)
        sort_by_popularity(search_params_, params, page_size, current_page)
      else
        return "searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
      end
    end

    def sort_with_price(params, page_size, current_page)
      sort = params[:sort_by][:price_desc].present? ? "DESC" : "ASC"
        return "searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=#{sort}&searchCriteria[filter_groups][0][filters][1][field]=website_id&searchCriteria[filter_groups][0][filters][1][value]=1&searchCriteria[filter_groups][0][filters][1][condition_type]=eq"+"&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
    end

    def sort_by_newest(search_params_, params, page_size, current_page)
      return search_params_+"searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=4&searchCriteria[sortOrders][0][field]=updated_at&searchCriteria[sortOrders][0][direction]=DESC&searchCriteria[filter_groups][0][filters][1][field]=website_id&searchCriteria[filter_groups][0][filters][1][value]=1&searchCriteria[filter_groups][0][filters][1][condition_type]=eq&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
    end

    def sort_by_popularity(search_params_, params, page_size, current_page)
      return search_params_+"searchCriteria[filter_groups][0][filters][0][field]=popularity&searchCriteria[filter_groups][0][filters][0][value]=4&searchCriteria[sortOrders][0][field]=updated_at&searchCriteria[sortOrders][0][direction]=DESC&searchCriteria[filter_groups][0][filters][1][field]=website_id&searchCriteria[filter_groups][0][filters][1][value]=1&searchCriteria[filter_groups][0][filters][1][condition_type]=eq&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
    end
    # "http://upgrade.brandsday.com/rest/V1/getproducts?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=3&searchCriteria[filter_groups][1][filters][0][field]=website_id&searchCriteria[filter_groups][1][filters][0][value]=1&searchCriteria[filter_groups][1][filters][0][condition_type]=eq&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=ASC&searchCriteria[pageSize]=10&searchCriteria[currentPage]=1"

    def sort_by_price(search_params_, params, page_size, current_page)
      sort = params[:sort_by][:price_desc].present? ? "DESC" : "ASC"
      return search_params_+"searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=#{sort}&searchCriteria[filter_groups][0][filters][1][field]=website_id&searchCriteria[filter_groups][0][filters][1][value]=1&searchCriteria[filter_groups][0][filters][1][condition_type]=eq"+"&searchCriteria[pageSize]=#{page_size}&searchCriteria[currentPage]=#{current_page}"
    end

    def get_url(type)
      "#{base_url}#{RELATIVE_PATHS[type]}"
    end
  end
end
