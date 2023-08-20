# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |user|
  User.create!(
    name: "Dpro#{user+1}",
    email: "dpro#{user+1}@dpro.com",
    password: "Dpro#{user+1}"
  )
end

5.times do |contact|
  Contact.create!(
    name: "WEF#{contact+1}",
    email: "WEF#{contact+1}@dpro.com",
  )
end

category_array = ["誕生日", "クリスマス", "結婚記念日", "新年の挨拶", "その他"]
start_time_array = ["8/24/2023", "8/30/2023", "12/25/2023", "1/1/2024", "9/1/2023"]
5.times do |booking|
  Booking.create!(
    user_id: 1,
    title: "Hi",
    content: "How are you?",
    contact_id: 1
    start_time: start_time_array.pop,
    category: priority_array.pop,
  )
end
  