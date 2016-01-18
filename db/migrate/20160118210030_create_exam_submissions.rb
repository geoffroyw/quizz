class CreateExamSubmissions < ActiveRecord::Migration
  def change
    create_table :exam_submissions do |t|
      t.integer :exam_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
