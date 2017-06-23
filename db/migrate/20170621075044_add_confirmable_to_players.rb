class AddConfirmableToPlayers < ActiveRecord::Migration[5.1]
  def change
    change_table :players do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
  end
end
