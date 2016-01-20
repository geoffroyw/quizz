require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :minimal_score }
  it { should validate_numericality_of(:minimal_score).only_integer.is_greater_than_or_equal_to(0) }
  it { should have_many(:quizzs).through(:exam_quizzs) }
  it { should have_many :exam_quizzs }
  it { should validate_presence_of :quizzs }

  describe 'maximal score' do
    it 'adds 1 per question' do
      @quizz1 = FactoryGirl.create(:quizz)

      @question11 = FactoryGirl.create(:question, :quizz => @quizz1)
      @question12 = FactoryGirl.create(:question, :quizz => @quizz1)

      @quizz2 = FactoryGirl.create(:quizz)

      @question21 = FactoryGirl.create(:question, :quizz => @quizz2)

      @question22 = FactoryGirl.create(:question, :quizz => @quizz2)

      @exam = FactoryGirl.create(:exam)
      @exam.quizzs << @quizz1

      @exam.quizzs << @quizz2

      expect(@exam.maximal_score).to eq(4)

    end
  end
end
