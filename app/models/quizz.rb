class Quizz < ActiveRecord::Base
  has_many :questions
  belongs_to :exam

  validates_presence_of :intro_text
  validates_presence_of :name

end
