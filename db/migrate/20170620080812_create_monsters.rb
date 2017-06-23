class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
      t.references :location, foreign_key: true, null: false
      t.references :monster_class, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
