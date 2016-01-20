require 'rails_helper'

RSpec.describe ExamQuizz, type: :model do
  it {should belong_to :exam}
  it {should belong_to :quizz}
end
