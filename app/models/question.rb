class Question < ActiveRecord::Base
  belongs_to :exam
  has_many :answers

  validates_presence_of :exam
  validates_presence_of :text

  def has_only_false_answer
    if answers.length == 0
      true
    else
      answers.each do |a|
        if a.is_correct
          return false
        end
      end
    end
    return true
  end
end
