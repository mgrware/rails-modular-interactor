#!/usr/bin/env ruby
require_relative "../config/environment"

puts "--- Modular Monolith & Interactor Pattern Demo ---"

# 1. Setup Data
item = Inventory::Item.find_or_create_by!(name: "Ruby Gems") do |i|
  i.stock = 10
end
puts "Initial stock for #{item.name}: #{item.stock}"

# 2. Place an Order using the Interactor Organizer
puts "\nPlacing order for 'John Doe' (Quantity: 2)..."
result = Sales::PlaceOrder.call(
  customer_name: "John Doe",
  item: item,
  quantity: 2
)

if result.success?
  puts "SUCCESS!"
  puts "Order ID: #{result.order.id}"
  puts "Total Price: #{result.order.total_price}"
  puts "Remaining Stock: #{item.reload.stock}"
else
  puts "FAILED!"
  puts "Error: #{result.message}"
end

puts "\n--- Demo End ---"
