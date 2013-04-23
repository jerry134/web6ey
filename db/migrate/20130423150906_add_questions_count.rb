class AddQuestionsCount < ActiveRecord::Migration
  def up
    add_column :users, :questions_count, :integer, :default => 0
  end

  def down
  end
end
