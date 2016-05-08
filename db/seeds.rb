10.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end
users = User.all

100.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.word
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."
