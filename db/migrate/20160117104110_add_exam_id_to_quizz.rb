class AddExamIdToQuizz < ActiveRecord::Migration
  def change
    add_column :quizzs, :exam_id, :integer
  end
end
