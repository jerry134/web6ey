# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  question_id :integer
#  accept      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'spec_helper'

describe Answer do
  let(:answer) { build :answer }

  it "passes validation with all valid informations" do
    expect(answer).to be_valid
  end
end
