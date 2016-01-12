10.times do
  User.find_or_create_by(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password,
    admin: false,
  )
end

Piece.find_or_create_by(
  title: "Symphony No. 5 in D Major",
  composer: "Shostakovich",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Symphony No. 3 in E Minor, Eroica",
  composer: "Beethoven",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Piano Concerto No. 2 in G Minor",
  composer: "Prokofiev",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Violin Concerto No. 1 in D Major",
  composer: "Prokofiev",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Gaspard de la Nuit",
  composer: "Ravel",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Cello Concerto in B Major",
  composer: "Dvorak",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Rite of Spring",
  composer: "Stravinsky",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Firebird Suite",
  composer: "Stravinsky",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Bolero",
  composer: "Ravel",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Symphony No. 3 in F Major",
  composer: "Brahms",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Rhapsody in Blue",
  composer: "Gershwin",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "String Quartet No. 24 in G Major",
  composer: "Mozart",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Peter Grimes",
  composer: "Britten",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "War Requiem",
  composer: "Britten",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Danzon No. 2",
  composer: "Marquez",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Hebrides Overture",
  composer: "Mendelssohn",
  user_id: Faker::Number.between(1,10)
)

Piece.find_or_create_by(
  title: "Adagio for Strings",
  composer: "Barber",
  user_id: Faker::Number.between(1,10)
)

100.times do
  Review.find_or_create_by(
    user_id: Faker::Number.between(1,10),
    piece_id: Faker::Number.between(1, 17),
    rating: Faker::Number.between(1, 10),
    title: Faker::Hipster.sentence(3),
    body: Faker::Hipster.sentence(20)
  )
end
