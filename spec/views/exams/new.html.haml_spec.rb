require 'rails_helper'

RSpec.describe "exams/new", type: :view do
  before(:each) do
    assign(:exam, Exam.new(
      :intro_text => "MyString"
    ))
  end

  it "renders new exam form" do
    render

    assert_select "form[action=?][method=?]", exams_path, "post" do

      assert_select "input#exam_intro_text[name=?]", "exam[intro_text]"
    end
  end
end
