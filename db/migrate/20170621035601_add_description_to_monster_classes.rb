class AddDescriptionToMonsterClasses < ActiveRecord::Migration[5.1]
  def change
    add_column :monster_classes, :description, :text, null: false
  end
end
