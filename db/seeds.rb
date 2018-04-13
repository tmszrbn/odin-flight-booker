# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Airport.delete_all

a1 = Airport.create code:"AAA"
a2 = Airport.create code:"ZZZ"
f1 = Flight.create from_airport_id:a1.id, to_airport_id:a2.id, take_off:"2018-01-01", duration:60, seats_left:4
f2 = Flight.create from_airport_id:a1.id, to_airport_id:a2.id, take_off:"2018-01-01", duration:60, seats_left:1

n = 15

n.times do 
    a1 = Airport.create code:"#{(0..2).map{65.+(rand(26)).chr}.join}"
    a2 = Airport.create code:"#{(0..2).map{65.+(rand(26)).chr}.join}"
    puts Flight.create from_airport_id:a1.id, to_airport_id:a2.id, 
    take_off:rand(300).hours.from_now.strftime("%Y-%m-%d"), duration:60 + rand(60), seats_left: rand(10)
end

last_id = Airport.last.id

m = 2 * n - 3

50.times do
    id1 = last_id - m + rand(m)
    id2 = last_id - m + rand(m)
    while (id1 == id2) do
        id2 = last_id - m + rand(m)
    end
    puts Flight.create from_airport_id:id1, to_airport_id:id2, 
    take_off:rand(300).hours.from_now.strftime("%Y-%m-%d"), duration:rand(60), seats_left: rand(10)
end

puts Flight.count