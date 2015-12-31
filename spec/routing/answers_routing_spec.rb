require 'rails_helper'

RSpec.describe AnswersController, type: :routing do
  describe 'routing' do

    it 'routes to #new' do
      expect(:get => 'exams/1/questions/2/answers/new').to route_to('answers#new', :exam_id => '1', :question_id => '2')
    end

    it 'routes to #edit' do
      expect(:get => 'exams/1/questions/2/answers/1/edit').to route_to('answers#edit', :id => '1', :exam_id => '1', :question_id => '2')
    end

    it 'routes to #create' do
      expect(:post => 'exams/1/questions/2/answers').to route_to('answers#create', :exam_id => '1', :question_id => '2')
    end

    it 'routes to #update via PUT' do
      expect(:put => 'exams/1/questions/2/answers/1').to route_to('answers#update', :id => '1', :exam_id => '1', :question_id => '2')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => 'exams/1/questions/2/answers/1').to route_to('answers#update', :id => '1', :exam_id => '1', :question_id => '2')
    end

    it 'routes to #destroy' do
      expect(:delete => 'exams/1/questions/2/answers/1').to route_to('answers#destroy', :id => '1', :exam_id => '1', :question_id => '2')
    end

  end
end
