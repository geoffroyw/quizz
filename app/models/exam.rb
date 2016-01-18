class Exam < ActiveRecord::Base
  has_many :quizzs

  validates_presence_of :minimal_score
  validates_presence_of :name
  validates_numericality_of :minimal_score, :only_integer => true, :greater_than_or_equal_to => 0
  validates_presence_of :quizzs
end
