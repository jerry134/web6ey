class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.boolean :accept

      t.timestamps
    end
  end
end
