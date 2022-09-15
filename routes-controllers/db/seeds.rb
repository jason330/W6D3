# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
      end

    #users
    u1 = User.create!(username: "jsong")
    u2 = User.create!(username: "yriv")
    u3 = User.create!(username: "mike")

    #artworks
    a1 = Artwork.create!(title: "vida loca", image_url: "www.vidaloca.com", artist_id: u1.id)
    a2 = Artwork.create!(title: "mona lisa", image_url: "www.monalisa.com", artist_id: u2.id)
    a3 = Artwork.create!(title: "colors", image_url: "www.colors.com", artist_id: u3.id)
    a4 = Artwork.create!(title: "last supper", image_url: "www.lastsupper.com", artist_id: u1.id)
    a5 = Artwork.create!(title: "lilies", image_url: "www.lilies.com", artist_id: u2.id)
    a6 = Artwork.create!(title: "doors", image_url: "www.doors.com", artist_id: u3.id)

    ArtworkShare.create!(artwork_id: a1.id, viewer_id: u1.id)
    ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
    ArtworkShare.create!(artwork_id: a1.id, viewer_id: u3.id)
    ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)
    ArtworkShare.create!(artwork_id: a5.id, viewer_id: u1.id)

    #comments
    Comment.create!(author_id: u1.id, artwork_id: 4, body: "what crappy art")
    Comment.create!(author_id: u2.id, artwork_id: 5, body: "beautiful art")
    Comment.create!(author_id: u3.id, artwork_id: 6, body: "decent art")
    Comment.create!(author_id: u3.id, artwork_id: 2, body: "acceptable art")
    puts "seeding successful"
end