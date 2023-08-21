FactoryBot.define do
  factory :booking do
    title { 'Hello' }
    content { 'Long time no see!' }
    contact_id {1}
    start_time {8/23/2023}
    category_id {5}
  end

  factory :second_booking, class: Booking do
    title { 'こんにちは' }
    content { 'お誕生日おめでとうございます' }
    contact_id {1}
    start_time {8/31/2023}
    category_id {1}
  end
end