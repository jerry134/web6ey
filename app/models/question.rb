class Question < ActiveRecord::Base

  validates_presence_of :title, :content
  attr_accessible :content, :title, :tag_list
  acts_as_taggable
  belongs_to :user
  delegate :email, to: :user, allow_nil: true, prefix: 'owner'
  scope :owner, joins(:user)
end
