require 'rails_helper'

RSpec.describe 'answers/edit', type: :view do
  before(:each) do
    @question = assign(:question, FactoryGirl.create(:question))
    @answer = assign(:answer, Answer.create!(
      :text => 'MyString',
      :question => @question,
      :is_correct => false
    ))
  end

  it 'renders the edit answer form' do
    render

    assert_select 'form[action=?][method=?]', quizz_question_answer_path(@question.quizz, @question, @answer), 'post' do

      assert_select 'input#answer_text[name=?]', 'answer[text]'

      assert_select 'input#answer_is_correct[name=?]', 'answer[is_correct]'
    end
  end
end
