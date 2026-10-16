module Api
  module V1
    class ItemsController < BaseController
      before_action :set_item, only: [:do_review, :show, :do_reaction, :remove_reaction, :reviews, :reshare, :add_tag, :remove_tag]
      before_action :remove_reaction, only: [:do_reaction]

      def index
        if params[:ids].present?
          @items = Item.includes(:account, :reviews, :reactions).where(id: JSON.parse(params[:ids])).order('updated_at DESC').page(params[:page])
        else
          # @items = Item.non_variant_products.includes(:account, :reviews, :reactions).order('updated_at DESC').page(params[:page]).per_page([params[:per_page].presence.to_i || 20, 50].min)
          var_products_ids= Item.non_variant_products
          @items = Item.where("id NOT IN (?)", var_products_ids).includes(:account, :reviews, :reactions).order('updated_at DESC').page(params[:page]).per_page([params[:per_page].presence.to_i || 20, 50].min)
        end
        render json: @items,
          each_serializer: ItemDetailSerializer,
          meta: pagination_meta(@items),
          adapter: :json
      end

      def show
        render json: @item, serializer: ItemDetailSerializer
      end

      def do_review
        @review = @item.reviews.create(review_params.merge(account_id: current_account.id))
        if @review.save
           render json: @review, serializer: ReviewSerializer
        else
          render json: {
            errors: @review.errors.full_messages.join(', ')
          },
          status: 422
        end
      end

      def reviews
        @reviews = @item.reviews.order('updated_at DESC').page(params[:page])
        render json: @reviews,
                each_serializer: ReviewSerializer,
                meta: pagination_meta(@reviews),
                adapter: :json
      end

      def do_reaction
        @reaction = @item.reactions.new(reaction_params.merge(account_id: current_account.id))
        if @reaction.save
          render json: { 
            is_reacted: true,
            reaction_type: @reaction.reaction_type
          }
        else
          render json: {
            errors: @reaction.errors.full_messages.join(', ')
          },
          status: 422
        end
      end

      def reshare
        @dup_item = @item.clone_item(current_account, params)
        render json: @dup_item, serializer: ItemDetailSerializer
      end

      private
      def set_item
        @item = Item.find(params[:id])
      end

      def remove_reaction
        @reaction = @item.reactions.find_by(account_id: current_account.id)
        if @reaction.present?
          @reaction.destroy
          render json: {
            is_reacted: false
          }
        end
      end

      def review_params
        params.require(:review).permit(:comment, :parent_id, tags_attributes: [:account_id])
      end

      def reaction_params
        params.require(:reaction).permit(:reaction_type)
      end

    end
  end
end
