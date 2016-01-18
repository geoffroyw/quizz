FactoryGirl.define do
  factory :answer_submission do
    question_submission
    answer
  end

end
