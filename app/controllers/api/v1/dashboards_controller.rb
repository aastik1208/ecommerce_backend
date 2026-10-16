module Api
    module V1
        class DashboardsController < BaseController

            def engaged
                if params[:date].present?
                    items = current_user.items.where('extract(month from created_at) = ?', params[:date].to_i)
                    @posts = current_user.posts.where('extract(month from created_at) = ?', params[:date].to_i).count
                    @followers = current_user.account_followers.where('extract(month from app_followers.created_at) = ?', params[:date].to_i)
                    @user_views = UserView.where('extract(month from created_at) = ?', params[:date].to_i)
                else
                    items = current_user.items
                    @posts = current_user.posts.present? ? current_user.posts.where(post_type: "image").count : 0
                    @followers = current_user.account_followers
                    @user_views = UserView.all
                end
                order_till_date = Brandsday::SellerService.new.orderTillDate(params.merge(seller_id: current_account.magento_id, oauth_token: current_account.oauth_token))
                @order_till_date = order_till_date[0]["totalRecords"].present? ?  order_till_date[0]["totalRecords"] : 0
                engage_reaction = engege_review = []
                items.each do |item|
                    engage_reaction = item.reactions.pluck(:account_id)
                    engege_review = item.reviews.pluck(:account_id)
                end
                # @user_views = UserView.recent
                @active_user = []
                @user_views.each do |view|
                    if view.resource.present?
                        @active_user << view.resource.account_id if (view.resource.account_id == current_account.id)
                    end
                end
                @total_engage = engage_reaction.concat(engege_review).length
                @account_reached = engage_reaction.concat(engege_review).uniq.length
                @gender_follower = @followers.group("gender").count
                @region_follower =  @followers.pluck(:id)
                region = []
                age = []
                @average_rating = current_user.reviews.present? ? (current_user.reviews.pluck(:rating).sum.to_f/current_user.reviews.where.not(rating: 0).count) : 0
                @followers.each do |follow|
                    if follow.birthday.present?
                        age.push(((Time.zone.now - follow.birthday.to_time) / 1.year.seconds).floor)
                    end
                end
                @region_follower.each do |add|
                    regions = Address.find_by_addressable_id(add)
                    if regions.present?
                        if regions.region.present?
                            region.push(regions.region)
                        end
                    end
                end
                render json: {
                            average_rating: @average_rating,
                            account_engage: @total_engage,
                            posts: @posts,
                            followers:{
                                    gender: @gender_follower,
                                    region: region.tally,
                                    age: age.tally
                                    },
                            total_follower: @followers.count,
                            active_users: @active_user.count,
                            account_reached: @account_reached,
                            order_till_date: @order_till_date
                            },
                            status: :ok
            end
        end
    end
end
