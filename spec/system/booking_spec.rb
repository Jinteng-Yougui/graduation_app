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
    context 'ログインして連絡先を新しく追加したい場合' do
      it '連絡先追加画面で必要な情報を入力する' do
        visit root_path
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with 'yuki@yuki.com'
        click_button 'ログイン'
        expect(page).to have_content'ログイン'
        visit new_contact_path
        fill_in 'name', with: '平仮名'
        fill_in 'email', with: 'hiragana@hiragana.com'
        click_button '登録'
      end
    end
  end
  describe '祝い言の登録機能' do

    
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    before do
      visit root_path
    end
    context 'ログイン画面で必要情報をを入力した場合' do
      it 'ログインして詳細画面を表示できる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        expect(page).to have_content('yuki@yuki.com')
      end
    end
    context '一般ユーザが他人の詳細画面を表示しようとした場合' do
      it 'タスク一覧画面に遷移する' do
        fill_in 'session_email', with: 'iseki@dic.xom'
        fill_in 'session_password', with: 'iseki@dic.xom'
        click_button 'ログイン'
        sleep(1)
        visit user_path(admin_user)
        expect(page).to have_content('タスク一覧')
      end
    end
    context 'ログアウトする場合' do
      it 'ログアウトできる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        click_link 'ログアウト'
        expect(page).to have_content('ログイン')
      end
    end
  end
end