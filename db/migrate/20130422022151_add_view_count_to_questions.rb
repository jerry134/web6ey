class AddViewCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :viewed_count, :integer, default: 0
  end
end
