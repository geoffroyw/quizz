require 'rails_helper'

RSpec.describe ExamSubmissionsController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        @quizz1 = FactoryGirl.create(:quizz)

        @question11 = FactoryGirl.create(:question, :quizz => @quizz1)
        @question11_correct_answer = FactoryGirl.create(:answer, :question => @question11, :is_correct => true)
        @question11_wrong_answer = FactoryGirl.create(:answer, :question => @question11, :is_correct => false)

        @question12 = FactoryGirl.create(:question, :quizz => @quizz1)
        @question12_correct_answer = FactoryGirl.create(:answer, :question => @question12, :is_correct => true)
        @question12_wrong_answer = FactoryGirl.create(:answer, :question => @question12, :is_correct => false)

        @quizz2 = FactoryGirl.create(:quizz)

        @question21 = FactoryGirl.create(:question, :quizz => @quizz2)
        @question21_correct_answer = FactoryGirl.create(:answer, :question => @question21, :is_correct => true)
        @question21_wrong_answer = FactoryGirl.create(:answer, :question => @question21, :is_correct => false)

        @question22 = FactoryGirl.create(:question, :quizz => @quizz2)
        @question22_correct_answer = FactoryGirl.create(:answer, :question => @question22, :is_correct => true)
        @question22_wrong_answer = FactoryGirl.create(:answer, :question => @question22, :is_correct => false)

        @exam = FactoryGirl.create(:exam)
        @exam.quizzs << @quizz1

        @exam.quizzs << @quizz2

      end

      it 'assigns @checked_answer_ids with the id of the selected answers' do
        post :create, {:id => @exam,
                       :question => {
                           @question11.id => {:answer_ids => [@question11_correct_answer.id]},
                           @question12.id => {:answer_ids => [@question12_wrong_answer.id]},
                           @question21.id => {:answer_ids => [@question21_correct_answer.id]},
                           @question22.id => {:answer_ids => [@question22_correct_answer.id]}}},
             valid_session
        expect(assigns(:checked_answer_ids)).to contain_exactly(@question11_correct_answer.id, @question12_wrong_answer.id, @question21_correct_answer.id, @question22_correct_answer.id)
      end

      it 'assigns @errors to empty array if all corrects answers are selected' do
        post :create, {:id => @exam,
                       :question => {
                           @question11.id => {:answer_ids => [@question11_correct_answer.id]},
                           @question12.id => {:answer_ids => [@question12_correct_answer.id]},
                           @question21.id => {:answer_ids => [@question21_correct_answer.id]},
                           @question22.id => {:answer_ids => [@question22_correct_answer.id]}
                       }},
             valid_session
        expect(assigns(:errors)).to eq([])
      end

      it 'adds to @errors the question where no answer is selected' do
        post :create, {:id => @exam,
                       :question => {
                           @question12.id => {:answer_ids => [@question12_correct_answer.id]},
                           @question21.id => {:answer_ids => [@question21_correct_answer.id]},
                           @question22.id => {:answer_ids => [@question22_correct_answer.id]}
                       }},
             valid_session
        expect(assigns(:errors)).to contain_exactly(@question11)
      end

      it 'adds to @errors the question where wrong answer is selected' do
        post :create, {:id => @exam,
                       :question => {
                           @question11.id => {:answer_ids => [@question11_wrong_answer.id]},
                           @question12.id => {:answer_ids => [@question12_wrong_answer.id]},
                           @question21.id => {:answer_ids => [@question21_wrong_answer.id]},
                           @question22.id => {:answer_ids => [@question22_wrong_answer.id]}
                       }},
             valid_session
        expect(assigns(:errors)).to contain_exactly(@question11, @question12, @question21, @question22)
      end

      it 'adds to @errors the question where wrong answer is selected only one of them is false' do
        post :create, {:id => @exam,
                       :question => {
                           @question11.id => {:answer_ids => [@question11_correct_answer.id]},
                           @question12.id => {:answer_ids => [@question12_wrong_answer.id]},
                           @question21.id => {:answer_ids => [@question21_wrong_answer.id]},
                           @question22.id => {:answer_ids => [@question22_correct_answer.id]}
                       }},
             valid_session
        expect(assigns(:errors)).to contain_exactly(@question12, @question21)
      end

      it 'adds to @errors the question where wrong answer is selected and another question is not answered' do
        post :create, {:id => @exam,
                       :question => {@question12.id => {:answer_ids => [@question12_wrong_answer.id]}
                       }},
             valid_session
        expect(assigns(:errors)).to contain_exactly(@question11, @question12, @question21, @question22)
      end
    end
  end
end
