#encoding: utf-8
require 'spec_helper.rb'
describe "the questions displays process", type: :feature do
  let!(:usr) { create :user, :admin }
  let!(:question) { create :question, user: usr}
  it "displays question without signin" do
    visit root_path
    page.should have_content '问题'
    page.should have_content '标签云'
    click_link question.title
    page.should have_content '发布'
  end
end