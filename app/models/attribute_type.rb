class AttributeType < ApplicationRecord
  validates :name, :description, :base_value, presence: true

  DEFAULTS_HASH = {
      health: 0,
      power: 0,
      defense: 0,
      dodge: 0,
      pierce: 0,
      taunt: 0,
      recovery: 0,
      power_charge: 0
  }

  def self.create_defaults
    DEFAULTS_HASH.each do |attr, val|
      where(name: attr.to_s.gsub('_', ' ').capitalize).first_or_create(base_value: val, description: "Base attribute #{attr}")
    end
  end

  DEFAULTS_HASH.each do |attr, _|
    define_singleton_method "#{attr}_type" do
      where(name: attr.to_s.gsub('_', ' ').capitalize).first
    end
  end
end
