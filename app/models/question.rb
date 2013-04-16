class Question < ActiveRecord::Base

  validates_presence_of :title, :content
  attr_accessible :content, :title
end
