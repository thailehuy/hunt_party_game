class CreateMonsterLoots < ActiveRecord::Migration[5.1]
  def change
    create_table :monster_loots do |t|
      t.references :monster, foreign_key: true, null: false
      t.references :item_type, foreign_key: true, null: false
      t.integer :value, null: false
      t.integer :loot_chance, null: false

      t.timestamps
    end
  end
end
