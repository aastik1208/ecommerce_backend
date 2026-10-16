Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.dig(:google_auth, :gclient_id), Rails.application.credentials.dig(:google_auth, :gclient_secret)
end