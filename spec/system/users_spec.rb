require 'rails_helper'

RSpec.describe 'Users', type: :system do

  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path
        fill_in '名前', with: 'TestUser'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in "user_password", with: 'password'
        fill_in "user_password_confirmation", with: 'password'
        click_button '登録'
        expect(page).to have_content '登録が完了しました'
        expect(current_path).to eq root_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'TestUser'
        fill_in 'メールアドレス', with: ''
        fill_in "user_password", with: 'password'
        fill_in "user_password_confirmation", with: 'password'
        click_button '登録'
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content "Email can't be blank"
        expect(current_path).to eq users_path
      end
    end

    context '登録済みのメールアドレスを使用' do
      it 'ユーザーの新規作成が失敗する' do
        existed_user = create(:user)
        visit new_user_path
        fill_in '名前', with: 'TestUser'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in "user_password", with: 'password'
        fill_in "user_password_confirmation", with: 'password'
        click_button '登録'
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content "Email has already been taken"
        expect(current_path).to eq users_path
        expect(page).to have_field 'メールアドレス', with: existed_user.email
      end
    end

    describe 'マイページ' do
      context '未ログイン状態' do
        it 'マイページへのアクセスが失敗する' do
          visit mypage_profile_path(user)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end
    end
  end

end