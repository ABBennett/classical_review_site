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
    title "It's Amazing"
    body "The driving force, of course is universal in this opera that is essentially a battle of the sexes and a bedroom farce. The “revolutionary” politics of Beaumarchais’ work is largely expunged, aside from a brief mention that the royals no longer have the right to demand sexual favors from their servants. The music is glorious, particularly as the story darkens in the work’s second half. But a little of this sort of farce and froth goes a very long way. And at Lyric Opera, where the 2015-2016 season opened Saturday with an elaborate new production directed by Barbara Gaines (founder and artistic director of the Chicago Shakespeare Theater), the comic frolicking grows tiresome, and the real pain of betrayal emerges only fitfully."
    rating "10"
  end
end
