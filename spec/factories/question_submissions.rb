FactoryGirl.define do
  factory :question_submission do
    exam_submission
    question
  end

end
