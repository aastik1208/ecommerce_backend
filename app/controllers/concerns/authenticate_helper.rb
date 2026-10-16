module AuthenticateHelper
  extend ActiveSupport::Concern

  API_TIME_OUT = 10

  def authenticate_external_client!
    current_time = (Time.current.to_f * 1000).to_i

    if (digest_matches? && verify_by_timestamp(current_time))
      @_current_external_client = ExternalClient.find_by(client_name: request.headers['Client-Name'])
    else
      render json: { message: 'unauthorized' }, status: 401 and return false
    end
  end

  private
    def verify_by_timestamp(current_time)
      (current_time - request.headers['Timestamp'].to_i) <= (API_TIME_OUT * 1000)
    end

    def digest_matches?
      req_hash = request.headers['Hash-Data']
      client_name = request.headers['Client-Name']

      Rails.logger.info "Authenticating Request for client #{request.headers['Client-Name']}" \
        " with Request Hash: #{request.headers['Hash-Data']} and timestamp: #{request.headers['Timestamp']}"

      if req_hash.present? && client_name.present?
        req_hash == ClientAuthService.new(client_name, request.headers['Timestamp'], request.raw_post).digest
      else
        false
      end
    end
end
