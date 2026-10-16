module Api
  module V1
    class SessionsController < BaseController

      skip_before_action :authenticate_account!, only: [:signup, :login, :login_social]
      # before_action :validate_app_token, only: [:signup, :login, :login_social]
      before_action :load_customer, :create_customer, only: :login_social
      before_action :account_exists?, only: [:login]
      include CartHelper

      def signup
        service = Brandsday::CustomerService.new.signup(signup_params)

        if service[:success]
          customer = Customer.create!(
                                      email: signup_params[:email],
                                      firstname: signup_params[:firstname],
                                      lastname: signup_params[:lastname],
                                      provider: "email",
                                      magento_id: service[:data]["id"],
                                      phone_number: signup_params[:phone_number]
                                      )
          get_oauth_token(signup_params[:email], signup_params[:password])
          render_success({jwt_token: customer.jwt_token}, "")
        else
          render_error({message: service[:data]["message"] })
        end
      end

      def login
        service = Brandsday::CustomerService.new.login(params)
        if service[:success]
          @account = update_seller_influencer(oauth_token: service[:data])
          @account.save!

          @account.generate_jwt_token
          render_success({jwt_token: @account.jwt_token, oauth_token: service[:data], magento_id: @account.magento_id, is_seller: @account.is_seller, is_influencer: @account.is_influencer}, "")
        else
          render_error({message: "#{I18n.t('account.password.invalid')}" })
        end
      end

      def profile_data
        render_success({}, "")
      end

      def login_social
        unless (@customer.provider == params[:provider])
          render_error(message: "Customer Already Registered using #{@customer.provider}") and return
        end
        @service = login_in_with(@email, "#{@email}+#{@customer.social_login_token}")
        if @service[:success]
          @customer.generate_jwt_token
          update_oauth_token(@customer, @service[:data])
          render_success({jwt_token: @customer.jwt_token}, "")
        else
          render_error({message: "#{I18n.t('customer.password.invalid')}" })
        end
      end

      def logout
        if current_customer.present?
          current_customer.destroy_jwt_token
          render_success({message: "#{I18n.t('customer.logout')}"}, "")
        else
          render_error({message: "#{I18n.t('customer.account.invalid')}"})
        end
      end

      private

      def account_exists?
        @account = Account.find_by(email: params[:username].downcase)
          render_error({message: "#{I18n.t('customer.account.invalid')}"}) and return unless @account.present?
          render_error({message: "Customer Already Registered using #{@account.provider}"}) and return unless (@account.present? && @account.provider == params[:provider])
      end

      def load_customer
        @user_params = params[:user]
        @email = @user_params[:email]
        @customer = Customer.find_by(email: @email)
      end

      def create_customer
        return if @customer.present?
        new_params = {
          email: @email,
          firstname: @user_params[:given_Name],
          lastname: @user_params[:family_Name].presence || @user_params[:given_Name],
          password: "#{@email}+#{@email.hash}",
          social_login_token: "#{@email.hash}"
        }

        @service = Brandsday::CustomerService.new.signup(new_params)
        if @service[:success]
          Customer.create!(
                            email: new_params[:email],
                            social_login_token: new_params[:social_login_token],
                            firstname: new_params[:firstname],
                            lastname: new_params[:lastname],
                            provider: params[:provider],
                            provider_token: params[:provider_token]
                          )
          get_oauth_token(new_params[:email], new_params[:password])
          load_customer
        else
          render_error({message: "#{I18n.t('customer.account.invalid')}"}) and return
        end
      end

      def signup_params
        params.require(:customer)
      end

      def login_in_with(email, password)
        new_params = { username: email, password: password }
        Brandsday::CustomerService.new.login(new_params)
      end

      def update_oauth_token(customer, token)
        customer.update_column(:oauth_token, token)
      end

      def get_oauth_token(email, password)
        service = Brandsday::CustomerService.new.login(username: email, password: password)
        customer = Customer.find_by(email: email)
        update_oauth_token(customer, service[:data]) if (customer.present? &&service[:success])
      end

      def update_seller_influencer(params)
        service = Brandsday::CustomerService.new.get_profile(params)
        @account.is_influencer = service['extension_attributes']['is_influencer']
        @account.is_seller = service['extension_attributes']['is_seller']
        
        return @account
      end

      #logic for calculate influencer category
      def influencer_type(followers)
        case followers.count
          when 1..1000
            "Silver"
          when 1001..2000
            "Gold"
          when 2001..10000
            "Platinum"
        end
      end

    end
  end
end
