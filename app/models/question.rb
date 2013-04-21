# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Question < ActiveRecord::Base

  validates_presence_of :title, :content
  attr_accessible :content, :title, :tag_list
  acts_as_taggable
  belongs_to :user
  has_many :answers
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'
  scope :owner, joins(:user)
end
