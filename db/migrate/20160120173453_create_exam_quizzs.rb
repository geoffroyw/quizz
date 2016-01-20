class CreateExamQuizzs < ActiveRecord::Migration
  def change
    create_table :exam_quizzs do |t|
      t.integer :exam_id
      t.integer :quizz_id

      t.timestamps null: false
    end
  end
end
