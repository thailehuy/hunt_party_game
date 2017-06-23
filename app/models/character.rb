class Character < ApplicationRecord
  belongs_to :party
  belongs_to :character_class
  has_many :character_attributes, dependent: :destroy
  has_many :character_traits, dependent: :destroy
  has_many :traits, through: :character_traits

  attr_accessor :stats

  def self.name_generator
    @_name_generator ||= Namey::Generator.new
  end

  def self.random_name
    name_generator.generate(with_surname: true, min_freq: 90, max_freq: 100)
  end

  def add_attributes!
    Trait.exclusive.for_class(character_class).each do |trait|
      traits << trait unless traits.include?(trait)
    end
  end

  def add_traits!
    arr = Trait.non_exclusive.for_class(character_class).to_a.sample(2)
    arr.each do |trait|
      traits << trait unless traits.include?(trait)
    end
  end

  def base_stats
    @_base_stats ||= OpenStruct.new(
        health: 0,
        power: 0,
        defense: 0,
        dodge: 0,
        pierce: 0,
        taunt: 0,
        recovery: 0,
        power_charge: 0,
        dead: false
    )
  end

  def calculate_stats
    traits.includes(:attribute_type).each do |trait|
      affected_stat = trait.attribute_type.name.downcase.gsub(' ', '_').to_sym
      base_stats[affected_stat] = base_stats[affected_stat] + trait.value
    end

    self.stats = base_stats
  end
end
