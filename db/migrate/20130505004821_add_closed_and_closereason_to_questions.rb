class AddClosedAndClosereasonToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :closed, :boolean, default: false
    add_column :questions, :close_reason, :text
  end
end
