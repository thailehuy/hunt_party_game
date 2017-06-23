class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :character, foreign_key: true
      t.references :party, foreign_key: true, null: false
      t.references :character_slot, foreign_key: true

      t.timestamps
    end
  end
end
