require 'rails_helper'

RSpec.describe 'UserSessions' do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in "password", with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'フォームが未入力' do
      it 'ログイン処理に失敗' do
        visit login_path
        fill_in 'メールアドレス', with: ''
        fill_in "password", with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end
  end
end
