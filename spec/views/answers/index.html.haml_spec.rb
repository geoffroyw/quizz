require 'rails_helper'

RSpec.describe 'answers/index', type: :view do
  before(:each) do
    @question = FactoryGirl.create(:question)
    assign(:answers, [
      Answer.create!(
        :text => 'Text',
        :question => @question,
        :is_correct => false
      ),
      Answer.create!(
        :text => 'Text',
        :question => @question,
        :is_correct => false
      )
    ])
    assign(:exam, @question.exam)
  end

  it 'renders a list of answers' do
    render
    assert_select 'tr>td', :text => 'Text'.to_s, :count => 2
    assert_select 'tr>td', :text => @question.text, :count => 2
    assert_select 'tr>td', :text => false.to_s, :count => 2
  end
end
