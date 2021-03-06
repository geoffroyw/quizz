class Exam < ActiveRecord::Base
  has_many :quizzs, :through => :exam_quizzs
  has_many :exam_quizzs

  validates_presence_of :minimal_score
  validates_presence_of :name
  validates_numericality_of :minimal_score, :only_integer => true, :greater_than_or_equal_to => 0
  validates_presence_of :quizzs

  def maximal_score
    max_score = 0
    quizzs.map{|quizz| max_score += quizz.questions.count}
    max_score
  end
end
