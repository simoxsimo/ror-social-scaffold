# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creating 20 users with 10 posts each excluding admin

User.create!(email: 'admin@admin.com',
    name: 'admin',
    password: '123456',
    password_confirmation: '123456')

user = []

19.times do |n|
  user[n] = User.create!(email: "seed#{n + 1}@admin.com",
                 name: Faker::Name.first_name,
                 password: '123456',
                 password_confirmation: '123456')
end

user.each do |val|
  10.times do
    val.posts.create!(content: Faker::Lorem.sentence(word_count: 5))
  end
end