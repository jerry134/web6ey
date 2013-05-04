require 'spec_helper'
describe QuestionsController do
  let(:user) { create(:user) }
  let(:question){ user.questions.create(title: "question", content: "this is question") }

  context "Not the creator of the question" do
    before(:each) do
      user = create(:user)
      sign_in(:user, user)
    end

    it "cannot destroy the question" do
      delete :destroy, id: question.id
      response.should redirect_to root_path
      flash[:alert].should eql(I18n.t('flash.access_denied'))
    end

    it "cannot edit the question" do
      get :edit, id: question.id
      response.should redirect_to root_path
      flash[:alert].should eql(I18n.t('flash.access_denied'))
    end
  end

  describe "not sign_in" do
    it "#index should have an index action" do
      get :index
      response.should be_success
    end

    it "#show should have an show action" do
      get :show, :id => question.id
      response.should be_success
    end

    it "#new should not have a new action" do
      get :new
      response.should_not be_success
    end

    it "#create should not have a create action" do
      post 'create'
      response.should be_redirect
    end

    it "#edit should not have edit action" do
      get :edit, :id => question.id
      response.should_not be_success
    end

    it "#destroy should not have a destroy action" do
      delete :destroy, id: question.id
      response.should be_redirect
    end
  end

  describe "sign_in" do
    let(:valid_attributes) { attributes_for(:question) }

    before(:each) do
      sign_in user
    end

    it "#new should have a new action" do
      get :new
      response.should be_success
    end

    it "#create should have create action" do
      expect {
        post 'create', :question => valid_attributes
      }.to change{Question.count}.by(1)
    end

    it "#edit should have edit action" do
      get :edit, :id => question.id
      response.should be_success
    end

    it "#destroy should have a destroy action" do
      question = user.questions.create(title: "question", content: "this is question")
      expect {
        delete :destroy, id: question.id
      }.to change{Question.count}.by(-1)
    end
  end
end
