# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Temporary way of creating administrator


User.create(first_name: 'Lola',last_name:'Rodriguez',email:'lola@yahoo.com',password:'ironhack',confirm_password:'ironhack',admin:false)
User.create(first_name: 'John',last_name:'Doe',email:'john@yahoo.com',password:'ironhack',confirm_password:'ironhack',admin:false)
