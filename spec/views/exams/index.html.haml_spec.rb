require 'rails_helper'

RSpec.describe 'exams/index', type: :view do
  before(:each) do
    assign(:exams, [
      Exam.create!(
        :intro_text => 'Intro Text',
        :name => 'name'
      ),
      Exam.create!(
        :intro_text => 'Intro Text',
        :name => 'name'
      )
    ])
  end

  it 'renders a list of exams' do
    render
    assert_select 'tr>td', :text => 'Intro Text'.to_s, :count => 2
    assert_select 'tr>td', :text => 'name'.to_s, :count => 2
  end
end
