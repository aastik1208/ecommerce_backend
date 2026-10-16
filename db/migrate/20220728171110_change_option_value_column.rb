class ChangeOptionValueColumn < ActiveRecord::Migration[6.1]
    def up
        change_column :option_values, :value, :text
    end

    def down
        change_column :option_values, :value, :string
    end

end
