class AddAnswersCountToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :answers_count, :integer, default: 0

    Question.reset_column_information
    Question.all.each do |p|
      Question.update_counters p.id, :answers_count => p.answers.count
    end
  end

  def self.down
    remove_column :questions, :answers_count
  end
end
