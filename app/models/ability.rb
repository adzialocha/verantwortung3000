class Ability

  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    alias_action :update, :destroy, :edit, :to => :change

    if user.admin?
      can :manage, :all
    else
      can :read, [Production, Event, User]
    end

    if User.exists?(user.id)

      can :change, [Production, Instrument, Device, Event], :user_id => user.id
      can :change, User, :id => user.id

      can :read, :all
      can :create, :all

    end

  end

end
