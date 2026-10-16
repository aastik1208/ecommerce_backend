class ChangeDefaultValueOfReaction < ActiveRecord::Migration[6.1]
  def change 
    change_column_default :reactions, :reaction_type, from: 'like', to: 'heart' 
  end
end
