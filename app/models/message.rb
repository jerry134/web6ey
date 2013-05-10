class Message < ActiveRecord::Base
  attr_accessible :answer_id, :status, :user_id

  default_scope order('id desc')

  belongs_to :answer
  belongs_to :user
end
