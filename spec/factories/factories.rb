FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "person#{n}@gmail.com" }
    password '12345678'
  end

  factory :piece do
    sequence(:title) { |n| "Opus#{n}" }
    sequence(:composer) { |n| "Beethoven#{n}" }
  end
end
