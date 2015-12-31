class Question < ActiveRecord::Base
  belongs_to :exam
  has_many :answers

  validates_presence_of :exam
  validates_presence_of :text
end
