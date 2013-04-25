require 'will_paginate/array'
class QuestionsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy, :new, :create, :evaluate]
  #load_and_authorize_resource only: [:update, :edit, :destroy]
  load_and_authorize_resource

  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).page(params[:page]).per_page(5)
    else
      @questions = Question.order("title").page(params[:page]).per_page(5)
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    Question.viewed(@question, cookies)
    @answers = @question.answers
    @answer = Answer.new
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
  end

  # GET /questions/1/edit

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: I18n.t("flash.actions.create.notice") }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: I18n.t("flash.actions.update.notice") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    redirect_to questions_url, notice: I18n.t("flash.actions.destory.notice")
  end

  def evaluate
    if QuestionEvaluation.where(user_id: current_user.id ,question_id: params[:question_id]).size == 0
     QuestionEvaluation.create(user_id: current_user.id,question_id: params[:question_id],score: params[:score])
      flash[:success] = I18n.t("flash.questions.evaluate.notice")
    else
      flash[:error] = I18n.t("flash.questions.evaluate.alert")
    end
    redirect_to "/questions/"+params[:question_id]
  end

  def no_answer
    @questions = Question.no_answer.paginate(page: params[:page], per_page: 5)
    #if params[:tag]
      #@questions = Question.no_answer.tagged_with(params[:tag]).page(params[:page]).per_page(5)
    #else
      #@questions = Question.no_answer.order("title").page(params[:page]).per_page(5)
    #end
  end
end
