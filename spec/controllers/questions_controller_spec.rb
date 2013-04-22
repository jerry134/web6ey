require 'spec_helper'
describe QuestionsController do
  let(:user){FactoryGirl.create(:user)}
  let(:question){user.questions.create(title: "question", content: "this is question")}
  
  describe "Not the creator of the question" do
    before do
      user = FactoryGirl.create(:user)
      sign_in(:user, user) 
    end

    it "cannot destroy the question" do
      delete :destroy, id: question.id
      response.should redirect_to root_path
      flash[:alert].should eql("无权限修改")
    end

    it "cannot edit the question" do
      get :edit, id: question.id
      response.should redirect_to root_path
      flash[:alert].should eql("无权限修改")
    end
  end
end
