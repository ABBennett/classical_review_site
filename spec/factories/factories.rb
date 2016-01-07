FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "person#{n}@gmail.com" }
    password '12345678'
  end

  factory :piece do
    sequence(:title) { |i| "Opus#{i}" }
    sequence(:composer) { |i| "Beethoven#{i}" }
  end

  factory :review do
    sequence(:title) { |i| "It's Amazing#{i}" }
    sequence (:body) { |i| "#{i}" + "a" * 50 }
    rating "10"
  end
end
