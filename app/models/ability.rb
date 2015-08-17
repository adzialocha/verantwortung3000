class Ability

  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    alias_action :update, :destroy, :edit, :to => :change

    if user.admin?
        can :manage, :all
    else
        can :read, :all
        can :change, :all, :user_id => user.id
    end

    if User.exists?(user)
      can :create, :all
    end

  end

end
