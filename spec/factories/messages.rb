# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    user_id 1
    answer_id 1
    status MessageStatus::UN_READ
  end
end
