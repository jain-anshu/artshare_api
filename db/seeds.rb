# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

   User.create([
    {username: "Michael Angelo"},
    {username: "Rafael"},
    {username: "Ohara"},
    {username: "Samuel"}
   ])

   Artwork.create([
    {title: "Madonna", image_url: "madonna.com", artist_id: User.third},
    {title: "ThreeWiseMen", image_url: "twm.com", artist_id: User.find(4)}])

    ArtworkShare.create([
        {artwork_id: 1, viewer_id: 1},
        {artwork_id: 1, viewer_id: 2},
        {artwork_id: 1, viewer_id: 4},
        {artwork_id: 2, viewer_id: 1},
        {artwork_id: 2, viewer_id: 2},
        {artwork_id: 2, viewer_id: 3}

    ])
   
