class ExamSubmissionsController < ApplicationController

  before_action :set_exam, only: :create

  def create
    @errors = []
    @checked_answer_ids = []

    exam_submission = ExamSubmission.new(:exam => @exam)

    selected_question_ids = params[:question].nil? ? [] : params[:question].keys
    selected_question_ids.each do |id|
      question = Question.find id
      question_submission = QuestionSubmission.new(:question => question)
      exam_submission.question_submissions << question_submission

      selected_answers = Answer.find(params[:question][id]['answer_ids'])

      selected_answers.each do |answer|
        question_submission.answer_submissions << AnswerSubmission.new(:answer => answer)
        @checked_answer_ids << answer.id
      end

      unless question_submission.correct?
        @errors << question
      end
    end

    quizz_question_ids = @exam.quizzs.map { |quizz| quizz.questions.map { |question| question.id } }.flatten
    quizz_question_ids.each do |id|
      unless selected_question_ids.map { |i| i.to_s }.include? id.to_s
        @errors << Question.find(id)
      end
    end


    exam_submission.save!

    if exam_submission.score >= @exam.minimal_score
      flash[:success] = t('exam.passed', maximal_score: @exam.maximal_score, submission_score: exam_submission.score)
    else
      flash[:warning] = t('exam.failed', minimal_score: @exam.minimal_score, submission_score: exam_submission.score)
    end

    render 'exams/show'
  end

  private
  def set_exam
    @exam = Exam.find params[:id]
  end
end
