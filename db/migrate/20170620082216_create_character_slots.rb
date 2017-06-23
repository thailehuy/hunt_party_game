class CreateCharacterSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :character_slots do |t|
      t.references :character, foreign_key: true, null: false
      t.references :slot, foreign_key: true, null: false

      t.timestamps
    end
  end
end
