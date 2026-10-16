Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/api/sidekiq'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/healthcheckup', to: 'base#healthcheckup'
      get '/all_profile_info', to: 'base#all_profile_info'
      # resources :emails, only: [] do
      #   collection do
      #     post :send_fe_exception_email
      #   end
      # end

      resources :items, only: [:index, :show] do
        member do
          post :do_review
          post :do_reaction
          get :reviews
          post :reshare
        end
      end

      resources :accounts, only: [:index, :show, :update] do
        member do
          get :reshared_items
          get :reviews
          post :do_review
          get :ratings
          get :rating
          post :do_rating
        end

        collection do
          get :all_accounts
        end
      end

      resources :searches do
        get 'search', on: :collection
      end

      resources :wishlists, only: [:index] do
        collection do
          post :add_item
          post :remove_item
        end
      end

      resources :carts, only: [] do
        collection do
          get :get_cart_id
          get :cart_details
          get :cart_total
          post :add_to_cart
          post :add_billing_address
          post :add_shipping_info
          post :estimate_shipping_cost
          post :payment_info
          get :get_shipping_methods
          put 'update_product_to_cart/:product_id', to: 'carts#update_item_to_cart'
          delete 'delete_item_from_cart/:product_id', to: 'carts#delete_item_from_cart'
          post :apply_coupon
          post :remove_coupon
        end
      end

      resources :orders, only: [] do
        member do
          post :cancel
          post :return
          get :status_timeline
          get :order_addresses
        end
        get :my_orders, on: :collection
      end

      resources :customers, only: [:update] do
        collection do
          get :all_details
          get :details
          post :update_detail
          post :update_preferences
          post :follow
          post :unfollow
          get :followers
          get :followings
        end
        collection do
          resources :addresses do
            collection do
              get :country_list
            end
          end
        end
      end

      resources :sessions, only: [] do
        collection do
          post :signup
          post :login
          post :login_social
          get :profile_data
          delete :logout
        end
      end

      resources :passwords, only: [] do
        collection do
          post :resend
          post :verify
          post :reset
        end
      end

      resources :products, only: [] do
        collection do
          get :product_list
          get :all_reviews
          post :add_review
          # post :viewed
          # post :add_to_cart
          # post :remove_from_cart
          post :add_like
          post :remove_like
          get :product_by_sku
          get :child_product
          get :searchByName
          get :featuredProduct
          get :arrivalProduct
        end
      end

      resources :user_posts, only: [] do
        collection do
          get :get_posts
          post :create_post
        end
      end

      resources :posts do
        get :current_user_posts, on: :collection
        member do
          post :reshare
        end
      end

      resources :account_preferences, only: [:index, :create] do
        collection do
          get :preferences
          delete :remove
        end
      end

      get 'store', :to => 'stores#index'
      get 'specifications', :to => 'stores#specifications'

      resources :tags, only: [:index]

      resources :dashboards do
        get 'engaged', on: :collection
      end

      resources :user_views, only: [:index, :create] do
        collection do
          get :user_view
          get :active_users
        end
      end

      resources :sellers, only: [:create, :update] do
        collection do
          get :products
          get :abandoned_products
        end
      end
      resources :banners, only: [:index] do
        collection do
          get :sliders
          get :cagegory_logo
        end
      end

    end
  end
end
