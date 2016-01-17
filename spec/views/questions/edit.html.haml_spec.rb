require 'rails_helper'

RSpec.describe 'questions/edit', type: :view do
  before(:each) do
    @quizz = assign(:quizz, Quizz.create!(:intro_text => 'exam text', :name => 'exam name'))
    @question = assign(:question, Question.create!(
      :text => 'MyString',
      :quizz => @quizz
    ))
  end

  it 'renders the edit question form' do
    render

    assert_select 'form[action=?][method=?]', quizz_question_path(@quizz, @question), 'post' do

      assert_select 'input#question_text[name=?]', 'question[text]'

    end
  end
end
