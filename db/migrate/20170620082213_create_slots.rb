class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
