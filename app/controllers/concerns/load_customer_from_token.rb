module LoadCustomerFromToken
  extend ActiveSupport::Concern

  def authenticate_customer!
    if token = request.headers['Authorization']
      begin
        jwt_payload = JsonWebToken.decode(token)
        render json: { error: 'Invalid token' }, status: :bad_request and return if jwt_payload.blank?
        @current_user_id = jwt_payload && jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render json: { error: 'Invalid token.' }, status: :bad_request and return
      end
    else
      render json: { error: 'Missing token' }, status: :bad_request and return
    end
  end
end
