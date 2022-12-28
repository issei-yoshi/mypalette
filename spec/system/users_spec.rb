require 'rails_helper'

RSpec.describe 'Users' do
  let(:user) { create(:user) }

  describe 'ログイン前' do
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
          expect(page).to have_current_path root_path, ignore_query: true
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
          expect(page).to have_content "Emailを入力してください"
          expect(page).to have_current_path users_path, ignore_query: true
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
          expect(page).to have_content "Emailはすでに存在します"
          expect(page).to have_current_path users_path, ignore_query: true
          expect(page).to have_field 'メールアドレス', with: existed_user.email
        end
      end

      describe 'マイページ' do
        context '未ログイン状態' do
          it 'マイページへのアクセスが失敗する' do
            visit mypage_profile_path(user)
            expect(page).to have_content('ログインしてください')
            expect(page).to have_current_path login_path, ignore_query: true
          end
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit edit_mypage_profile_path
          fill_in '名前', with: 'UpdateName'
          fill_in 'メールアドレス', with: 'update@example.com'
          click_button '更新'
          expect(page).to have_content('編集に成功しました')
          expect(page).to have_current_path mypage_profile_path, ignore_query: true
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_mypage_profile_path
          fill_in '名前', with: 'UpdateName'
          fill_in 'メールアドレス', with: ''
          click_button '更新'
          expect(page).to have_content('編集に失敗しました')
          expect(page).to have_current_path mypage_profile_path, ignore_query: true
        end
      end

      context 'メールアドレスが既に使われている' do
        it 'ユーザーの編集が失敗する' do
          other_user = create(:user)
          visit edit_mypage_profile_path
          fill_in '名前', with: 'UpdateName'
          fill_in 'メールアドレス', with: other_user.email
          click_button '更新'
          expect(page).to have_content('編集に失敗しました')
          expect(page).to have_content('Emailはすでに存在します')
          expect(page).to have_current_path mypage_profile_path, ignore_query: true
        end
      end
    end
  end
end
