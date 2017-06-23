class CreateMonsterClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :monster_classes do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
