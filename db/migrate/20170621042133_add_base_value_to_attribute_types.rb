class AddBaseValueToAttributeTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :attribute_types, :base_value, :integer, null: false
  end
end
