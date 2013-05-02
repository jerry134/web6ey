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

FactoryGirl.define do
  sample_username = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth', 'laly', 'tom', 'both'].sample
  sequence(:username) { |n| "#{sample_username}#{n}" }
  sequence(:email) { |n| "#{sample_username}#{n}@6bey.org".downcase }

  factory :user do
    username
    email
    password "passwordss"
    password_confirmation "passwordss"

    trait :admin do
      after(:build) {|u| u.roles << Role.find_by_name('admin') }
    end

    # default role
    trait :member do
      after(:build) {|u| u.roles << Role.find_by_name('member') }
    end
  end
end
