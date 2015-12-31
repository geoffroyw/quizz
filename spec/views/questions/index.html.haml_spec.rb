require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    exam_id = Exam.create!(:intro_text => 'exam text').id
    assign(:questions, [
      Question.create!(
        :text => "Text",
        :exam_id => exam_id
      ),
      Question.create!(
        :text => "Text",
        :exam_id => exam_id
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 'exam text'.to_s, :count => 2
  end
end
