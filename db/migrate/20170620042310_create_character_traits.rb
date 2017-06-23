class CreateCharacterTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :character_traits do |t|
      t.references :character, null: false
      t.references :trait, null: false

      t.timestamps
    end
  end
end
