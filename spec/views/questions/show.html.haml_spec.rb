require 'rails_helper'

RSpec.describe 'questions/show', type: :view do
  before(:each) do
    @quizz = assign(:quizz, FactoryGirl.create(:quizz, :name => 'name'))
    @question = assign(:question, Question.create!(
      :text => "Text",
      :quizz => @quizz
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/name/)
  end
end
