module Api
  module V1
    module Products
      class ListSerializer < BaseSerializer

        def initialize(products)
          @products = products
        end

        def as_json(options = {})
          @products.collect do |product|
            {
              id: product["id"],
              store_id: product["store_id"],
              name: product["name"],
              type: product["type"],
              url: product["url"],
              is_salable: product["is_salable"],
              images: product["images"],
              currency_code: product["currency_code"],
              prices: get_prices(product["price_info"]),
              reviews: get_reviews(product["id"])
            }
          end
        end

        private

        def get_prices(info)
          {
            final_price: info["final_price"],
            regular_price: info["regular_price"],
          }
        end

        def get_reviews(product_id)
          reviews = App.get_product_reviews('Product', product_id, 3)
          reviews.collect do |review|
            Api::V1::ReviewSerializer.new(review)
          end
        end
      end
    end
  end
end
