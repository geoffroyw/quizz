FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "username#{n}@provider.com"
    end
    password 'password'
    password_confirmation 'password'
  end

end
