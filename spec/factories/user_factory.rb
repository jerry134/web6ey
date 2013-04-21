FactoryGirl.define do 
  factory :user do
    username "guest"
    sequence(:email){|n| "user#{n}@6bey.com"}
    password "passwordss"
    password_confirmation "passwordss"
  end
end
