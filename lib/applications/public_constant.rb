module PublicConstant
  # Load environment specific constants
  # env_constants = HashWithIndifferentAccess.new(YAML.load_file(Rails.root.to_s + '/config/public_constants.yml')['constants'])
  
  # App Config
  APP_NAME = "BRANDSDAY_API"
  # APP_URL = env_constants[:app][:url]
  APP_URL = "https://staging.brandsday.com"

  # Developer Emails
  # INTERNAL_EMAILS = env_constants[:emails][:internal]
  APP_DEVS = "asd"# env_constants[:emails][:dev]

  # # Redis configuration
  # REDIS_URL = env_constants[:redis][:url]
  # REDIS_PASS = env_constants[:redis][:pass]
  # REDIS_NAMESPACE = "goparts"

  # Developer Emails
  # SYSTEM_EMAILS = env_constants[:emails]
end
