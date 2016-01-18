class CreateAnswerSubmissions < ActiveRecord::Migration
  def change
    create_table :answer_submissions do |t|
      t.integer :question_submission_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
