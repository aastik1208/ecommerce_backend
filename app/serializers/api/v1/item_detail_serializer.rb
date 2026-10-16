module Api
  module V1
    class ItemDetailSerializer < ItemSerializer
      include ReactionHelper, WishlistHelper, AccountHelper
      attributes :reviews, :reactions, :review_count, :reaction_count, :is_reacted, :is_wishlist, :tagged_account, :variant_attributes

      def reviews
        object.reviews.includes(:account, :replies).order('id DESC').map { |review| ReviewSerializer.new(review) }
      end

      def reactions
        object.reactions.includes(:account).order('id DESC').map { |reaction| ReactionSerializer.new(reaction) }
      end

      def review_count
        object.reviews.size
      end

      def reaction_count
        object.reactions.size
      end

      def is_reacted
        is_reacted_by_current_user(object, (instance_options[:scope].present? ? instance_options[:scope] : scope))
      end

      def is_wishlist
        is_wishlisted?(instance_options[:scope])
      end

      def tagged_account
        tagged_accounts(object)
      end

      def variant_attributes
        attrs = object.item_option_types
        temp = []
        if attrs.present?
          attrs.map{|k| [k.option_type.name, k.option_value.value]}.to_h
        else
          []
        end
      end
    end
  end
end
 
