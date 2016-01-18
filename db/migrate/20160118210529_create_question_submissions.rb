class CreateQuestionSubmissions < ActiveRecord::Migration
  def change
    create_table :question_submissions do |t|
      t.integer :exam_submission_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
