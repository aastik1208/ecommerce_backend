module Api
  module V1
    class StoreSerializer < BaseSerializer
      include WishlistHelper
      attributes :details

      def details
        all_details
      end

      def all_details
        detail = []
        object.each do |obj|
            detail << {
                        id: obj[0],
                        category_id: obj[1],
                        product_id: obj[2],
                        position: obj[3],
                        entity_id: obj[4],
                        attribute_set_id: obj[5],
                        type: obj[6],
                        sku: obj[7],
                        is_wishlist: is_wishlisted?(instance_options[:scope])
                      }
        end
        return detail
      end
    end
  end
end
