# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  image                  :string(255)
#  questions_count        :integer          default(0)
#

require 'spec_helper'
describe User do
  it "should have some questions" do
    user1 = create :user
    question1 = user1.questions.create(title: 'question1', content: 'Here is some content')
    question1.save
    expect(question1.user).to eq user1
  end
end
