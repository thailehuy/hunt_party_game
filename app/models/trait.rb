class Trait < ApplicationRecord
  validates :name, :description, :value, presence: true

  belongs_to :character_class
  belongs_to :attribute_type

  scope :exclusive, -> { where(exclusive: true) }
  scope :non_exclusive, -> { where(exclusive: false) }
  scope :for_class, -> (char_class) { where(character_class_id: char_class.id) }

  def self.create_defaults
    CharacterClass::BASE_CLASSES.each do |base_class, base_class_name|
      AttributeType.all.each do |attribute_type|
        create!(
            name: "Base #{attribute_type.name}",
            description: "Base stat - #{attribute_type.name} for #{base_class_name}",
            character_class: CharacterClass.send("#{base_class}_class"),
            value: attribute_type.name == 'Power charge' ? 0 : 1,
            exclusive: true,
            attribute_type: attribute_type
        )
      end
    end
  end
end
