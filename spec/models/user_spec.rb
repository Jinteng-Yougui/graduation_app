require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validationのテスト' do
    context 'ユーザーの名前とメールアドレス、パスワードを入力して登録' do
      it '登録できる' do
        user = User.new(name: "kondo@kondo.com", email: "kondo@kondo.com", password: "kondo@kondo.com") 
        expect(user).to be_valid
      end
    end
    context 'メールアドレスに＠を入れないで登録' do
      it '登録できない' do
        user = User.new(name: "kondo@kondo.com", email: "kondokondo.com", password: "kondo@kondo.com") 
        expect(user).to be_invalid
      end
    end
  end
end