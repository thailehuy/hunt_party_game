class CharacterClass < ApplicationRecord
  validates :name, :description, presence: true

  def self.create_defaults
    %w(Knight Ranger Wizard Alchemist).each do |name|
      where(name: name).first_or_create(description: "First #{name}")
    end
  end
end
