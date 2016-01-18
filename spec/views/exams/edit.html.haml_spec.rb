require 'rails_helper'

RSpec.describe 'exams/edit', type: :view do
  before(:each) do
    @exam = assign(:exam, FactoryGirl.create(:exam))
  end

  it 'renders the edit exam form' do
    render

    assert_select 'form[action=?][method=?]', exam_path(@exam), 'post' do

      assert_select 'input#exam_minimal_score[name=?]', 'exam[minimal_score]'

      assert_select 'input#exam_name[name=?]', 'exam[name]'

      assert_select 'select#exam_quizz_ids[name=?]', 'exam[quizz_ids][]'
    end
  end
end
