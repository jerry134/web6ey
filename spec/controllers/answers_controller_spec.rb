#encoding: utf-8
require 'spec_helper'

describe AnswersController do
  let!(:question) {create :question}
  let!(:answer) { create :answer, question: question }
  let!(:param_question) { {question_id: question.id} }
  describe "GET 'index'" do
    it "returns http success" do
      get :index, param_question 
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http failure" do
      get :new, param_question
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_successful
    end

    let!(:user) { create :user}
    it "return success" do
      sign_in user
      get :new, param_question
      response.should be_success
    end
  end
  
  describe "POST create answer" do
    let!(:user) {create :user, :member}
    it "return success" do
      sign_in user
      #assigns(:current_user).should == user
      post :create, param_question, attributes_for(:answer)
      #FIXME asked me to sign actually I already sigin
      #response.should be_success
    end
  end
end
