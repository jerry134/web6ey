#encoding: utf-8
require 'spec_helper'

describe AnswersController do
  let(:question) { create :question }
  let(:answer) { create :answer, question: question }

  let(:user) { create :user }
  let(:valid_attributes) { attributes_for(:answer).merge(question_id: question.id, user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:invalid_answer) }

  describe "GET 'index'" do
    it "returns http success" do
      get :index, question_id: question.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http failure" do
      get :new, question_id: question.id
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_successful
    end

    it "return success" do
      sign_in user
      get :new, question_id: question.id
      response.should be_success
    end
  end

  describe "POST create answer" do
    it "returns http failure" do
      post :create, question_id: question.id, answer: valid_attributes
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_successful
    end

    it "return success" do
      sign_in user
      expect {
        post :create, question_id: question.id, answer: valid_attributes
      }.to change(Answer, :count).by(1)
    end

    it "does not create with invalid attributes" do
      sign_in user
      expect {
        post :create, question_id: question.id, answer: invalid_attributes
      }.to_not change(Answer, :count)
    end

    it "re-renders the new method" do
      sign_in user
      post :create, question_id: question.id, answer: invalid_attributes
      response.should render_template :new
    end
  end
end
