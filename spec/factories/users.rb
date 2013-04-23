FactoryGirl.define do
  sample_username = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth', 'laly', 'tom', 'both'].sample
  sequence(:username) { |n| "#{sample_username}#{n}" }
  sequence(:email) { |n| "#{sample_username}#{n}@6bey.org".downcase }

  factory :user do
    username
    email
    password "passwordss"
    password_confirmation "passwordss"
  end
end
