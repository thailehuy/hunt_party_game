class MonsterClass < ApplicationRecord
  validates :name, :description, presence: true
end
