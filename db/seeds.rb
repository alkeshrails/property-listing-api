# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create!(email: 'admin@gmail.com', password: 'password@admin', user_type: 'admin')
User.create!(email: 'user@gmail.com', password: 'password@user')

Property.create!(title: 'MRT city government/newly completed top-level pure office', address: 'Songgao Road, Xinyi District, Taipei City', net_size: 3642, rent: 17481600, property_type: 'office', country: 'Taipei City', area: 'Taipei City', number_of_living_rooms: 1, number_of_bathrooms: 1 )

Property.create!(title: 'Next to the National Pavilion on the Bannan Line. Pure venue with glass curtain in the Dome
  ', address: 'Section 4, Zhongxiao East Road, Xinyi District, Taipei City', net_size: 3670.78, rent: 14158908, property_type: 'residential', country: 'Taipei City', area: 'New Taipei City', number_of_living_rooms: 0, number_of_bathrooms: 1 )

Property.create!(title: 'Xinyi Planning Area/Flagship Brand Gold Store', address: 'Songshou Road, Xinyi District, Taipei City', net_size: 400.35, rent: 10008750, property_type: 'residential', country: 'Taipei City', area: 'New Taipei City', number_of_living_rooms: 0, number_of_bathrooms: 1 )