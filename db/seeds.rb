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

# Helper to derive name from email
def name_from_email(email)
  email.split("@").first.titleize
end

# --- USERS ---
puts "👤 Creating users..."

admins = 2.times.map do |i|
  email = "admin#{i}@dayspring.com"
  User.find_or_create_by!(email: email) do |u|
    u.name = name_from_email(email)
    u.password = "password"
    u.role = :admin
  end
end

customers = 25.times.map do |i|
  email = "customer#{i}@dayspring.com"
  User.find_or_create_by!(email: email) do |u|
    u.name = name_from_email(email)
    u.password = "password"
    u.role = :customer
  end
end

vendor_users = 15.times.map do |i|
  email = "vendor#{i}@dayspring.com"
  User.find_or_create_by!(email: email) do |u|
    u.name = name_from_email(email)
    u.password = "password"
    u.role = :vendor
  end
end

User.find_or_create_by!(email: "alexa@dayspring.com") do |u|
  u.name = "Alexa"
  u.password = "password"
  u.role = :admin
end

User.find_or_create_by!(email: "siri@dayspring.com") do |u|
  u.name = "Siri"
  u.password = "password"
  u.role = :customer
end

User.find_or_create_by!(email: "gemini@dayspring.com") do |u|
  u.name = "Gemini"
  u.password = "password"
  u.role = :vendor
end

puts "✔ Users created"

# --- VENDORS ---
puts "🏪 Creating vendors..."

vendors = vendor_users.map.with_index do |user, i|
  Vendor.find_or_create_by!(user: user) do |v|
    v.name = "Vendor #{i + 1}"
    v.balance = rand(-500..5000)
    v.status = [:active, :suspended].sample
  end
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

# --- EXTRA TOP-TIER VENDOR FOR TESTING ---
puts "🌟 Creating another top-tier vendor for testing..."
top_vendor2_user = User.find_or_create_by!(email: "topvendor2@dayspring.com") do |u|
  u.name = "Top Vendor 2"
  u.password = "password"
  u.role = :vendor
end
top_vendor2 = Vendor.find_or_create_by!(user: top_vendor2_user) do |v|
  v.name = "Top Vendor 2"
  v.balance = 3500
  v.status = :active
end
12.times do |i|
  Product.create!(
    vendor: top_vendor2,
    name: "Top Vendor 2 Product #{i + 1}",
    price: 120,
    inventory_count: 15,
    is_clearance: false
  )
end
puts "✔ Second top-tier vendor created."

# --- EXTRA ADMINS ---
puts "👤 Creating extra admin..."
User.find_or_create_by!(email: "admin2@dayspring.com") do |u|
  u.name = "Admin2"
  u.password = "password"
  u.role = :admin
end
puts "✔ Extra admin created."

# --- EXTRA ORDERS FOR TOP VENDORS ---
puts "🛒 Creating extra orders for top vendors..."
Order.create!(customer: customers.first, status: :completed, total_price: 1320)
Order.create!(customer: customers.second, status: :completed, total_price: 1440)
puts "✔ Extra orders created."



# --- DISCOUNTS ---
puts "🏷 Creating discounts..."

[
  { code: "SAVE10", percentage: 10, active: true },
  { code: "SAVE20", percentage: 20, active: true },
  { code: "EXPIRED5", percentage: 5, active: false }
].each do |attrs|
  Discount.find_or_create_by!(code: attrs[:code]) do |d|
    d.percentage = attrs[:percentage]
    d.active = attrs[:active]
  end
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

# --- WISHLISTS ---
puts "💖 Creating wishlists..."

customers.each do |customer|
  products.sample(rand(3..6)).each do |product|
    Wishlist.find_or_create_by!(
      user: customer,
      product: product
    )
  end
end

puts "✔ Wishlists created"
puts "🎉 Seeding complete!"




