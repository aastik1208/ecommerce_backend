module Api
  module V1
    class PostsController < BaseController

      before_action :check_account, only: []
      before_action :load_item, only: [ :update,
                                        :show,
                                        :reshare
                                      ]
      before_action :load_account, only: :current_user_posts

      def index
        if params[:ids].present?
          @items = Item.post_type.where(id: JSON.parse(params[:ids])).order('updated_at DESC').page(params[:page])
        else
          @items = Item.post_type.order('updated_at DESC').page(params[:page])
        end
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def current_user_posts
        account = @account.present? ? @account : current_account
        @items = account.items.post_type.includes(:content)
        @items = get_filter(@items, params[:type]) if params[:type].present?
        @items = @items.order('updated_at DESC').page(params[:page])
        render json: @items,
                each_serializer: ItemSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def create
        @post = current_account.posts.new(post_params)
        if @post.save
          render json: @post.item, serializer: ItemSerializer
        else
          render json: {
            errors: @post.errors.full_messages.join(', ')
          },
          status: 422
        end
      end

      def update
        if current_account.items.include? @item
          if @item.content.update(post_params)
            render json: @item, serializer: ItemSerializer
          else
            render json: {
              errors: @item.content.errors.full_messages.join(', ')
            },
            status: 422
          end
        else
          render json: {
            errors: "you can't edit this post"
          },
          status: 401
        end
      end

      def show
        render json: @item, each_serializer: ItemSerializer
      end

      def destroy
        @item.content.media_files.purge
        @item.destroy
        render json: {success: true}
      end

      def reshare
        @dup_post = @item.content.clone_post(current_account, params)
        render json: @dup_post, each_serializer: PostSerializer
      end

      private

      def post_params
        params.require(:post).permit(
                :content,
                :caption,
                :post_type,
                :is_shared,
                :item_id,
                :auto_crop,
                tagged_account_ids: [],
                media_files: []
              )
      end

      def load_item
        @item = Item.where(id: params[:id], content_type: "Post").last
        unless @item.present?
          render json: { errors: "Not found."}, status: 422
        end
      end

      def check_account
        render json: {
          errors: "you are not authorised to create post"
        },
        status: 401
      end

      def get_filter(items, type)
        items_ = []
          items.each do |item|
            items_ << item if (item.content.post_type == type.downcase && items_.exclude?(item.content))
          end
        fiter_data = Item.where(id: items_.map(&:id))
        return fiter_data
      end

      def load_account
        @account = Account.find_by(id: params[:account_id])
      end
    end
  end
end
