# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text             default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  viewed_count  :integer          default(0)
#  answers_count :integer          default(0)
#

require 'spec_helper'
describe Question do
  let(:question) { build :question }

  it "passes validation with all valid informations" do
    expect(question).to be_valid
  end

  it "add new tag_list should passes validation by admin" do
    user = create :user
    admin = Role.find_or_create_by_name('admin')
    user.roles << admin
    question.user = user
    question.tag_list = "a,b,c"
    expect(question).to be_valid
  end

  it "add old tag_list should passes validation by member" do
    user1 = create :user
    admin = Role.find_or_create_by_name('admin')
    user1.roles << admin
    question.user = user1
    question.tag_list = "a,b,c"
    question.save

    user2 = create :user
    question2 = build :question
    question2.user = user2
    question2.tag_list = "a,b"
    expect(question2).to be_valid
  end
  
  context "no answer question" do
    #FIXME should be a factory girl relation
    it "list all no answer questions" do
      user1 = create :user
      question1 = create :question
      question1.answers.create(content: 'ab', user: user1)
      3.times{create :question}
      expect(Question.with_no_answer.count).to eql 3 
      expect(Question.with_no_answer).to eq Question.where(answers_count: 0)
    end
  end

  context "fails validation" do
    it "with a blank title" do
      question.title = ''
      expect(question.save).to be_false
    end

    it "with a blank content" do
      question.content = ''
      expect(question.save).to be_false
    end

    it "member can not create new tag" do
      question.tag_list = "a,b"
      expect(question.save).to be_false
    end
  end

  it "owner_user" do
    user = create :user
    question.user = user
    question.owner_username.should eq user.username
  end
end
