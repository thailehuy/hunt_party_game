class AddVictoriousToHunt < ActiveRecord::Migration[5.1]
  def change
    add_column :hunts, :victorious, :boolean, null: false, default: false
  end
end
