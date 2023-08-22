require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validationのテスト' do
    let!(:user){FactoryBot.create(:user)}
    let!(:contact){FactoryBot.create(:contact, user: user)}
    let!(:category){FactoryBot.create(:category, user: user)}
    let!(:booking){FactoryBot.create(:booking, category: category, contact: contact)}
    let!(:second_booking){FactoryBot.create(:second_booking, title: nil, content: 'お誕生日おめでとうございます', category: '誕生日', contact: 'WEF11')}
    let!(:thrid_booking){FactoryBot.create(:third_booking, title: こんにちは, content: nil, category: '誕生日', contact: 'WEF11')}
    context '祝い言のタイトルと内容を入力して登録' do
      it '登録できる' do
        expect(booking).to be_valid
      end
    end
    context '祝い言の内容を入力しないで登録' do
      it '登録できない' do
        expect(thrid_booking).not_to be_valid
      end
    end
    context '祝い言の内容が141字以上の場合' do
      it '登録できない' do
        booking = Booking.new(content: 'a' * 141)
        booking.valid?
        expect(booking.errors[:content]).to include("エラー")
      end
    end
  end
end
