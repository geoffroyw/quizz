require 'rails_helper'

RSpec.describe "exams/new", type: :view do
  before(:each) do
    assign(:exam, Exam.new(
      :minimal_score => 1,
      :name => "MyString"
    ))
  end

  it "renders new exam form" do
    render

    assert_select "form[action=?][method=?]", exams_path, "post" do

      assert_select "input#exam_minimal_score[name=?]", "exam[minimal_score]"

      assert_select "input#exam_name[name=?]", "exam[name]"
    end
  end
end
