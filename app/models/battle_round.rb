class BattleRound < ApplicationRecord
  belongs_to :hunt
  has_many :battle_actions

  delegate :party, :monster, to: :hunt, prefix: false

  def calculate_outcome
    calculate_monster_attack
    calculate_party_attack
  end

  def calculate_monster_attack
    targetted_character = determine_monster_target
    calculate_attack(monster, targetted_character)
  end

  def concluded?
    monster.stats.dead || party.wiped?
  end

  def determine_monster_target
    target = nil
    party.characters.each do |char|
      next if char.stats.taunt <= 0 || char.stats.dead
      taunt_roll = rand(100) + 1
      if taunt_roll <= char.stats.taunt
        target = char
        break
      end
    end

    unless target
      target = party.characters.select{|char| !char.stats.dead }.sample
    end

    target
  end

  def calculate_party_attack
    party.characters.each do |char|
      if char.stats.power > 0 && char.stats.power_charge == 0 # wizard cannot attack
        calculate_attack(char, monster)
      elsif char.stats.power_charge > 0 && number % char.stats.power_charge == 0 # wizard can use magic after certain rounds
        calculate_attack(char, monster)
      else # can't attack
        battle_actions.build(target: monster, actor: char, battle_action_type: BattleActionType.idle_action, value: 0, target_remaining_health: monster.stats.health)
      end

      break if monster.stats.health <= 0
    end
  end

  def calculate_attack(attacker, receiver)
    attack_damage = calculate_damage(attacker, receiver)
    if attack_damage >= 0
      receiver.stats.health = receiver.stats.health - attack_damage
      if receiver.stats.health <= 0
        receiver.stats.health = 0
        receiver.stats.dead = true
      end
      battle_actions.build(target: receiver, actor: attacker, battle_action_type: BattleActionType.attack_action, value: attack_damage, target_remaining_health: receiver.stats.health)
    else # dodged
      battle_actions.build(target: receiver, actor: attacker, battle_action_type: BattleActionType.miss_action, value: 0, target_remaining_health: receiver.stats.health)
    end
  end

  def calculate_damage(attacker, receiver)
    if receiver.stats.dodge > 0
      dodge_roll = rand(100) + 1
      if dodge_roll < receiver.stats.dodge
        return -1
      end
    end
    defense = receiver.stats.defense - attacker.stats.pierce
    defense = 0 if defense < 0 # pierce is useless against non-armor

    damage = attacker.stats.power - defense
    damage = 0 if damage < 0 # full block
    damage
  end
end
