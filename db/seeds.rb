# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create!(email: 'test1@gmail.com', password: 'password@admin', user_type: 'admin')
5.times do
  Property.create!(title: 'MRT city government/newly completed top-level pure office', address: 'Songgao Road, Xinyi District, Taipei City', net_size: 3642, rent: 17481600, property_type: 'office', country: 'Taipei City', area: 'Taipei City', number_of_living_rooms: 1, number_of_bathrooms: 1 )
end