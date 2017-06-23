class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :party

  after_commit on: :create do
    gather_party
  end

  def gather_party
    unless party
      new_party = create_party(hunt_energy: 20, bounty_energy: 0, experience: 0, level: 1, location: Location.beginner)
      new_party.gather_characters!
    end
  end
end
