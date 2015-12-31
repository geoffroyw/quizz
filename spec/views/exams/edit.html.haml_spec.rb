require 'rails_helper'

RSpec.describe 'exams/edit', type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
      :intro_text => 'MyString',
      :name => 'name'
    ))
  end

  it 'renders the edit exam form' do
    render

    assert_select 'form[action=?][method=?]', exam_path(@exam), 'post' do

      assert_select 'input#exam_intro_text[name=?]', 'exam[intro_text]'
      assert_select 'input#exam_name[name=?]', 'exam[name]'
    end
  end
end
