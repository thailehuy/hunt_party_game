class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.references :player, foreign_key: true, null: false
      t.integer :hunt_energy, null: false
      t.integer :bounty_energy, null: false
      t.references :location, foreign_key: true, null: false
      t.integer :experience, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
