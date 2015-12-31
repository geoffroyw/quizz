class Exam < ActiveRecord::Base
  has_many :questions

  validates_presence_of :intro_text

end
