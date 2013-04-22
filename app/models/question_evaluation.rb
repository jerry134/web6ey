#encoding : utf-8
class QuestionEvaluation < ActiveRecord::Base
  attr_accessible :question_id, :score, :user_id
end
