class ApiController < ActionController::API
  include ExceptionHelper
  include RendererHelper

  before_action :authenticate_account!
  before_action :log_user_agent

  private

  def current_account
    @_account
  end

  def current_user
    current_account
  end
  
  alias :current_customer :current_account

  def authenticate_account!

    if token = request.headers['Authorization']
      begin
        jwt_payload = JsonWebToken.decode(token)
        render_error({message: "#{I18n.t('customer.jwt_token.invalid')}" }) and return if jwt_payload.blank?
        current_account_id = jwt_payload && jwt_payload['id']
        @_account = Account.find_by(id: current_account_id)
        render_unauthorized and return unless @_account
        render_error({message: "#{I18n.t('customer.login')}" }) and return unless (@_account.jwt_token != nil)
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render_error({message: "#{I18n.t('customer.jwt_token.invalid')}" }) and return
      end
    else
      render_error({message: "#{I18n.t('customer.jwt_token.missing')}" }) and return
    end
  end

  def log_user_agent
    Rails.logger.info "*************** Printing User Agent ***************"
    Rails.logger.info "#{request.env['HTTP_USER_AGENT']}"
    Rails.logger.info "*************** Printing User Agent ***************"
  end
end
