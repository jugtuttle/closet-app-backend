# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Josh")
Item.create(image_url: "https://cdn.shopify.com/s/files/1/2495/5044/products/oca-high-camel-brown-suede-side-view.slideshow1_2800x.jpg?v=1568779201", name: "Brown Shoes", times_worn: 0, user_id: 1, favorite: false)
Category.create(name: "brown", group: "color")
Outfit.create(name: "first outfit")
ItemCategory.create(item_id: 1, category_id: 1)
OutfitItem.create(item_id: 1, outfit_id: 1) 

#testing by Amy

#test Jacob K 