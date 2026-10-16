module Api
  module V1
    class ProductSerializer < BaseSerializer
      include DateHelper
      attributes :entity_id, :detail


      def detail
        gallery = object.galleries
        {
          name: fetch_val(gallery, ATTRIBUTE_IDS['name']),
          price: object.price,
          special_price: object.special_price,
          thumbnail: fetch_image(gallery, ATTRIBUTE_IDS['thumbnail_image']),
          base_image: fetch_image(gallery, ATTRIBUTE_IDS['base_image']),
          small_image: fetch_image(gallery, ATTRIBUTE_IDS['small_image']),
          content: content,
          variants: variants
        }
      end

      def fetch_image gallery, attribute_id
        gallery.select{|item| item['attribute_id'] == attribute_id}
      end

      def fetch_val obj, attribute_id
        obj.select{|item| item['attribute_id'] == attribute_id}.try(:first).try(:value)
      end

      def content
        {
          created_at: object.created_at, 
          updated_at: object.updated_at, 
          sku: object.sku, 
          has_options: object.has_options, 
          required_options: object.required_options
        }
      end

      def variants 
        object.variants.map {|item| ProductSerializer.new(item)}
      end
    end
  end
end
 
