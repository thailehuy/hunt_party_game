class CreateBattleActionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :battle_action_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
