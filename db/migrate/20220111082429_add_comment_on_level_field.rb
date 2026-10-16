class AddCommentOnLevelField < ActiveRecord::Migration[6.1]
  def up
    change_column :app_account_preferences, :level, :integer, comment: "Optional field to denote the level of category 0 denotes main category, 1 denotes sub category and so on"
  end

  def down
    change_column :app_account_preferences, :level, :integer
  end
end
