class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
      buybug
    elsif user.dispatcher?
      can :manage, Order
     else 
      cannot :manage, :all
    end
  end 
end
