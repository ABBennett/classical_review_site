Piece.delete_all
Review.delete_all
User.delete_all

10.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password,
    admin: false,
  )
end

Piece.create(
  title: "Symphony No. 5 in D Major",
  composer: "Shostakovich",
  user_id: 2
)

Piece.create(
  title: "Symphony No. 3 in E Minor, Eroica",
  composer: "Beethoven",
  user_id: 2
)

Piece.create(
  title: "Piano Concerto No. 2 in G Minor",
  composer: "Prokofiev",
  user_id: 2
)

Piece.create(
  title: "Violin Concerto No. 1 in D Major",
  composer: "Prokofiev",
  user_id: 2
)

Piece.create(
  title: "Gaspard de la Nuit",
  composer: "Ravel",
  user_id: 2
)

Piece.create(
  title: "Cello Concerto in B Major",
  composer: "Dvorak",
  user_id: 2
)

Piece.create(
  title: "Rite of Spring",
  composer: "Stravinsky",
  user_id: 3
)

Piece.create(
  title: "Firebird Suite",
  composer: "Stravinsky",
  user_id: 1
)

Piece.create(
  title: "Bolero",
  composer: "Ravel",
  user_id: 1
)

Piece.create(
  title: "Symphony No. 3 in F Major",
  composer: "Brahms",
  user_id: 5
)

Piece.create(
  title: "Rhapsody in Blue",
  composer: "Gershwin",
  user_id: 4
)

Piece.create(
  title: "String Quartet No. 24 in G Major",
  composer: "Mozart",
  user_id: 2
)

Piece.create(
  title: "Peter Grimes",
  composer: "Britten",
  user_id: 2
)

Piece.create(
  title: "War Requiem",
  composer: "Britten",
  user_id: 2
)

Piece.create(
  title: "Danzon No. 2",
  composer: "Marquez",
  user_id: 2
)

Piece.create(
  title: "Hebrides Overture",
  composer: "Mendelssohn",
  user_id: 2
)

Piece.create(
  title: "Adagio for Strings",
  composer: "Barber",
  user_id: 7
)

100.times do
  Review.create(
    user_id: Faker::Number.between(1, 10),
    piece_id: Faker::Number.between(1, 17),
    rating: Faker::Number.between(1, 10),
    title: Faker::Hipster.sentence(3),
    body: Faker::Hipster.sentence(20)
  )
end
