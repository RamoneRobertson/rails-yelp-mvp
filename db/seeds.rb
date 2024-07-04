puts "Clearing database..."
Restaurant.destroy_all

puts "Creating restaurants"
img_num = 0
12.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip_code}, #{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.country}",
    phone_number: "#{Faker::PhoneNumber.phone_number}",
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    img_path: "restaurant-cards/restaurant#{img_num += 1}.jpg"
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

puts "setting image urls"
images = Dir.glob("app/assets/images/restaurant-cards/*.jpg")

puts "Done."
