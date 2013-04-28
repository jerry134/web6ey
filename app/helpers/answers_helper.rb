module AnswersHelper

  def exist_any_accept_answer?(answers)
    answers.any? &:accept?
  end
end
