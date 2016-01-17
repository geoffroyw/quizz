class Quizz < ActiveRecord::Base
  has_many :questions

  validates_presence_of :intro_text
  validates_presence_of :name

end
