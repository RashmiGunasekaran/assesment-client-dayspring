# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "🌱 Seeding started..."

# --- CLEANUP ---
Wishlist.delete_all
Review.delete_all
OrderItem.delete_all
Order.delete_all
Product.delete_all
Vendor.delete_all
Discount.delete_all
User.delete_all

# --- USERS ---
puts "👤 Creating users..."

admins = 2.times.map do |i|
  User.create!(
    email: "admin#{i}@dayspring.com",
    password: "password",
    role: :admin
  )
end

customers = 25.times.map do |i|
  User.create!(
    email: "customer#{i}@dayspring.com",
    password: "password",
    role: :customer
  )
end

vendor_users = 15.times.map do |i|
  User.create!(
    email: "vendor#{i}@dayspring.com",
    password: "password",
    role: :vendor
  )
end

puts "✔ Users created"

# --- VENDORS ---
puts "🏪 Creating vendors..."

vendors = vendor_users.map.with_index do |user, i|
  Vendor.create!(
    user: user,
    name: "Vendor #{i + 1}",
    balance: rand(-500..5000),
    status: [:active, :suspended].sample
  )
end

puts "✔ Vendors created"

# --- PRODUCTS ---
puts "📦 Creating products..."

products = []

vendors.each do |vendor|
  rand(3..6).times do |i|
    products << Product.create!(
      vendor: vendor,
      name: "#{vendor.name} Product #{i + 1}",
      price: rand(50..500),
      inventory_count: rand(0..25),
      is_clearance: [true, false].sample,
      deleted_at: [nil, nil, nil, Time.current].sample
    )
  end
end

puts "✔ Products created: #{products.count}"

# --- DISCOUNTS ---
puts "🏷 Creating discounts..."

discounts = [
  { code: "SAVE10", percentage: 10, active: true },
  { code: "SAVE20", percentage: 20, active: true },
  { code: "EXPIRED5", percentage: 5, active: false }
].map do |attrs|
  Discount.create!(attrs)
end

puts "✔ Discounts created"

# --- ORDERS ---
puts "🛒 Creating orders..."

orders = []

customers.each do |customer|
  rand(1..4).times do
    orders << Order.create!(
      customer: customer,
      status: [:pending, :completed, :cancelled].sample,
      total_price: 0
    )
  end
end

puts "✔ Orders created: #{orders.count}"

# --- ORDER ITEMS ---
puts "📑 Creating order items..."

orders.each do |order|
  selected_products = products.sample(rand(1..4))

  total = 0

  selected_products.each do |product|
    quantity = rand(1..5)
    unit_price = product.price

    OrderItem.create!(
      order: order,
      product: product,
      quantity: quantity,
      unit_price: unit_price
    )

    total += quantity * unit_price
  end

  order.update!(total_price: total)
end

puts "✔ Order items created"

# --- REVIEWS ---
puts "⭐ Creating reviews..."

completed_orders = orders.select(&:completed?)

completed_orders.each do |order|
  order.products.uniq.each do |product|
    Review.create!(
      customer: order.customer,
      product: product,
      rating: rand(1..5),
      comment: "Review for #{product.name}"
    )
  end
end

puts "✔ Reviews created"

# --- WISHLISTS ---
puts "💖 Creating wishlists..."

customers.each do |customer|
  products.sample(rand(3..6)).each do |product|
    Wishlist.create!(
      user: customer,
      product: product
    )
  end
end

puts "✔ Wishlists created"

puts "🎉 Seeding complete!"