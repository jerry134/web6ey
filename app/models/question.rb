#encoding:utf-8
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

  validates_presence_of :title, :content, :user
  attr_accessible :content, :title, :tag_list
  acts_as_taggable
  belongs_to :user
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'
  scope :owner, joins(:user)

  def all_tags
    Question.tag_counts.map(&:name)
  end

  validate :validation_of_tag_list
  def validation_of_tag_list
    if self.user.has_role?(:member) && !self.user.has_role?(:admin)
      unless (self.tag_list - Question.tag_counts.map(&:name)).blank?
        errors[:tag_list] << "只有管理员才能创建新标签。"
      end
    end
  end
  private :validation_of_tag_list
end
