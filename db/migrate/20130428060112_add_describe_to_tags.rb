class AddDescribeToTags < ActiveRecord::Migration
  def change
    add_column :tags, :describe, :text
  end
end
