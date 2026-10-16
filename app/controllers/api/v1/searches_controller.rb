module Api
    module V1
        class SearchesController < BaseController

            def search
                @accounts = Account.search(params[:query]).map{|m| m.search_result}
                @posts = Post.search(params[:query]).map{|m| m.search_result}

                product_params = {:by_name =>[{'name' => params[:query]}]}
                result = Brandsday::ProductService.new.productSearch(product_params.merge(oauth_token: current_account.oauth_token))
                @items =Item.where(content_id: result["items"].pluck("id")).map{|m| m.search_result(current_account)}
                render json: {
                    users: @accounts,
                    posts: @posts,
                    item: @items
                }, status: :ok 
                
            end
        end
    end
end 

