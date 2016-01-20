class Quizz < ActiveRecord::Base
  has_many :questions
  has_many :exams, :through => :exam_quizzs
  has_many :exam_quizzs

  validates_presence_of :intro_text
  validates_presence_of :name

end
