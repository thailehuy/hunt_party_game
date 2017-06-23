class AddExclusiveToTraits < ActiveRecord::Migration[5.1]
  def change
    add_column :traits, :exclusive, :boolean, default: false, null: false
  end
end
