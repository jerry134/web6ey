class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :member
      can :read, :all
      can :create, [Question, Answer]
      can [:update, :destroy], Question do |question|
        question.try(:user) == user || user.has_role?(:admin)
      end
      can [:update, :destroy], Answer do |answer|
        answer.try(:user) == user || user.has_role?(:admin)
      end
    else
      can :no_answer, Question
      can :read, :all
    end
  end
end
