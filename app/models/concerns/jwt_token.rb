module JwtToken
  extend ActiveSupport::Concern

  included do
    after_save :generate_jwt_token, if: :any_api_key_changed?
  end

  TOKEN_KEYS = [:id, :email, :firstname, :lastname]

  def generate_jwt_token
    update_columns(jwt_token: JsonWebToken.encode(to_api_format))
  end

  def destroy_jwt_token
    update_columns(jwt_token: nil)
  end

  def to_api_format
    api_format = self.attributes.slice(*TOKEN_KEYS.collect(&:to_s))
    api_format[:exp] = (Time.current + 30.days).to_i
    api_format
  end

  def any_api_key_changed?
    TOKEN_KEYS.any? { |key| saved_change_to_attribute?(key) }
  end
end
