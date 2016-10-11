class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.current_admin
      can :manage, :all
     else 
      can :read, :all
      can :create, Order
    end

    if user.current_dispatcher
      can :manage, :orders
    end
  end 
end
