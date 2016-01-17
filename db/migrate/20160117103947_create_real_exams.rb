class CreateRealExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :minimal_score
      t.string :name

      t.timestamps null: false
    end
  end
end
