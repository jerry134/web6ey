# == Schema Information
#
# Table name: tags
#
#  id       :integer          not null, primary key
#  name     :string(255)
#  describe :text
#
class Tag < ActsAsTaggableOn::Tag
  attr_accessible :describe
end
