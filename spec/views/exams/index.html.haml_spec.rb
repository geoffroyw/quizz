require 'rails_helper'

RSpec.describe "exams/index", type: :view do
  before(:each) do
    assign(:exams, [
      Exam.create!(
        :intro_text => "Intro Text"
      ),
      Exam.create!(
        :intro_text => "Intro Text"
      )
    ])
  end

  it "renders a list of exams" do
    render
    assert_select "tr>td", :text => "Intro Text".to_s, :count => 2
  end
end
