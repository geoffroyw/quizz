class RenameExamToQuizz < ActiveRecord::Migration
  def change
    rename_table :exams, :quizzs
  end
end
