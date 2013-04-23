FactoryGirl.define do
  factory :question do
    title "question"
    content "mycontext"
    tag_list ""
    user
  end
end
