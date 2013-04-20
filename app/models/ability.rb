class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :member
      can :create, :Question
      can :update, :Question do |question|
      # add user later
      # question.try(:user) == user || user.has_role?(:admin) 
      end
    else
      can :read, :all
    end
  end
end
