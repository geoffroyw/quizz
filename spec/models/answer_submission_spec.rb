require 'rails_helper'

RSpec.describe AnswerSubmission, type: :model do
  it{should belong_to :question_submission}
  it{should belong_to :answer}
  it{should validate_presence_of :question_submission}
  it{should validate_presence_of :answer}
end
