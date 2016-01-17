require 'rails_helper'

RSpec.describe 'quizzs/edit', type: :view do
  before(:each) do
    @quizz = assign(:quizz, Quizz.create!(
      :intro_text => 'MyString',
      :name => 'name'
    ))
  end

  it 'renders the edit quizz form' do
    render

    assert_select 'form[action=?][method=?]', quizz_path(@quizz), 'post' do

      assert_select 'textarea#quizz_intro_text[name=?]', 'quizz[intro_text]'
      assert_select 'input#quizz_name[name=?]', 'quizz[name]'
    end
  end
end
