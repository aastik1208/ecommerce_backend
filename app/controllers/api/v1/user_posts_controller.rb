# Author:: Ankit Bansal
module Api
  module V1
    class UserPostsController < BaseController

      # before_action :check_preference_presence, only: [:update_preferences]

      def get_posts
        posts = current_customer.user_posts.includes(:customer, media_file_attachment: :blob)
        render_collection(posts, Api::V1::UserPostSerializer)
      end

      def create_post
        user_post = current_customer.user_posts.new({
          media_file: params[:media_file],
          post_type: params[:post_type]
        })

        if user_post.save
          render_success(Api::V1::UserPostSerializer.new(user_post), "")
        else
          render_error({ errors: user_post.errors.full_messages }, "Post Creation Failed")
        end
      end
    end
  end
end
