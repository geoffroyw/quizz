require 'rails_helper'

RSpec.describe Exam, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :minimal_score}
  it {should validate_numericality_of(:minimal_score).only_integer.is_greater_than_or_equal_to(0)}
  it {should have_many :quizzs}
  it {should validate_presence_of :quizzs}
end
