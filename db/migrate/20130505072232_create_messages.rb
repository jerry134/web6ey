class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :answer_id
      t.integer :status

      t.timestamps
    end
  end
end
