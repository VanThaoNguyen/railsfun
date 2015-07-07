# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Product.create!(title: "Ruby book", description: "Learn Ruby progamming", price: 12.99, published: true)
Product.create!(title: "Javascript book", description: "Learn Javascript progamming", price: 13.99, published: true)
Product.create!(title: "SASS book", description: "Learn CSS with SASS", price: 19.99, published: true)