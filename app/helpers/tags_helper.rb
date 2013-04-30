#encoding: utf-8
module TagsHelper
  def wrap(content)
    if content.nil?
      content = " "
    end
    raw(content.split.map{|s| wrap_long_string(s)}.join(' '))
  end

  def tag_count_of_time(tag, time)
    question = Question.tagged_with(tag.name)
    if time == 'month'
      a = question.select{|q| q.created_at.month == Time.now.month}.count
      "本月有#{a}人提问" if a != 0
    else
      a = question.select{|q| q.created_at.year == Time.now.year}.count
      ", 本年有#{a}人提问" if a != 0
    end
  end

  private
  def wrap_long_string(text, max_width = 40)
    zero_width_space = "&#8203"
    regex = /.{1,#{max_width}}/
    (text.length < max_width) ? text :text.scan(regex).join(zero_width_space)
  end
end
