require 'spec_helper'
require "cancan/matchers"

describe Ability do
  context "when user has not signed in" do
    subject {Ability.new nil}
    it { should be_able_to(:read, :all) }
    it { should_not be_able_to(:create, Question) }
    it { should_not be_able_to(:create, Answer) }
  end

  it "can manage Book when user has a admin role" do
    user = create :user
    admin = Role.create(name: 'admin')
    user.roles << admin

    ability = Ability.new(user)
    ability.should be_able_to(:manage, :all)
  end

  context "when user has signed in with a member role" do
    before(:all) do
      @user = create :user
      member = Role.create(name: 'member')
      @user.roles << member
    end
    subject { Ability.new(@user) }

    it { should be_able_to(:read, :all) }
    it { should be_able_to(:create, Question) }
    it { should be_able_to(:create, Answer) }

    context "can not update and destroy things belongs to others" do
      it { should_not be_able_to(:update, Question.new)}
      it { should_not be_able_to(:update, Answer.new)}
      it { should_not be_able_to(:destroy, Question.new)}
      it { should_not be_able_to(:destroy, Answer.new)}
    end
  end
end
