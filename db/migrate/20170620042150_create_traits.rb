class CreateTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.references :character_class, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.references :attribute_type, foreign_key: true, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
