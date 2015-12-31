require 'rails_helper'

RSpec.describe 'questions/edit', type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(:intro_text => 'exam text', :name => 'exam name'))
    @question = assign(:question, Question.create!(
      :text => 'MyString',
      :exam => @exam
    ))
  end

  it 'renders the edit question form' do
    render

    assert_select 'form[action=?][method=?]', exam_question_path(@exam,@question), 'post' do

      assert_select 'input#question_text[name=?]', 'question[text]'

    end
  end
end
