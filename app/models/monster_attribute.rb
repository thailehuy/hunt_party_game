class MonsterAttribute < ApplicationRecord
  belongs_to :monster
  belongs_to :attribute_type

  validates :value, presence: true

  def name
    "#{value} #{attribute_type.name}"
  end
end
