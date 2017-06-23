class BattleActionType < ApplicationRecord
  validates :name, presence: true

  BASE_TYPES = %w(attack buff heal miss idle)

  def self.create_defaults
    BASE_TYPES.each do |base_type|
      where(name: base_type).first_or_create
    end
  end

  BASE_TYPES.each do |base_type|
    define_singleton_method "#{base_type}_action" do
      where(name: base_type).first_or_create
    end
  end
end
