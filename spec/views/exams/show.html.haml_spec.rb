require 'rails_helper'

RSpec.describe 'exams/show', type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
      :intro_text => 'Intro Text',
      :name => 'name'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Intro Text/)
    expect(rendered).to match(/name/)
  end
end
