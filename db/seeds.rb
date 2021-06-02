# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trip.destroy_all
BucketlistItem.destroy_all


user1 = User.create(username: "cori", password: "cori", image: "null")
user2 = User.create(username: "bob", password: "bob", image: "null")
user3 = User.create(username: "jane", password: "jane", image: "null")



trip1 = Trip.create(name: "Explore Europe", destination: "Paris, France", start_date: "July 2022", end_date: "August 2022", visited: false, bucketlist: false, user_id: user1.id)
trip2 = Trip.create(name: "Explore Africa", destination: "Cape Town, South Africa", start_date: "Decemeber 2021", end_date: "January 2022", visited: false, bucketlist: false, user_id: user1.id)
trip3 = Trip.create(name: "Explore Rome", destination: "Piazza del Colosseo, Rome Italy", start_date: "August 2021", end_date: "August 2021", visited: false, bucketlist: false, user_id: user1.id)
trip4 = Trip.create(name: "Backpacking in South America", destination: "Argentina, Chile, & Colombia", start_date: "November 2021", end_date: "December 2021", visited: false, bucketlist: false, user_id: user1.id)
trip5 = Trip.create(name: "Costa Rica", destination: "San Jose, Costa Rica", start_date: "June 7, 2021", end_date: "June 17, 2021", visited: false, bucketlist: false, user_id: user1.id)



bucketlist_item1 = BucketlistItem.create(name: "See the Eiffel Tower", description: "Tour, Shopping and Dining inside Eiffel Tower", rating: 8, trip_id: trip1.id)
bucketlist_item2 = BucketlistItem.create(name: "African Safari", description: "African Safari Tour", rating: 10, trip_id: trip2.id)
bucketlist_item3 = BucketlistItem.create(name: "Colosseum Tour", description: "Tour The Colosseum in Rome", rating: 5, trip_id: trip3.id)
bucketlist_item3 = BucketlistItem.create(name: "Jungle Tour", description: "ATV Rides and meet Monkeys of the Costa Rican jungle", rating: 10, trip_id: trip5.id)
bucketlist_item3 = BucketlistItem.create(name: "Active Volcano Hike", description: "10 mile hike to the top of an active volcano.", rating: 5, trip_id: trip4.id)