class AlterQuestionContent < ActiveRecord::Migration
  def up
    change_column("questions", "content", :text, :null => false)
  end

  def down
  end
end
