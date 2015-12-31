class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :question_id
      t.boolean :is_correct

      t.timestamps null: false
    end
  end
end
