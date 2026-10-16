module Api
  module V1
    class AccountsController < BaseController

      before_action :load_account, except: [:index, :all_accounts]
      before_action :load_review , only: [:update]
      before_action :validate_review, only: [:do_review]

      def index
        @accounts = Account.where.not(id: current_user.id)
        @accounts = @accounts.where('is_seller = ? OR is_influencer = ?', true, true) if params[:business_or_influencer].present?
        @accounts = @accounts.search(params[:search]) if params[:search].present?
        @accounts = @accounts.page(params[:page])
        render json: @accounts,
                each_serializer: CustomerProfileSerializer,
                root: 'accounts',
                meta: pagination_meta(@accounts),
                adapter: :json
      end

      def all_accounts
        @accounts = Account.where.not(id: current_user.id)
        render json: @accounts,
                each_serializer: CustomerProfileSerializer,
                root: 'accounts',
                adapter: :json
      end

      def show
        render json: @account, serializer: CustomerProfileSerializer
      end

      def reshared_items
        @items = @account.reshared_items.order('updated_at DESC').page(params[:page])
        render json: @items,
                each_serializer: ItemDetailSerializer,
                meta: pagination_meta(@items),
                adapter: :json
      end

      def reviews
        all_reviews = params[:customer_id].present? ? @account.reviews.where(account_id: params[:customer_id]) : @account.reviews
        @reviews = all_reviews.order('updated_at DESC').page(params[:page])
        render json: @reviews,
                each_serializer: ReviewSerializer,
                meta: pagination_meta(@reviews),
                adapter: :json
      end

      def do_review
        @review = @account.reviews.new(review_params.merge(account_id: current_account.id))
        if @review.save
           render json: @review, serializer: ReviewSerializer
        else
          render json: {
            errors: @review.errors.full_messages.join(', ')
          },
          status: 422
        end
      end

      def update
        if current_account.id == @review.account_id
          if @review.update(review_params.merge(account_id: current_account.id))
            render json: @review, serializer: ReviewSerializer
          else
            render json: {
              errors: @review.errors.full_messages.join(', ')
            },
            status: 422
          end
        else
          render json: {
            errors: "you can't edit this review"
          },
          status: 401
        end
      end

      private

      def load_account
        @account = Account.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:comment, :parent_id, :rating)
      end

      def load_review
        @review = Review.find_by(id: params[:review_id])
      end

      def validate_review
        if @account.id == current_account.id
          render json: { errors: "you can't review yourself." }, status: 401
        end
      end

    end
  end
end