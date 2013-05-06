#encoding:utf-8
module ApplicationHelper

  def render_status_answer question
    if question.answers.blank?
      raw (link_to question.owner_username)+"于#{time_ago_in_words question.created_at}前发布"

    else
      raw (link_to question.answers.last.owner_username)+"于#{time_ago_in_words question.answers.last.created_at}前回复"
    end
  end

  def format_tags(tags, answer = '')
    html = ''
    tags.each do |tag|
      html += content_tag :span, class: 'post-tag' do
        link_to(tag, tag_path(tag, :no_answer => answer))
      end
    end
    html.html_safe
  end

  def render_status_counter
    #FIXME need memcache
    #@question ||= Question.all
    content_tag :div do
    I18n.t('counter_of_questions',  number: Question.count) + " , " +
    I18n.t('counter_of_answers',  number: Answer.count) + " , " +
    I18n.t('counter_of_rate',  rate: sprintf("%5.2f", Question.answer_coverage)) + " , " +
    I18n.t('counter_of_users',  number: User.count)
    end
  end

  def render_all_tags
    @tags = Tag.all
  end
end
