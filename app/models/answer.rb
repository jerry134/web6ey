class Answer < ActiveRecord::Base
  attr_accessible :accept, :content, :question_id
  belongs_to :question
  belongs_to :user
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'
end
