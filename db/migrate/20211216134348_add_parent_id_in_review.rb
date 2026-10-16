class AddParentIdInReview < ActiveRecord::Migration[6.1]
  def change
    add_column :app_reviews, :parent_id, :bigint
  end
end
