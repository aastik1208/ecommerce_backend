module Api
  module V1
    class CustomersController < BaseController

      before_action :check_preference_presence, only: [:update_preferences]
      before_action :load_customer, only: [:update]
      before_action :get_customer, only: [:followers, :followings]

      def details
        # render_success(Api::V1::CustomerProfileSerializer.new(current_customer))
        render json: current_customer, serializer: CustomerProfileSerializer
      end

      def update
        current_customer.assign_attributes(update_params)

        if current_customer.save
          # render_success(Api::V1::CustomerProfileImageSerializer.new(current_customer))
          render json: current_customer, serializer: CustomerProfileImageSerializer
        else
          render_error({ errors: current_customer.errors }, I18n.t('customer.update.failure') )
        end
      end

      def update_detail
        current_customer.assign_attributes(update_params)
        if current_customer.save
          service = Brandsday::CustomerService.new.update_profile(update_params.merge(email: current_customer.email, oauth_token: current_customer.oauth_token))
          # save_address
          # render_success(Api::V1::CustomerProfileSerializer.new(current_customer))
          render json: current_customer, serializer: CustomerProfileSerializer
        else
          render_error({ errors: current_customer.errors }, I18n.t('customer.update.failure') )
        end
      end

      def update_preferences
        preferences = params[:preference_ids].map { |id| current_customer.customer_preferences.new(kind: params[:type], preference_id: id) }

        ActiveRecord::Base.transaction do
          current_customer.customer_preferences.where(kind: params[:type]).delete_all
          preferences.each do |preference|
            preference.save!
          end
        end

        render_success({})
      rescue Exception => e
        render_error({}, e.message)
      end

      def followers
        @followers = @customer.account_followers.search(params[:search]).page(params[:page])
        render json: @followers,
                each_serializer: FollowSerializer,
                root: 'accounts',
                meta: pagination_meta(@followers),
                adapter: :json
      end

      def followings
        @followings = @customer.followings.search(params[:search]).page(params[:page])
        render json: @followings,
                each_serializer: CustomerProfileSerializer,
                root: 'accounts',
                meta: pagination_meta(@followings),
                adapter: :json
      end

      def follow
        @follow = current_customer.followers.new(follower_params)
        if @follow.save
          render json: {
            success: true
          }
        else
          render json: {
            errors: @follow.errors.full_messages.join(', '),
            success: false
          },
          status: 422
        end
      end

      def unfollow
        follower = current_customer.followers.find_by_follow_id(params[:follower][:follow_id])
        if follower.present?
          follower.destroy
          render json: {
            success: true
          }
        else
          render json: {
            errors: I18n.t('follower.not_follow'),
            success: false
          },
          status: 422
        end
      end

      private

      def update_params
        params.require(:customer).permit(:firstname, :middlename, :lastname, :description, :city, :birthday, :gender, :interest, :seller_phone_number, :seller_web_url, :seller_store_address, :profile_img)
      end

      def follower_params
        params.require(:follower).permit(:follow_id)
      end

      def save_address
        address = current_customer.customer_address.presence || current_customer.build_customer_address

        address.telephone = params[:customer][:telephone]
        address.country_id = params[:customer][:country_id]

        address.save!
      end

      def check_preference_presence
        render_error({ code: :NO_DATA, ERROR: true }, "") if params[:preference_ids].nil?
      end

      def get_customer
        if params[:id].present?
          @customer = Account.find_by(id: params[:id])
          @customer =  @customer.present? ? @customer : current_customer
        else
          @customer = current_customer
        end
      end

      def load_customer
        customer = Account.find_by(id: params[:id])
        unless customer.present? && (customer.email == current_customer.email)
          render_error({ message: "#{I18n.t('customer.authorize.unauthorize')}" })
        end
      end
    end
  end
end
