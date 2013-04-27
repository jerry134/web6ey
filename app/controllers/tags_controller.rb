class TagsController < ApplicationController
  skip_authorization_check
  def index
    @tags = Question.tag_counts
  end
end
