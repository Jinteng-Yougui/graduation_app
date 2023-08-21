FactoryBot.define do
  factory :booking do
    title { 'Hello' }
    content { 'Long time no see!' }
    contact {'WEF11'}
    start_time {8/23/2023}
    category {'その他'}
  end

  factory :second_booking, class: Booking do
    title { 'こんにちは' }
    content { 'お誕生日おめでとうございます' }
    contact {'WEF11'}
    start_time {8/31/2023}
    category {'誕生日'}
  end
end