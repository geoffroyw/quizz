require 'rails_helper'

RSpec.describe ExamSubmission, type: :model do
  it { should belong_to :exam }
  it { should validate_presence_of :exam }
  it { should have_many :question_submissions }

  describe 'compute_score' do
    it 'defaults to 0' do
      exam_submission = ExamSubmission.create(:exam => FactoryGirl.create(:exam))
      exam_submission.save!
      expect(exam_submission.score).to eq(0)
    end

    before(:each) do
      @question = FactoryGirl.create(:question)
      @correct_answer_1 = FactoryGirl.create(:answer, :is_correct => true, :question => @question)
      @correct_answer_2 = FactoryGirl.create(:answer, :is_correct => true, :question => @question)
      @wrong_answer = FactoryGirl.create(:answer, :is_correct => false, :question => @question)

      @correct_question_submission_1 = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1),
          AnswerSubmission.create(:answer => @correct_answer_2)]
      )

      @correct_question_submission_2 = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1),
          AnswerSubmission.create(:answer => @correct_answer_2)]
      )

      @wrong_question_submission = QuestionSubmission.create(:question => @question, :answer_submissions => [
          AnswerSubmission.create(:answer => @correct_answer_1),
          AnswerSubmission.create(:answer => @wrong_answer)]
      )
    end

    it 'adds 1 for each correct question submission' do
      exam_submission = ExamSubmission.create(:exam => FactoryGirl.create(:exam),
                                              :question_submissions =>
                                                  [@correct_question_submission_1,
                                                   @correct_question_submission_2,
                                                   @wrong_question_submission])

      exam_submission.save!
      expect(exam_submission.score).to eq(2)
    end
  end

end
