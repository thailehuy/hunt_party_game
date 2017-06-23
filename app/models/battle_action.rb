class BattleAction < ApplicationRecord
  belongs_to :battle_action_type
  belongs_to :actor, polymorphic: true
  belongs_to :target, polymorphic: true

  validates :value, presence: true
end
