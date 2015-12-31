require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :text => "MyString",
      :exam_id => Exam.create!(:intro_text => 'exam text').id
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_text[name=?]", "question[text]"

      assert_select "input#question_exam_id[name=?]", "question[exam_id]"
    end
  end
end
