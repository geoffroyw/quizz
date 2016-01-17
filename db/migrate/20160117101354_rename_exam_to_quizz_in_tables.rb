class RenameExamToQuizzInTables < ActiveRecord::Migration
  def change
    rename_column :questions, :exam_id, :quizz_id
  end
end
