require 'spec_helper'
describe User do
  it "should have some questions" do
    user1 = create :user
    question1 = user1.questions.create(title: 'question1', content: 'Here is some content')
    question1.save
    expect(question1.user).to eq user1
  end
end
