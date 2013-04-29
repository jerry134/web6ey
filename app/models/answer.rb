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

class Answer < ActiveRecord::Base
  attr_accessible :accept, :content, :question_id, :user

  belongs_to :question, counter_cache: true
  belongs_to :user
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'
end
