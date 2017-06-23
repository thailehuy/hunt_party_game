class Location < ApplicationRecord
  validates :name, :description, presence: true

  has_many :parties
  has_many :monsters

  def self.beginner
    order(id: :asc).first
  end
end
