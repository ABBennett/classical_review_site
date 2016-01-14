FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "person#{n}@gmail.com" }
    password '12345678'
  end

  factory :admin, class: User do
    username "admin"
    email "admin@gmail.com"
    password "password"
    admin true
  end

  factory :piece do
    sequence(:title) { |i| "Opus#{i}" }
    sequence(:composer) { |i| "Beethoven#{i}" }
    url "https://www.youtube.com/watch?v=CTE08SS8fNk"
    user
  end

  factory :review do
    sequence(:title) { |i| "It's Amazing#{i}" }
    sequence (:body) { |i| "#{i}" + "a" * 50 }
    rating "10"
    user
    piece
  end
end
