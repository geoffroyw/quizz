class QuestionSubmission < ActiveRecord::Base
  belongs_to :exam_submission
  belongs_to :question
  has_many :answer_submissions

  validates_presence_of :question
  validates_presence_of :exam_submission

  def correct?
    expected_answers = question.answers.select{|a| a.is_correct}

    submitted_answers = answer_submissions.map{|sub| sub.answer}

    expected_answers.uniq.sort == submitted_answers.uniq.sort
  end
end
