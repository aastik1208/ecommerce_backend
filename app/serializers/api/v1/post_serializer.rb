module Api
  module V1
    class PostSerializer < BaseSerializer
      include ReactionHelper, WishlistHelper
      attributes :id,
                  :post_type,
                  :caption,
                  :files,
                  :content,
                  :reshare_caption,
                  :post_shared_of,
                  :is_wishlist

      def files
        media_files = []
        new_obj = object
        if object.parent_id.present?
          new_obj = Post.find(object.parent_id)
        end
        new_obj.media_files.each do |file|
          media_files << file.service_url
        end
        media_files
      end

      def is_reacted
        is_reacted_by_current_user(object, (instance_options[:scope].present? ? instance_options[:scope] : scope))
      end

      def post_shared_of
        if object.parent_post.present?
          account = object.account
          {
            id: account.id,
            email: account.email,
            name: account.firstname
          }
        end
      end

      def is_wishlist
        is_wishlisted?(instance_options[:scope])
      end

    end
  end
end
