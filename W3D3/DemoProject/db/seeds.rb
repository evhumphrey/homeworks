# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.create(name: 'Default Dan', house_id: 1)
Person.create(name: 'Plain Jane', house_id: 1)
House.create(address: '1234 Normal Street')

Person.create(name: 'Lonesome Tom', house_id: 2)
House.create(address: '4321 Lonely Avenue')
