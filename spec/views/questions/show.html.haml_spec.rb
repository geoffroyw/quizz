require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :text => "Text",
      :exam_id => Exam.create!(:intro_text => 'exam text', :name => 'name').id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/name/)
  end
end
