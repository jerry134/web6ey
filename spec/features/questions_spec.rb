#encoding: utf-8
require 'spec_helper.rb'
describe "the questions displays process", type: :feature do
  before :each do 
    @role = Role.create(name: 'admin')
    @user = @role.users.create username: 'abc'
    @question = create :question, user: @user, tag_list: 'tag1, tag2'
  end
  
  it "displays question without signin" do
    visit root_path
    page.should have_content '问题'
    page.should have_content '标签云'
    click_link @question.title
    page.should have_content '发布'
  end
end