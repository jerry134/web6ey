require 'spec_helper'
require "cancan/matchers"

describe Ability do
  context "when user has not signed in" do
    subject {Ability.new nil}
    it { should be_able_to(:read, :all) }
    it { should_not be_able_to(:create, Question) }
    it { should_not be_able_to(:create, Answer) }
  end

  it "when user signed in with a admin role" do
    user = create :user, :admin

    ability = Ability.new(user)
    ability.should be_able_to(:manage, :all)
  end

  context "when user has signed in with a member role" do
    # the role of deault user is member
    let(:member) { create :user, :member }
    subject { Ability.new(member) }

    it { should be_able_to(:read, :all) }
    it { should be_able_to(:create, Question) }
    it { should be_able_to(:create, Answer) }

    context "can not update and destroy things belongs to others" do
      it { should_not be_able_to(:update, Question.new)}
      it { should_not be_able_to(:update, Answer.new)}
      it { should_not be_able_to(:destroy, Question.new)}
      it { should_not be_able_to(:destroy, Answer.new)}
      it { should_not be_able_to(:closed, Question.new)}
    end

    context "can update and destroy things belongs to him" do
      it { should be_able_to(:update, member.questions.new)}
      it { should be_able_to(:update, member.answers.new)}
      it { should be_able_to(:destroy, member.questions.new)}
      it { should be_able_to(:destroy, member.answers.new)}
      it { should be_able_to(:closed, member.questions.new)}
    end
  end
end
