class Location < ApplicationRecord
  validates :name, :description, presence: true

  has_many :parties
  has_many :monsters

  def self.create_defaults
    where(name: 'Beginner Zone').first_or_create(description: 'First zone ever')
  end

  def self.beginner
    order(id: :asc).first
  end
end
