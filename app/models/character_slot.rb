class CharacterSlot < ApplicationRecord
  belongs_to :slot
  belongs_to :character
end
