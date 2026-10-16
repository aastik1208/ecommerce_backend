module JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, encryption_key)
  end

  def self.decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, encryption_key)[0])
  rescue
    nil
  end

  def self.encryption_key
    if Rails.env.production?
      Rails.application.credentials.encrypted_secret_key || raise('Must set token key!')
    else
      Rails.application.credentials.encrypted_secret_key || '300aebc9922d4134b32e3b331d485e87'
    end
  end

  private_class_method :encryption_key
end
