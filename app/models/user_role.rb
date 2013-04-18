class UserRole < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user
  belongs_to :role
end
