require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validationのテスト' do
    let!(:user){FactoryBot.create(:user)}
    let!(:contact){FactoryBot.create(:contact, user: user)}
    let!(:category){FactoryBot.create(:category)}
    context '祝い言のタイトルと内容を入力して登録' do
      it '登録できる' do
        booking = Booking.new(title: "お誕生日おめでとう", content: "Happy Birthday", start_time: "2023/9/1", contact: contact, category: category)
        expect(booking).to be_valid
      end
    end
    context '祝い言の内容を入力しないで登録' do
      it '登録できない' do
        booking = Booking.new(title: "お誕生日おめでとう", content: nil, start_time: "2023/9/1", contact: contact, category: category)
        expect(booking).to be_invalid
      end
    end
    context '祝い言の内容が141字以上の場合' do
      it '登録できない' do
        booking = Booking.new(title: "お誕生日おめでとう", content: "a" * 141, start_time: "2023/9/1", contact: contact, category: category)
        expect(booking).to be_invalid
      end
    end
  end
end
