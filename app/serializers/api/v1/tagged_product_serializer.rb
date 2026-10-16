module Api
  module V1
    class TaggedProductSerializer < BaseSerializer
      include DateHelper, WishlistHelper, ReactionHelper, ItemHelper

      attributes :id,
                  :content_type,
                  :detail,
                  :created_at,
                  :is_wishlist,
                  :reshare_caption,
                  :is_posted_by_admin,
                  :is_reshared,
                  :reviews,
                  :reactions,
                  :review_count,
                  :reaction_count

      has_one :account, serializer: CustomerProfileSerializer

      def detail
        if object.content_type == 'Magento::Product'
          gallery = object.content.galleries
          {
            name: fetch_val(gallery, ATTRIBUTE_IDS['name']),
            price: object.content.price,
            special_price: object.content.special_price,
            files: files_(gallery),
            content: object.content,
            descriptions: object.content.product_entity_texts.descriptions.map(&:parsed_description),
            variants: object.content.variants.map {|item| ProductSerializer.new(item)},
            post_type: nil,
            caption: nil,
            is_reacted: false,
            post_shared_of: {}
          }
        else
          {
            content: object.content.content,
            post_type: object.content.post_type,
            caption: object.content.caption,
            files: files,
            is_reacted: is_reacted,
            post_shared_of: post_shared_of,
            name: nil,
            price: 0.0,
            special_price: 0.0,
            thumbnail: nil,
            base_image: nil,
            small_image: nil,
            variants: []
          }
        end
      end

      def fetch_val obj, attribute_id
        obj.select{|item| item['attribute_id'] == attribute_id}.try(:first).try(:value)
      end

      def fetch_image gallery, attribute_id
        gallery.select{|item| item['attribute_id'] == attribute_id}
      end

      def reviews
        object.reviews.order('id DESC').map {|review| ReviewSerializer.new(review)}
      end

      def reactions
        object.reactions.order('id DESC').map {|reaction| ReactionSerializer.new(reaction)}
      end

      def review_count
        object.reviews.count
      end

      def reaction_count
        object.reactions.count
      end

      def is_wishlist
        is_wishlisted?(instance_options[:scope])
      end

      def is_posted_by_admin
        return true unless object.account.present?

        false
      end

      def is_reshared
        return true if object.parent_id.present?

        false
      end

      def is_reacted
        is_reacted_by_current_user(object, (instance_options[:scope].present? ? instance_options[:scope] : scope))
      end

      def post_shared_of
        if object.content.parent_post.present?
          account = object.account
          {
            id: account.id,
            email: account.email,
            name: account.firstname
          }
        end
      end
    end
  end
end
