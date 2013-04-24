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

require 'spec_helper'

describe QuestionEvaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
