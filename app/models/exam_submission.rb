class ExamSubmission < ActiveRecord::Base
  belongs_to :exam
  has_many :question_submissions

  before_save :calc_score

  validates_presence_of :exam

  private
  def calc_score
    self.score = question_submissions.select { |sub| sub.correct? }.length
  end

end
