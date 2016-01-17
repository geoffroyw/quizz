require 'rails_helper'

RSpec.describe QuestionsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => 'quizzs/1/questions').to route_to('questions#index', :quizz_id => '1')
    end

    it 'routes to #new' do
      expect(:get => '/quizzs/1/questions/new').to route_to('questions#new', :quizz_id => '1')
    end

    it 'routes to #show' do
      expect(:get => '/quizzs/1/questions/1').to route_to('questions#show', :id => '1', :quizz_id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/quizzs/1/questions/1/edit').to route_to('questions#edit', :id => '1', :quizz_id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/quizzs/1/questions').to route_to('questions#create', :quizz_id => '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/quizzs/1/questions/1').to route_to('questions#update', :id => '1', :quizz_id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/quizzs/1/questions/1').to route_to('questions#update', :id => '1', :quizz_id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/quizzs/1/questions/1').to route_to('questions#destroy', :id => '1', :quizz_id => '1')
    end

  end
end
