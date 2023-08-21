5.times do |user|
  User.create!(
    name: "dprodpro#{user+1}",
    email: "dprodpro#{user+1}@dpro.com",
    password: "dprodpro#{user+1}"
  )
end

User.all.each_with_index do |user, i|
  5.times do |contact|
    Contact.create!(
      name: "WEF#{(contact+1).to_s + (i+1).to_s}",
      email: "WEF#{(contact+1).to_s + (i+1).to_s}@dpro.com",
      user: user
    )
  end
end

category_array = ["誕生日", "クリスマス", "結婚記念日", "新年の挨拶", "その他"]
category_array.each do |category|
  Category.create!(
    name: category
  )
end
start_time_array = ["8/24/2023", "8/30/2023", "12/25/2023", "1/1/2024", "9/1/2023"]
Contact.all.each do |contact|
  Booking.create!(
    title: "Hi",
    content: "How are you?",
    contact: contact,
    start_time: start_time_array.sample,
    category: Category.all.sample
  )
end
  