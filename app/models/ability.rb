class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :member
      can :read, :all
      can [:evaluate, :viewed], Question
      can :create, [Question, Answer]
      can [:update, :destroy, :closed], Question do |question|
        question.try(:user) == user
      end
      can [:update, :destroy], Answer do |answer|
        answer.try(:user) == user
      end
    else
      can :viewed, Question
      can :read, :all
    end
  end
end
