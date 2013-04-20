class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :user_roles
  has_many :users, :through => :user_roles
end
