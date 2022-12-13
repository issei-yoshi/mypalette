require 'rails_helper'

RSpec.describe 'Palettes', type: :system do

  let(:user) { create(:user) }
  let(:palette) { create(:palette) }

  describe 'ログイン前' do
    describe 'パレット新規登録' do
      context 'パレットの入力値が正常' do
        it 'パレットの新規作成が失敗する' do
          visit root_path
          fill_in "palette_main", with: '#FF0000'
          fill_in "palette_sub", with: '#FF0000'
          fill_in "palette_body", with: '#FF0000'
          find("#palette_bgimage").find("option[value='Purple']").select_option
          click_button '登録'
          expect(page).to have_content 'ログインしてください'
          expect(current_path).to eq login_path
        end
      end
    end

    describe 'ページ遷移確認' do
      context 'パレット詳細ページにアクセス' do
        it 'アクセスに失敗する' do
          visit palette_path(palette)
          expect(page).to have_content 'ログインしてください'
          expect(current_path).to eq login_path
        end
      end

      context 'パレット一覧ページにアクセス' do
        it '全てのユーザーのパレット情報が表示される' do
          palette_list = create_list(:palette, 3)
          visit palettes_path
          expect(page).to have_content palette_list[0].main
          expect(page).to have_content palette_list[1].main
          expect(page).to have_content palette_list[2].main
          expect(current_path).to eq palettes_path
        end
      end
    end
  end

end