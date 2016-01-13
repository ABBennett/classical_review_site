users = []

10.times do
  users << User.new(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    encrypted_password: "password",
    admin: false,
  )
end

users.each do |user|
  user.save!(validate: false)
end

Piece.find_or_create_by!(
  title: "Symphony No. 5 in D Major",
  composer: "Shostakovich",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Symphony No. 3 in E Minor, Eroica",
  composer: "Beethoven",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Piano Concerto No. 2 in G Minor",
  composer: "Prokofiev",
  user: User.all.sample
)

Piece.find_or_create_by!(
   title: "Violin Concerto No. 1 in D Major",
   composer: "Prokofiev",
   user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Gaspard de la Nuit",
  composer: "Ravel",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Cello Concerto in B Major",
  composer: "Dvorak",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Rite of Spring",
  composer: "Stravinsky",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Firebird Suite",
  composer: "Stravinsky",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Bolero",
  composer: "Ravel",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Symphony No. 3 in F Major",
  composer: "Brahms",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Rhapsody in Blue",
  composer: "Gershwin",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "String Quartet No. 24 in G Major",
  composer: "Mozart",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Peter Grimes",
  composer: "Britten",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "War Requiem",
  composer: "Britten",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Danzon No. 2",
  composer: "Marquez",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Hebrides Overture",
  composer: "Mendelssohn",
  user: User.all.sample
)

Piece.find_or_create_by!(
  title: "Adagio for Strings",
  composer: "Barber",
  user: User.all.sample
)

100.times do
  Review.find_or_create_by!(
    user: User.all.sample,
    piece: Piece.all.sample,
    rating: Faker::Number.between(1, 10),
    title: Faker::Hipster.sentence(3),
    body: Faker::Hipster.sentence(20)
  )
end
