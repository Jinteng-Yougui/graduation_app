require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validationのテスト' do
    let!(:user){FactoryBot.create(:user)}
    context '連絡先の名前とメールアドレスを入力して登録' do
      it '登録できる' do
        contact = Contact.new(name: "kondo@kondo.com", email: "kondo@kondo.com", user: user) 
        binding.pry
        expect(contact).to be_valid
      end
    end
    context '連絡先の名前を入力せずに登録' do
      it '登録できない' do
        contact = Contact.new(name: nil)
        contact.valid?
        expect(contact.errors[:name]). to include("登録できません")
      end
    end
  end
end
