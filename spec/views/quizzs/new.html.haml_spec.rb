require 'rails_helper'

RSpec.describe 'quizzs/new', type: :view do
  before(:each) do
    assign(:quizz, Quizz.new(
      :intro_text => 'MyString',
      :name => 'name'
    ))
  end

  it 'renders new quizz form' do
    render

    assert_select 'form[action=?][method=?]', quizzs_path, 'post' do

      assert_select 'textarea#quizz_intro_text[name=?]', 'quizz[intro_text]'
      assert_select 'input#quizz_name[name=?]', 'quizz[name]'
    end
  end
end
