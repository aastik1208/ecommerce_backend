class App
  class << self
    def creds
      Rails.application.credentials.config
    end

    def get_product_reviews(relatable_type, product_id, count = nil)
      scope = Review.includes(:customer)
        .where(relatable_type: relatable_type, relatable_id: product_id)
        .order(id: :desc)

      if count.present?
        scope = scope.limit(count.to_i)
      end
      scope
    end
  end
end