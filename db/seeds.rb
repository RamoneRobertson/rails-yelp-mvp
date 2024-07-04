puts "Clearing database..."
Restaurant.destroy_all

puts "Creating restaurants"
10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip_code}, #{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.country}",
    phone_number: "#{Faker::PhoneNumber.phone_number}",
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
end

puts "Creating reviews..."
restaurants = Restaurant.all
restaurants.each do |restaurant|
  3.times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant_id: restaurant.id
    )
  end
end

puts "Done."
