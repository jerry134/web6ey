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
      Message.create({answer_id:@answer.id, status:MessageStatus::UN_READ, user_id:@question.user.id})  unless @answer.user == @question.user
      redirect_to @question , notice: I18n.t("flash.actions.create.notice")
    else
      render :new
    end
  end

  def accept
    @answer = Answer.find(params[:answer_id])
    @answer.accept = true
    if @answer.save
      flash[:false] = "accept false"
    else
      flash[:success] = "accept success"
    end
    redirect_to "/questions/" + params[:question_id]
  end
  private
  def load_question
    @question = Question.find(params[:question_id])
  end
end
