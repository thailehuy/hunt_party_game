class AddDefeatedToHunts < ActiveRecord::Migration[5.1]
  def change
    add_column :hunts, :defeated, :boolean, null: false, default: false
  end
end
