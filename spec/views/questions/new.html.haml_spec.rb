require 'rails_helper'

RSpec.describe 'questions/new', type: :view do
  before(:each) do
    @exam = assign(:exam, FactoryGirl.create(:exam))
    assign(:question, Question.new(
      :text => 'MyString',
      :exam => @exam
    ))
  end

  it 'renders new question form' do
    render

    assert_select 'form[action=?][method=?]', exam_questions_path(@exam), 'post' do

      assert_select 'input#question_text[name=?]', 'question[text]'

    end
  end
end
