module Api
    module V1
      class UserViewSerializer < BaseSerializer
        attributes :id, :resource_type, :resource_id, :url, :created_at, :updated_at
        has_one :account, serializer: CustomerProfileSerializer
      end
    end
end
