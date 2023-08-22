require 'rails_helper'
RSpec.describe '祝い言の登録に関連する機能', type: :system do
  describe 'ユーザー登録' do
    context 'ユーザー情報を新規登録に入力した場合' do
      it '新規登録できる' do
        visit new_user_session_path
        fill_in 'user_name', with: 'yuki@yuki.com'
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        fill_in 'user_password_confirmation', with: 'yuki@yuki.com'
        click_button '登録'
        visit letter_opener_web_path
        click_button 'メールアドレスの確認'
        expect(page).to have_content'メールアドレスが確認できました。'
      end
    end
  end
end
describe '祝い言の登録機能' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:contact) { FactoryBot.create(:contact) }
  let!(:booking) { FactoryBot.create(:booking, user: user, contact: contact) }
    before do
      visit root_path
    end
    context 'ログインして連絡先を新しく追加したい場合' do
      it '連絡先追加画面で必要な情報を入力する' do
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with 'yuki@yuki.com'
        click_button 'ログイン'
        expect(page).to have_content'ログイン'
        visit new_contact_path
        fill_in 'name', with: '平仮名'
        fill_in 'email', with: 'hiragana@hiragana.com'
        click_button '登録'
      end
    context '祝い言新規作成画面で必要情報を入力する' do
      it '特定の相手に祝い言を作成できる' do
        fill_in 'title', with: FactoryBot.booking
        fill_in 'content', with: FactoryBot.booking
        fill_in 'contact', with: FactoryBot.booking
        fill_in 'start_date' with: FactoryBot.booking
        fill_in 'category' with: FactoryBot.booking
        click_button '登録'
        expect(page).to have_content('登録しました')
      end
      it '作成したメッセージがカレンダーに表示される' do
        visit root_path
        expect(page).to have_content(FactoryBot)
      end
    end
  end
end