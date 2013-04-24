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

class QuestionEvaluation < ActiveRecord::Base
  attr_accessible :question_id, :score, :user_id
end
