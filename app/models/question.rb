# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text             default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  viewed_count  :integer          default(0)
#  answers_count :integer          default(0)
#

class Question < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list

  validates_presence_of :title, :content, :user
  validate :validation_of_tag_list

  acts_as_taggable

  has_many :answers
  belongs_to :user, :counter_cache => true
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'

  default_scope order("title")
  scope :with_no_answer, where(:answers_count => 0)

  def validation_of_tag_list
    if self.user.has_role?(:member) && !self.user.has_role?(:admin)
      unless (self.tag_list - Question.tag_counts.map(&:name)).blank?
        errors[:tag_list] << I18n.t("flash.tag.create.alert")
      end
    end
  end
  private :validation_of_tag_list

  def vote_count score
    QuestionEvaluation.where(score: score ,question_id: id).size
  end

  class << self
    def answer_coverage
      (1-with_no_answer.count / count.to_f) * 100
    end
  end
end
