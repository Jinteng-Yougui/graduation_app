require 'rails_helper'
RSpec.describe 'ユーザーの登録に関連する機能', type: :system do
  describe 'ユーザーの新規登録' do
    context 'ユーザー情報を新規登録に入力した場合' do
      it '新規登録してログインできる' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'yuki@yuki.com'
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        fill_in 'user_password_confirmation', with: 'yuki@yuki.com'
        click_button '登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context 'ユーザー情報をログイン画面で入力した場合' do
      it 'ログインできる' do
        FactoryBot.create(:user)
        # @user = User.find_by(email: 'yuki@yuki.com')
        visit new_user_session_path
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end
end