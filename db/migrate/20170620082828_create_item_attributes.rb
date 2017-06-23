class CreateItemAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_attributes do |t|
      t.references :item_type, foreign_key: true, null: false
      t.references :attribute_type, foreign_key: true, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
