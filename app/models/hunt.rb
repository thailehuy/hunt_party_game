class Hunt < ApplicationRecord
  attr_accessor :hunt_type

  belongs_to :party
  belongs_to :monster

  has_many :battle_rounds

  validates :party_id, :monster_id, presence: true

  def process!
    assign_target
    simulate_battle if monster.present?
    save!
  end

  def assign_target
    if hunt_type == 'mob'
      find_monster_target!
    elsif hunt_type == 'boss'
      find_boss_target!
    else
      errors.add(:base, 'Invalid hunt')
    end
  end

  def find_monster_target!
    self.monster = Monster.not_boss.for_location(party.location).order('RANDOM()').first
  end

  def find_boss_target!
    self.monster = Monster.boss.for_location(party.location).order('RANDOM()').first
  end

  def boss_battle?
    monster.is_boss?
  end

  def max_rounds
    boss_battle? ? 10 : 5
  end

  def simulate_battle
    monster.calculate_stats
    party.characters.map(&:calculate_stats)

    (1..max_rounds).to_a.each do |round_number|
      round = battle_rounds.build(number: round_number)
      round.calculate_outcome
      break if round.concluded?
    end

    self.victorious = true if monster.stats.health <= 0
    self.defeated = true if party.wiped?
  end
end
