class AddUserIdInAnswer < ActiveRecord::Migration
  def up
    add_column :answers, :user_id, :integer
  end

  def down
  end
end
