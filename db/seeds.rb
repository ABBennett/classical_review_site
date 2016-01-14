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
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=0FF4HyB77hQ"
)

Piece.find_or_create_by!(
  title: "Symphony No. 3 in E Flat Minor, Eroica",
  composer: "Beethoven",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=zGEiJ44K3Oo"
)

Piece.find_or_create_by!(
  title: "Piano Concerto No. 2 in G Minor",
  composer: "Prokofiev",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=CCeo1vyewEg"
)

Piece.find_or_create_by!(
   title: "Violin Concerto No. 1 in D Major",
   composer: "Prokofiev",
   user: User.all.sample,
   url: "https://www.youtube.com/watch?v=I2RbO3a3-B8"
)

Piece.find_or_create_by!(
  title: "Gaspard de la Nuit",
  composer: "Ravel",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=hKgcHjq1xKQ"
)

Piece.find_or_create_by!(
  title: "Cello Concerto in B Major",
  composer: "Dvorak",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=FVKb3DwPFA8"
)

Piece.find_or_create_by!(
  title: "Rite of Spring",
  composer: "Stravinsky",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=jo4sf2wT0wU"
)

Piece.find_or_create_by!(
  title: "Firebird Suite",
  composer: "Stravinsky",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=RZkIAVGlfWk"
)

Piece.find_or_create_by!(
  title: "Bolero",
  composer: "Ravel",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=dZDiaRZy0Ak"
)

Piece.find_or_create_by!(
  title: "Symphony No. 3 in F Major",
  composer: "Brahms",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=WUMEMezarNk"

)

Piece.find_or_create_by!(
  title: "Rhapsody in Blue",
  composer: "Gershwin",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=qWJ-kGuOA_Q"
)

Piece.find_or_create_by!(
  title: "String Quartet No.14 in G Major",
  composer: "Mozart",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=5BS_rG_XZ0Y"
)

Piece.find_or_create_by!(
  title: "Peter Grimes",
  composer: "Britten",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=3FfkF3q4cDk"
)

Piece.find_or_create_by!(
  title: "War Requiem",
  composer: "Britten",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=GHNgfF19CTY"
)

Piece.find_or_create_by!(
  title: "Danzon No. 2",
  composer: "Marquez",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=PA7vEIj6Lzk"
)

Piece.find_or_create_by!(
  title: "Hebrides Overture",
  composer: "Mendelssohn",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=CvWezBIUDtg"
)

Piece.find_or_create_by!(
  title: "Adagio for Strings",
  composer: "Barber",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=CcflwUYYoXk"
)

Piece.find_or_create_by!(
  title: "Silent Woods",
  composer: "Dvorak",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=R6z4hA3JzZ4"
)

Piece.find_or_create_by!(
  title: "Swan Lake",
  composer: "Tchaikovsky",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=9rJoB7y6Ncs"
)

Piece.find_or_create_by!(
  title: "String Quartet No. 8",
  composer: "Shostakovich",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=-7Y8Wbj80_w"
)

Piece.find_or_create_by!(
  title: "Ma Mère l'Oye(Mother Goose)",
  composer: "Ravel",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=5U7osEigQZM"
)

Piece.find_or_create_by!(
  title: "Candide",
  composer: "Bernstein",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=GEjMvYS1gAE"
)

Piece.find_or_create_by!(
  title: "Peer Gynt Suite No. 1",
  composer: "Grieg",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=mv4cx3C3SZ4"
)

Piece.find_or_create_by!(
  title: "Requiem",
  composer: "Mozart",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=neDnpgZPPvY"
)

Piece.find_or_create_by!(
  title: "The Planets",
  composer: "Holst",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=YtphY-4xjQw"
)

Piece.find_or_create_by!(
  title: "Solo Cello Sonata",
  composer: "Kodaly",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=tDyUCK7K0mE"
)

Piece.find_or_create_by!(
  title: "Cello Suites",
  composer: "Bach",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=MUAOWI-tkGg"
)

Piece.find_or_create_by!(
  title: "Capricio Espanol",
  composer: "Rimsky Korsakov",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=vLOVVzmEnto"
)

Piece.find_or_create_by!(
  title: "Piano Concerto in A Minor",
  composer: "Grieg",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=e1CMsIXBSss"
)

Piece.find_or_create_by!(
  title: "Daphnis et Chloé",
  composer: "Ravel",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=-Y51ygBRANM"
)

Piece.find_or_create_by!(
  title: "Symphony No. 5 in C Sharp Minor",
  composer: "Rimsky Korsakov",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=UjmthMDpyco"
)

Piece.find_or_create_by!(
  title: "Violin Concerto in D",
  composer: "Brahms",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=lJ1xKctJpQM"
)

Piece.find_or_create_by!(
  title: "Symphony No.7 in A Major",
  composer: "Beethoven",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=pKOpdt9PYXU"
)

Piece.find_or_create_by!(
  title: "Cello Concerto No.1 in E Flat Major",
  composer: "Shostakovich",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=tG0laIxC0Lo"
)

Piece.find_or_create_by!(
  title: "Piano Concerto No.2 in F Major",
  composer: "Shostakovich",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=8trqW4_lwSk"
)

Piece.find_or_create_by!(
  title: "Symphony No.5 in E Minor",
  composer: "Tchaikovsky",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=w2JBT0HC98I"
)

Piece.find_or_create_by!(
  title: "Symphony No.6 in B Minor",
  composer: "Tchaikovsky",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=w2JBT0HC98I"
)

Piece.find_or_create_by!(
  title: "Serenade for Violin Solo and Orchestra",
  composer: "Bernstein",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=S0wYse3i9TM"
)

Piece.find_or_create_by!(
  title: "Violin Concerto in D Minor",
  composer: "Khachaturian",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=rXjZAwZoj1g"
)

Piece.find_or_create_by!(
  title: "String Quartet No.3 in F Major",
  composer: "Shostakovich",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=_besAgmU87s"
)

Piece.find_or_create_by!(
  title: "Sonatine",
  composer: "Ravel",
  user: User.all.sample,
  url: "https://www.youtube.com/watch?v=9y0Gf5VTqZI"
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
