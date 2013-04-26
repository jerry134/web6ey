# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  content      :text             default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  viewed_count :integer          default(0)
#

class Question < ActiveRecord::Base

  validates_presence_of :title, :content, :user
  attr_accessible :content, :title, :tag_list
  acts_as_taggable
  belongs_to :user, :counter_cache => true
  has_many :answers
  delegate :username, to: :user, allow_nil: true, prefix: 'owner'
<<<<<<< HEAD
  scope :owner, joins(:user)
  scope :without_answer, joins(:answers).
     select('questions.id').
     group('questions.id').
     having('count(answers.id) = 0')
  default_scope where(Question.arel_table[:content].not_eq(nil))

  scope :without_any_answer, where(Question.arel_table[:answers_count].eq(0)) 
  scope :with_no_answer, -> {includes(:answers).select{ |q|q.answers.count == 0}}
  
  validate :validation_of_tag_list
=======
>>>>>>> upstream/master

  default_scope order("title")
  scope :with_no_answer, where(:answers_count => 0)

  validate :validation_of_tag_list

  def validation_of_tag_list
    if self.user.has_role?(:member) && !self.user.has_role?(:admin)
      unless (self.tag_list - Question.tag_counts.map(&:name)).blank?
        errors[:tag_list] << I18n.t("flash.tag.create.alert")
      end
    end
  end
  private :validation_of_tag_list

  def self.viewed(question, cookies)
    unless cookies[question.id]
      cookies.permanent[question.id] = true
      update_counters question.id, viewed_count: 1
    end
  end

  def vote_count score
    QuestionEvaluation.where(score: score ,question_id: id).size
  end
end
