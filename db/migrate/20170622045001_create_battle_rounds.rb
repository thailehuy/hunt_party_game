class CreateBattleRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :battle_rounds do |t|
      t.references :hunt, foreign_key: true, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
