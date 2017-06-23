class CreateMonsterAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :monster_attributes do |t|
      t.references :monster, foreign_key: true, null: false
      t.references :attribute_type, foreign_key: true, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
