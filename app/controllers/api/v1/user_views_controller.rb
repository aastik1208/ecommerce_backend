module Api
  module V1
    class UserViewsController < BaseController

      def index
        @user_view = UserView.all.order('updated_at DESC').page(params[:page])
        render json: @user_view,
                each_serializer: UserViewSerializer,
                meta: pagination_meta(@user_view),
                adapter: :json
      end

      def create
        @user_view = UserView.new({
          account_id: params[:account_id],
          resource_type: params[:resource_type],
          resource_id: params[:resource_id],
          url: params[:url]
        })
        if @user_view.save
          render json: @user_view, serializer: UserViewSerializer
        else
          render_error({ errors: @user_view.errors.full_messages }, "User View Creation Failed")
        end
      end

      def user_view
        @user_views = current_account.user_views.order('updated_at DESC').page(params[:page])
        render json: @user_views,
                each_serializer: UserViewSerializer,
                meta: pagination_meta(@user_views),
                adapter: :json
      end

      def active_users
        @active_users = Account.last_30_days.page(params[:page])
        render json: @active_users,
                each_serializer: CustomerProfileSerializer,
                root: 'active_users',
                meta: pagination_meta(@active_users),
                adapter: :json
      end
    end
  end
end
