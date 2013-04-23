# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    content "MyText"
    question_id 1
    accept false
    user_id 1
  end
end
