class AttributeType < ApplicationRecord
  validates :name, :description, :base_value, presence: true

  def self.create_defaults
    {
        health: 0,
        power: 0,
        defense: 0,
        dodge: 0,
        pierce: 0,
        taunt: 0,
        recovery: 0,
        power_charge: 0
    }.each do |attr, val|
      where(name: attr.to_s.gsub('_', ' ').capitalize).first_or_create(base_value: val, description: "Base attribute #{attr}")
    end
  end
end
