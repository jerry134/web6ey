class CreateQuestionEvaluations < ActiveRecord::Migration
  def change
    create_table :question_evaluations do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
