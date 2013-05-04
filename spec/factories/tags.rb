# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string
#  describe    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryGirl.define do
  factory :tag do
    sequence(:name) {|n| "tag#{n}"}
    describe "mycontext"

    factory :invalid_tag do
      name nil
    end
  end
end
