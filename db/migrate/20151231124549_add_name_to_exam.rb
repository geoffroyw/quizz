class AddNameToExam < ActiveRecord::Migration
  def change
    add_column :exams, :name, :string, :null => false
  end
end
