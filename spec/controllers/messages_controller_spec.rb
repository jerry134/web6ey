require 'spec_helper'

describe MessagesController do
  let(:message){create :message}
  before {  sign_in message.user }
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete :destroy, id: message
      response.should be_success
    end

    it "deletes the message" do
      expect{
        delete :destroy, id: message
      }.to change(Message, :count).by(-1)
    end
  end

end
