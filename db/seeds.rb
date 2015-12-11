# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Temporary way of creating administrator

admin=Admin.create(first_name: 'Karin',last_name:'Fernandez',email:'karin@yahoo.com',password:'ironhack',confirm_password:'ironhack')
