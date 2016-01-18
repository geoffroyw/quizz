require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  before(:each) do
    assign(:exams, [
        FactoryGirl.create(:exam, :name => 'Exam Name'),
        FactoryGirl.create(:exam, :name => 'Exam Name')
    ])

    assign(:quizzs, [
        FactoryGirl.create(:quizz, :name => 'Quizz Name'),
        FactoryGirl.create(:quizz, :name => 'Quizz Name')
    ])
  end

  it 'renders a list of exams' do
    render
    assert_select '.exams tr>td', :text => 'Exam Name'.to_s, :count => 2
  end

  it 'renders a list of quizzs' do
    render
    assert_select '.quizzs tr>td', :text => 'Quizz Name'.to_s, :count => 2
  end
end
