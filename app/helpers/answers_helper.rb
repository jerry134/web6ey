module AnswersHelper

  def exist_any_accept_answer?(answers)
    answers.any? {|answer| answer.accept == true}
  end
end
