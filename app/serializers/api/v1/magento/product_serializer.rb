module Api
  module V1
    class Magento::ProductSerializer < BaseSerializer
      attributes :id, :created_at

      def created_at
        formatted_datetime(object.created_at)
      end

    end
  end
end
 
