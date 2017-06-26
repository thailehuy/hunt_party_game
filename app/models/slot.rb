class Slot < ApplicationRecord
  validates :name, presence: true

  BASE_SLOTS = [:armor, :weapon, :offhand, :skill_left, :skill_right]

  scope :for_class, -> (char_class) { where(character_class_id: char_class.id) }

  def self.create_defaults
    CharacterClass::BASE_CLASSES.each do |class_type|
      char_class = CharacterClass.send("#{class_type}_class")
      BASE_SLOTS.each do |name|
        create(name: name.to_s.capitalize, character_class: char_class)
      end
    end
  end

  BASE_SLOTS.each do |name|
    define_singleton_method "#{name}_slot_for" do |char_class|
      where(name: name.to_s.capitalize, character_class_id: char_class.id).first
    end
  end
end
