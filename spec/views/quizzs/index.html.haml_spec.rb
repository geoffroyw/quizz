require 'rails_helper'

RSpec.describe 'quizzs/index', type: :view do
  before(:each) do
    assign(:quizzs, [
        Quizz.create!(
        :intro_text => 'Intro Text',
        :name => 'name'
      ),
        Quizz.create!(
        :intro_text => 'Intro Text',
        :name => 'name'
      )
    ])
  end

  it 'renders a list of exams' do
    render
    assert_select 'tr>td', :text => 'name'.to_s, :count => 2
  end
end
