class CreateBattleActions < ActiveRecord::Migration[5.1]
  def change
    create_table :battle_actions do |t|
      t.references :actor, polymorphic: true
      t.references :battle_action_type, foreign_key: true, null: false
      t.references :battle_round, foreign_key: true, null: false
      t.integer :value, null: false
      t.integer :target_remaining_health, null: false
      t.references :target, polymorphic: true

      t.timestamps
    end
  end
end
