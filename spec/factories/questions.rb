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

FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "question#{n}"}
    content { Forgery(:lorem_ipsum).words(10) }
    tag_list ''
    user

    factory :invalid_question do
      title nil
      content nil
    end
  end
end
