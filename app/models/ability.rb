# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :index, :home

    if user.admin?
      can :manage, :all
    else
      can [:read], User
    end
  end
end
