class CreateItemTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_types do |t|
      t.string :name, null: false
      t.references :slot, foreign_key: true, null: false
      t.references :rarity, foreign_key: true, null: false

      t.timestamps
    end
  end
end
