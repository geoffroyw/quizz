require 'rails_helper'

RSpec.describe 'answers/new', type: :view do
  before(:each) do
    @question = assign(:question, FactoryGirl.create(:question))
    @answer = assign(:answer, Answer.new(
      :text => 'MyString',
      :question => @question,
      :is_correct => false
    ))
  end

  it 'renders new answer form' do
    render

    assert_select 'form[action=?][method=?]', exam_question_answers_path(@question.exam, @question, @answer), 'post' do

      assert_select 'input#answer_text[name=?]', 'answer[text]'

      assert_select 'input#answer_is_correct[name=?]', 'answer[is_correct]'
    end
  end
end
