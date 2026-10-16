module Api
  module V1
    class UserPostSerializer < BaseSerializer
      attributes :id, :media_file, :customer, :post_type, :parent_id, :is_shared

      def customer
        {
          id: object.customer.id,
          first_name: object.customer.firstname,
          is_business: object.customer.is_business
        }
      end

      def media_file
        {
          url: object.media_file.url 
        }
      end
    end
  end
end
