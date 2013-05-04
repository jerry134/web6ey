require 'spec_helper'

describe TagsController do
  let(:tag) { create(:tag) }
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  describe "GET #index" do
    it "populates an array of tags" do
      tag = create :tag
      get :index
      assigns(:tags).should eq([tag])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #edit" do
    context "unauthenticated" do
      it "should not allow anonymous access" do
        get :edit, :id => tag
        response.should_not be_success
      end
    end

    context "authenticated" do
      it "should not allow access from authenticated user of member" do
        sign_in user
        get :edit, :id => tag
        response.should_not be_success
      end

      it "should allow access from authenticated user of admin" do
        sign_in admin
        get :edit, :id => tag
        response.should be_success
      end
    end
  end

  describe "PUT #update" do
    let(:valid_attributes) { attributes_for(:tag) }
    let(:invalid_attributes) { attributes_for(:invalid_tag) }

    context 'when admin has signed in' do
      before(:each) do
        sign_in admin
      end

      context 'with valid attributes' do
        it 'update the tag' do
          put 'update', id: tag, tag: valid_attributes
          response.should redirect_to(tags_path)
          flash[:notice].should eql(I18n.t('flash.actions.update.notice'))
        end
      end

      context "with invalid attributes" do
        it "locates the requested tag" do
          put :update, id: tag, tag: invalid_attributes
          assigns(:tag).should eq(tag)
        end

        it "re-renders the edit method" do
          put :update, id: tag, tag: invalid_attributes
          response.should render_template :edit
        end
      end
    end

    context 'when member has signed in' do
      it "should be redirect" do
        sign_in user
        put 'update', :id => tag.id, :tag => valid_attributes
        response.should be_redirect
      end
    end

    context 'when user has not signed in' do
      it "should be redirect" do
        put 'update', :id => tag.id, :tag => valid_attributes
        response.should be_redirect
      end
    end
  end
end
