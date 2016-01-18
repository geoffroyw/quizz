FactoryGirl.define do
  factory :exam do
    minimal_score 1
    name 'MyString'

    quizzs {|q| [q.association(:quizz)]}
  end
end
