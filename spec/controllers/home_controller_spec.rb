require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all exams as @exams' do
      exam = FactoryGirl.create :exam
      get :index, {}, valid_session
      expect(assigns(:exams)).to eq([exam])
    end

    it 'assigns all quizzs as @quizzs' do
      quizz = FactoryGirl.create :quizz
      get :index, {}, valid_session
      expect(assigns(:quizzs)).to eq([quizz])
    end
  end
end
