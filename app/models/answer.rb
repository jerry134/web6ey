class Answer < ActiveRecord::Base
  attr_accessible :accept, :content, :question_id
  belongs_to :question
end
