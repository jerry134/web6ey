# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  content      :text             default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  viewed_count :integer          default(0)
#

FactoryGirl.define do
  factory :question do
    title "question"
    content "mycontext"
    tag_list ""
    user
  end
end
