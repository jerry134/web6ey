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

  describe "GET edit answer" do
    it "returns failure of not signed in user" do
      get :edit, question_id: question.id, id: answer.id
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_success
    end
    it "return failure of invalid user" do
      sign_in user
      get :edit, question_id: question.id, id: answer.id
      response.should_not be_success
    end
    it "return success of valid user" do
      sign_in answer.user
      get :edit, question_id: question.id, id: answer.id
      response.should be_success
    end
  end

  describe "PUT update answer" do
    it "return failure of not signed in user" do
      put :update, question_id: question.id, id: answer.id, answer: valid_attributes
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_success
    end
    it "return success of valid user" do
      sign_in answer.user
      put :update, question_id: question.id, id: answer.id, answer: valid_attributes
      response.should redirect_to question
      flash[:notice].should eq "更新成功。"
    end
    it "re-render the edit template of invalid attributes" do
      sign_in answer.user
      put :update, question_id: question.id, id: answer.id, answer: invalid_attributes
      response.should render_template :edit
    end
  end
 
  describe "DELETE destroy answer" do
    it "return failure of not signed in user" do
      delete :destroy, question_id: question.id, id: answer.id
      flash[:alert].should eq "继续操作请先登录。"
      response.should_not be_success
    end
    it "return success of valid user" do
      sign_in answer.user
      delete :destroy, question_id: question.id, id: answer.id
      flash[:notice].should eq "删除成功。"
      response.should redirect_to question
    end
  end 
end
