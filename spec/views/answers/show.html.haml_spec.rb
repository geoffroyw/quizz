require 'rails_helper'

RSpec.describe 'answers/show', type: :view do
  before(:each) do
    @question = assign(:question,FactoryGirl.create(:question))
    @answer = assign(:answer, Answer.create!(
      :text => 'Text',
      :question => @question,
      :is_correct => false
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
