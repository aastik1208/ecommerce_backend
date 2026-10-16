class AddParentIdToPreferences < ActiveRecord::Migration[6.1]
  def change
    add_column :app_account_preferences, :parent_id, :bigint
  end
end
