# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# REVU: Always create here some models with initial values
# REVU: If the server is freshly deployed with clear database, how will your application act? Exception causing 500 error?
# REVU: In this case, few entries of Usd class with some initial values are pretty enough

Usd.create([
    { rate: 60.0000, date: Time.now - 2.days },
    { rate: 61.0000, date: Time.now - 1.days },
    { rate: 59.0000, date: Time.now }
  ])
