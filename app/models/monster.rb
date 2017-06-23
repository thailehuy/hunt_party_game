class Monster < ApplicationRecord
  belongs_to :location
  belongs_to :monster_class

  has_many :monster_attributes


  validates :name, presence: true

  scope :boss, -> { where(is_boss: true) }
  scope :not_boss, -> { where(is_boss: false) }
  scope :for_location, -> (location) { where(location_id: location.id) }

  attr_accessor :stats

  def base_stats
    @_base_stats ||= OpenStruct.new(
        health: 0,
        power: 0,
        defense: 0,
        dodge: 0,
        pierce: 0,
        taunt: 100,
        recovery: 0,
        power_charge: 0,
        dead: false
    )
  end

  def calculate_stats
    monster_attributes.includes(:attribute_type).each do |monster_attribute|
      affected_stat = monster_attribute.attribute_type.name.downcase.gsub(' ', '_').to_sym
      base_stats[affected_stat] = base_stats[affected_stat] + monster_attribute.value
    end

    self.stats = base_stats
  end
end
