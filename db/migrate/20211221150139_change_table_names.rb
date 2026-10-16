class ChangeTableNames < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :items, :app_items
    rename_table :reactions, :app_reactions
  end

  def self.down
    rename_table :app_items, :items
    rename_table :app_reactions, :reactions
  end
end
