require 'rails_helper'

RSpec.describe 'questions/index', type: :view do
  before(:each) do
    @exam = assign(:question,Exam.create!(:intro_text => 'exam text', :name => 'name'))
    assign(:questions, [
      Question.create!(
        :text => 'Text',
        :exam => @exam
      ),
      Question.create!(
        :text => 'Text',
        :exam => @exam
      )
    ])
  end

  it 'renders a list of questions' do
    render
    assert_select 'tr>td', :text => 'Text'.to_s, :count => 2
    assert_select 'tr>td', :text => 'name'.to_s, :count => 2
  end
end
