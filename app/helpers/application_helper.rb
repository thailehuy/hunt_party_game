module ApplicationHelper
  def page_title
    'RPG Party the Web Game'
  end

  def seo_keywords
    'rpg,party,web,passive,game,free'
  end

  def seo_description
    'Welcome to a free passive web game featuring classic RPG party and monster hunting'
  end

  def display_battle_action(battle_action)
    case battle_action.battle_action_type
      when BattleActionType.miss_action
        "#{battle_action.actor.name} missed #{battle_action.target.name} (#{battle_action.target_remaining_health} health remains)"
      when BattleActionType.attack_action
        "#{battle_action.actor.name} attacked #{battle_action.target.name} for #{battle_action.value} damages (#{battle_action.target_remaining_health} health remains)"
      when BattleActionType.idle_action
        "#{battle_action.actor.name} does not attack this turn"
    end
  end
end
