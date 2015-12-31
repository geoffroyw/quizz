require 'rails_helper'

RSpec.describe Question, type: :model do
  it {should validate_presence_of :text}
  it {should validate_presence_of :exam}
  it {should belong_to :exam}
  it {should have_many :answers}

  context 'has_only_false_answer' do
    it 'is true if no answer' do
      q = Question.create
      expect(q.has_only_false_answer).to be true
    end

    it 'is false if at least of of the answer is correct' do
      q = FactoryGirl.create(:question)
      FactoryGirl.create(:answer, :is_correct => true, :question => q)
      FactoryGirl.create(:answer, :is_correct => false, :question => q)
      expect(q.has_only_false_answer).to be false
    end

    it 'is true if all of of the answer are not correct' do
      q = FactoryGirl.create(:question)
      FactoryGirl.create(:answer, :is_correct => false, :question => q)
      FactoryGirl.create(:answer, :is_correct => false, :question => q)
      expect(q.has_only_false_answer).to be true
    end
  end
end
