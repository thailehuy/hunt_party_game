class Party < ApplicationRecord
  belongs_to :player
  belongs_to :location
  has_many :characters, dependent: :destroy

  has_many :hunts

  def gather_characters!
    CharacterClass.all.each do |char_class|
      character = characters.create(character_class: char_class, name: Character.random_name)
      character.add_attributes!
      character.add_traits!
    end
  end

  def wiped?
    characters.all?{|char| char.stats.dead}
  end
end
