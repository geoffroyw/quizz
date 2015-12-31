class Question < ActiveRecord::Base
  belongs_to :exam

  validates_presence_of :exam
  validates_presence_of :text
end
