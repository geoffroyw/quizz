require 'rails_helper'

RSpec.describe 'questions/show', type: :view do
  before(:each) do
    @exam = assign(:exam, FactoryGirl.create(:exam, :name => 'name'))
    @question = assign(:question, Question.create!(
      :text => "Text",
      :exam => @exam
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/name/)
  end
end
