require 'rails_helper'

RSpec.describe QuestionSubmission, type: :model do
  it { should belong_to :exam_submission }
  it { should belong_to :question }
  it { should have_many :answer_submissions }
  it { should validate_presence_of :exam_submission }
  it { should validate_presence_of :question }

  describe 'correct?' do


    before(:each) do
      @question = FactoryGirl.create(:question)
      @correct_answer_1 = FactoryGirl.create(:answer, :is_correct => true, :question => @question)
      @correct_answer_2 = FactoryGirl.create(:answer, :is_correct => true, :question => @question)
      @wrong_answer = FactoryGirl.create(:answer, :is_correct => false, :question => @question)
    end

    it 'is true if the set of answer is the same as the correct answers of the question' do
      question_submission = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1),
          AnswerSubmission.create(:answer => @correct_answer_2)]
      )

      expect(question_submission.correct?).to be (true)
    end

    it 'is false if the set of answer is not same as the correct answers of the question' do
      question_submission = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1)]
      )

      expect(question_submission.correct?).to be (false)
    end

    it 'is true if the set of answer is not same as the correct answers of the question' do
      question_submission = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1),
          AnswerSubmission.create(:answer => @wrong_answer)]
      )

      expect(question_submission.correct?).to be (false)
    end

  end
end
