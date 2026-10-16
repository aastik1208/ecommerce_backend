class AddRatingToReviewTable < ActiveRecord::Migration[6.1]
  def change
    add_column :app_reviews, :rating, :integer, default: 0
  end
end
