# db/seeds.rb
puts "Seeding Inventory..."
Inventory::Item.find_or_create_by!(name: "Ruby Gems") do |item|
  item.stock = 100
end

Inventory::Item.find_or_create_by!(name: "Rails Framework") do |item|
  item.stock = 50
end

puts "Seed completed!"
