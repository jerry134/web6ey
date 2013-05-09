# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    user
    answer
    status MessageStatus::UN_READ
  end
end
