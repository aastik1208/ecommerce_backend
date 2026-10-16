# Author:: Ankit Bansal
module Api
  module V1
    class PasswordsController < BaseController
       include Sms
      skip_before_action :authenticate_account!
      before_action :load_customer
      before_action :social_login , only: [:resend, :verify, :reset]
      before_action :validate_password, only: [:reset]

      def resend
        @customer.generate_otp
        @customer.deliver_otp_by_phone if (@customer.phone_number.present? and params[:phone_number].present?)
        @customer.deliver_otp_by_email if (@customer.email.present? and params[:email].present?)
        render json: { success: true }
      end

      def verify
        if verify_otp?(@customer.otp_code, params[:otp_code])
          @customer.reset_password_token!
          render json: { success: true , token: @customer.reset_password_token }, status: :ok
        else
          render_error({message: "#{I18n.t('customer.invalid_otp')}" })
        end
      end

      def reset
        if (@customer.reset_password_token == change_password_params[:token])
          Brandsday::CustomerService.new.reset_password(change_password_params.merge(oauth_token: @customer.oauth_token, email: @customer.email))
          render json: { success: true }, status: :ok
        else
          render_error({message: "#{I18n.t('customer.invalid_token')}"})
        end
      end


      private

      def load_customer
        @customer = Customer.where("phone_number = ? or email = ? or reset_password_token = ?", params[:phone_number], params[:email], change_password_params[:token]).first
        render_error({message: "#{I18n.t('customer.account.not_found')}"})  if @customer.nil?
      end

      def change_password_params
        params.require(:password).permit(:confirm_password, :password, :token)
      end

      def validate_password
        unless (change_password_params[:password] == change_password_params[:confirm_password])
          render_error({message: "#{I18n.t('customer.account.confirm_password')}"})
        end
      end

      def social_login
        if ["Google", "Facebook", "Apple"].include? @customer.provider
          render_error({message: "Customer Already Registered using #{@customer.provider}." })
        end
      end
    end
  end
end
