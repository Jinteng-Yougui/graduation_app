FactoryBot.define do
  factory :booking do
    title { 'Hello' }
    content { 'Long time no see!' }
    start_time {8/23/2023}
  end

  factory :second_booking, class: Booking do
    title { 'こんにちは' }
    content { 'お誕生日おめでとうございます' }
    start_time {8/31/2023}
  end
end