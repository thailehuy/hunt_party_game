class Trait < ApplicationRecord
  validates :name, :description, :value, presence: true

  belongs_to :character_class
  belongs_to :attribute_type

  scope :exclusive, -> { where(exclusive: true) }
  scope :non_exclusive, -> { where(exclusive: false) }
  scope :for_class, -> (char_class) { where(character_class_id: char_class.id) }
end
