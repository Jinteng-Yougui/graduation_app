require 'rails_helper'
RSpec.describe '祝い言の登録に関連する機能', type: :system do
  describe '祝い言の登録機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:contact) { FactoryBot.create(:contact, user: user) }
    let!(:category){ FactoryBot.create(:category) }
    let!(:booking) { FactoryBot.create(:booking, category: category, contact: contact) }
    before do
      visit root_path
    end
    context 'ログインして連絡先を新しく追加したい場合' do
      it '連絡先追加画面で必要な情報を入力する' do
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        visit new_contact_path
        fill_in 'contact_name', with: '平仮名'
        fill_in 'contact_email', with: 'hiragana@hiragana.com'
        click_button '登録'
        expect(page).to have_content('登録が完了しました')
      end
    end
    context '祝い言新規作成画面で必要情報を入力する' do
      it '特定の相手に祝い言を作成できる' do
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        visit new_booking_path
        fill_in 'booking_title', with: 'お誕生日おめでとう'
        fill_in 'booking_content', with: 'Happy Birthday'
        select '平仮名', from: 'booking_contact_id'
        fill_in 'booking_start_time', with: '002023-08-31'
        select 'その他', from: 'booking_category_id'
        click_button '登録'
        expect(page).to have_content('登録しました')
      end
      it '作成した祝い言が指定した日にカレンダーに表示される' do
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        visit new_booking_path
        fill_in 'booking_title', with: 'お誕生日おめでとう'
        fill_in 'booking_content', with: 'Happy Birthday'
        select '平仮名', from: 'booking_contact_id'
        fill_in 'booking_start_time', with: '002023-08-23'
        select 'その他', from: 'booking_category_id'
        click_button '登録'
        visit root_path
        expect(page).to have_content('"その他"の祝い言')
      end
    end
  end
end