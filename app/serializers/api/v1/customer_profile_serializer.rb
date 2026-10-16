module Api
  module V1
    class CustomerProfileSerializer < BaseSerializer
      include FollowHelper, AccountHelper
      attributes :id, :email,  :firstname, :middlename, :lastname,
        :description, :city, :birthday, :gender, :interest, :profile_img,
        :seller_phone_number, :seller_web_url, :seller_store_address,
        :total_followers, :total_posts, :total_reshared_posts, :total_followings,
        :is_followed_by_current_user, :rating, :is_seller, :is_influencer, :magento_id

      def profile_img
        ActiveStorage::Current.host = Rails.application.credentials.host
        object.profile_img.service_url  if (object.profile_img && object.profile_img.attached?)
      end

      def total_followers
        object.account_followers.count
      end

      def total_posts
        only_post_count(object)
      end

      def total_reshared_posts
        object.reshared_items.count
      end

      def total_followings
        object.followings.count
      end

      def is_followed_by_current_user
        is_follow?(object, instance_options[:scope].present? ? instance_options[:scope] : object )
      end

      def rating
        calculate_rating(object)
      end
    end
  end
end
