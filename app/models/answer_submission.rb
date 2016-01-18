class AnswerSubmission < ActiveRecord::Base
  belongs_to :question_submission
  belongs_to :answer

  validates_presence_of :question_submission
  validates_presence_of :answer
end
