class AddCharacterClassIdToSlots < ActiveRecord::Migration[5.1]
  def change
    add_reference :slots, :character_class, foreign_key: true, null: false
  end
end
