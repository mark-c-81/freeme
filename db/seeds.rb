# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# NOTE: comment out destroy old icons if you already have icons associated skills

puts "Destroying old Icons"
Icon.destroy_all
puts "Old Icons destroyed"

# NOTES: When adding seeds comment out any icons that have already been added.
# If you need to rebuild your seed - you will need to drop the database first.

icons = [
         {name: 'default', image: "https://cdn-icons-png.flaticon.com/128/711/711284.png"},
         {name: 'ruby', image: "https://cdn-icons-png.flaticon.com/128/919/919842.png"},
         {name: 'javascript', image: "https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png"},
         {name: 'java', image: "https://brandslogos.com/wp-content/uploads/images/large/java-logo-1.png"},
         {name: 'c++', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/306px-ISO_C%2B%2B_Logo.svg.png"},
         {name: 'python', image: "https://cdn-icons-png.flaticon.com/128/919/919852.png"},
         {name: 'c#', image: "https://www.freeiconspng.com/uploads/c-logo-icon-18.png"},
         {name: 'swift', image: "https://brandslogos.com/wp-content/uploads/thumbs/swift-logo-vector.svg"},
         {name: 'php', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/2560px-PHP-logo.svg.png"},
         {name: 'objective-c', image: "https://www.pinclipart.com/picdir/middle/396-3965102_swiftify-saves-thousands-of-work-hours-by-converting.png"},
         {name: 'visual studio', image: "https://1000logos.net/wp-content/uploads/2020/08/Visual-Studio-Logo.png"},
         {name: 'pearl', image: "https://cdn.freebiesupply.com/logos/large/2x/perl-programming-language-logo-png-transparent.png"},
         {name: 'vue', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1200px-Vue.js_Logo_2.svg.png"},
         {name: 'angular', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/1024px-Angular_full_color_logo.svg.png"},
         {name: 'jquery', image: "https://www.pikpng.com/pngl/m/440-4404136_jquery-jquery-logo-transparent-background-clipart.png"},
         {name: 'ruby on rails', image: "https://image.pngaaa.com/154/4122154-middle.png"},
         {name: 'rails', image: "https://res.cloudinary.com/alexbeet/image/upload/v1627560243/vezkvnq5ls9ol7oyhnsrxescid0k.png"},
         {name: 'bootstrap', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/2560px-Bootstrap_logo.svg.png"},
         {name: 'django', image: "https://pngimage.net/wp-content/uploads/2018/05/django-png-9.png"},
         {name: 'react', image: "https://image.pngaaa.com/875/2507875-middle.png"},
         {name: 'figma', image: "https://upload.wikimedia.org/wikipedia/commons/3/33/Figma-logo.svg"}
        ]

# icons = [
#          {name: 'ruby on rails test', image: "https://res.cloudinary.com/alexbeet/image/upload/v1627560243/vezkvnq5ls9ol7oyhnsrxescid0k.png"},
#         ]


puts "line 52: about to open URI cloudinary.com..."
file = URI.open("https://res.cloudinary.com/alexbeet/image/upload/v1627560243/vezkvnq5ls9ol7oyhnsrxescid0k.png")
puts "line 54: Successfully openeing URI cloudinary.com!"

icons.each do |icon|
  puts "opening URI for image..."
  file = URI.open("#{icon[:image]}", 'User-Agent' => 'ruby')
  puts "opened URI now createing icon..."
  icon = Icon.create!(name: icon[:name])
  icon.photo.attach(io: file, filename: "#{icon[:name]}.png", content_type: 'image/png')
  p "created icon with NAME: #{icon[:name]} and ID: #{icon.id}"
end

puts "created #{Icon.count} new icons"




# file1 = URI.open("https://res.cloudinary.com/alexbeet/image/upload/v1627560243/vezkvnq5ls9ol7oyhnsrxescid0k.png", 'User-Agent' => 'ruby')
# icon1 = Icon.create!(name: 'rails')
# icon1.photo.attach(io: file, filename: "rails.png", content_type: 'image/png')

# file2 = URI.open("https://res.cloudinary.com/alexbeet/image/upload/v1627560147/so7dpi6d8puy2h7z1gt252tudbh6.png", 'User-Agent' => 'ruby')
# icon2 = Icon.create!(name: 'default')
# icon2.photo.attach(io: file, filename: "default.png", content_type: 'image/png')












