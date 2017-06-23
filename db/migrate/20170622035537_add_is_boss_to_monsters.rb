class AddIsBossToMonsters < ActiveRecord::Migration[5.1]
  def change
    add_column :monsters, :is_boss, :boolean, null: false, default: false
  end
end
