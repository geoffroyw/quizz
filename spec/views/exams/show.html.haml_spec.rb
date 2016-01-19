require 'rails_helper'

RSpec.describe 'exams/show', type: :view do
  before(:each) do
    @exam = assign(:exam,
                   FactoryGirl.create(
                       :exam,
                       :minimal_score => 1,
                       :name => 'Name'
                   ))
    @exam_submission = assign(:exam_submission, ExamSubmission.new(:exam => @exam))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
  end
end
