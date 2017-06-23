class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.references :character_class, foreign_key: true, null: false
      t.string :name, null: false
      t.references :party, foreign_key: true, null: false

      t.timestamps
    end
  end
end
