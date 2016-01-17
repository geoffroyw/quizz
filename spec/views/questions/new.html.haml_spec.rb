require 'rails_helper'

RSpec.describe 'questions/new', type: :view do
  before(:each) do
    @quizz = assign(:quizz, FactoryGirl.create(:quizz))
    assign(:question, Question.new(
      :text => 'MyString',
      :quizz => @quizz
    ))
  end

  it 'renders new question form' do
    render

    assert_select 'form[action=?][method=?]', quizz_questions_path(@quizz), 'post' do

      assert_select 'input#question_text[name=?]', 'question[text]'

    end
  end
end
