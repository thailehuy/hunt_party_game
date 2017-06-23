class CharacterClass < ApplicationRecord
  validates :name, :description, presence: true
end
