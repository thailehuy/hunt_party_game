class CharacterClass < ApplicationRecord
  validates :name, :description, presence: true

  BASE_CLASSES = {
      knight: 'Knight',
      ranger: 'Ranger',
      wizard: 'Wizard',
      alchemist: 'Alchemist'
  }

  def self.create_defaults
    BASE_CLASSES.values.each do |name|
      where(name: name).first_or_create(description: "First #{name}")
    end
  end

  BASE_CLASSES.each do |class_key, class_value|
    define_singleton_method "#{class_key}_class" do
      where(name: class_value).first
    end
  end
end
