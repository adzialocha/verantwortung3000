class Ability

  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    alias_action :update, :destroy, :edit, :to => :change

    if user.admin?
      can :manage, :all
    end

    if User.exists?(user)
      can :change, :all, :user_id => user.id
      can :read, :all
      can :create, :all
    else
      can :read, [ Production ]
    end

  end

end
