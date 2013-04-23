class AnswersController < ApplicationController
  load_and_authorize_resource
  before_filter :load_question

  def index
    @answers = @question.answers
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(params[:answer])
    if current_user.answers << @answer
    #if @answer.save
      redirect_to @question , notice: I18n.t("flash.actions.create.notice")
    else
      render :new
    end
  end

  private
  def load_question
    @question = Question.find(params[:question_id])
  end
end
