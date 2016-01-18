require 'rails_helper'

RSpec.describe 'exams/index', type: :view do
  before(:each) do
    assign(:exams, [
        FactoryGirl.create(:exam, :minimal_score => 1, :name => 'Name'),
        FactoryGirl.create(:exam, :minimal_score => 1, :name => 'Name')
    ])
  end

  it 'renders a list of exams' do
    render
    assert_select 'tr>td', :text => 1.to_s, :count => 2
    assert_select 'tr>td', :text => 'Name'.to_s, :count => 2
  end
end
