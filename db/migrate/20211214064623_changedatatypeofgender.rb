class Changedatatypeofgender < ActiveRecord::Migration[6.1]
  def self.up
    change_table :app_accounts do |t|
      t.change :gender, :integer
    end
  end
  def self.down
    change_table :app_accounts do |t|
      t.change :gender, :string
    end
  end
end
