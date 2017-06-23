class CreateHunts < ActiveRecord::Migration[5.1]
  def change
    create_table :hunts do |t|
      t.references :party, foreign_key: true, null: false
      t.references :monster, foreign_key: true, null: false

      t.timestamps
    end
  end
end
