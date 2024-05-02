# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

8.times do |n|
  product = Product.create(
    name: "Product #{n + 1}",
    price: 10.00,
    discouted_price: 7.00,
    description: "This is a sample product #{n + 1}",
    sku: "AAA-#{n + 1}"
  )
  image_file = 'app/assets/images/product.png'
  product.image.attach(io: File.open(image_file), filename: 'product.png')
end
