require 'rails_helper'

RSpec.describe 'questions/index', type: :view do
  before(:each) do
    @quizz = assign(:question, Quizz.create!(:intro_text => 'exam text', :name => 'name'))
    assign(:questions, [
      Question.create!(
        :text => 'Text',
        :quizz => @quizz
      ),
      Question.create!(
        :text => 'Text',
        :quizz => @quizz
      )
    ])
  end

  it 'renders a list of questions' do
    render
    assert_select 'tr>td', :text => 'Text'.to_s, :count => 2
  end
end
