require 'rails_helper'

RSpec.describe 'answers/edit', type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :text => 'MyString',
      :question => FactoryGirl.create(:question),
      :is_correct => false
    ))
  end

  it 'renders the edit answer form' do
    render

    assert_select 'form[action=?][method=?]', answer_path(@answer), 'post' do

      assert_select 'input#answer_text[name=?]', 'answer[text]'

      assert_select 'input#answer_question_id[name=?]', 'answer[question_id]'

      assert_select 'input#answer_is_correct[name=?]', 'answer[is_correct]'
    end
  end
end
