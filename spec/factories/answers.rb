FactoryGirl.define do
  factory :answer do
    text 'MyString'
    question
    is_correct false
  end

end
