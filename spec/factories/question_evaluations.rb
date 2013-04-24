# == Schema Information
#
# Table name: question_evaluations
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_evaluation do
    quesion_id 1
    user_id 1
    score 1
  end
end
