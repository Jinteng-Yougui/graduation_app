require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validationのテスト' do
    let!(:user){FactoryBot.create(:user, name: 'kondo@kondo.com', email: 'kondo@kondo.com', password: 'kondo@kondo.com')}
    context 'ユーザーの名前とメールアドレス、パスワードを入力して登録' do
      it '登録できる' do
        expect(user).to be_valid
      end
    end
    context 'メールアドレスに＠を入れないで登録' do
      it '登録できない' do
        expect(user).not_to be_valid
      end
    end
  end
end