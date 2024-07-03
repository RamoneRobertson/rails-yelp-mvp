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

puts "Done."
