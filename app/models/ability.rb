class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(User)
      can :manage, :all
    end
  end
end
