class AttributeType < ApplicationRecord
  validates :name, :description, :base_value, presence: true
end
