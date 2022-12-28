require 'rails_helper'

RSpec.describe 'Palettes' do
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
          find_by_id('palette_bgimage').find("option[value='Purple']").select_option
          click_button '登録'
          expect(page).to have_content 'ログインしてください'
          expect(page).to have_current_path login_path, ignore_query: true
        end
      end
    end

    describe 'ページ遷移確認' do
      context 'パレット詳細ページにアクセス' do
        it 'アクセスに失敗する' do
          visit palette_path(palette)
          expect(page).to have_content 'ログインしてください'
          expect(page).to have_current_path login_path, ignore_query: true
        end
      end

      context 'パレット一覧ページにアクセス' do
        it '全てのユーザーのパレット情報が表示される' do
          palette_list = create_list(:palette, 3)
          visit palettes_path
          expect(page).to have_content palette_list[0].main
          expect(page).to have_content palette_list[1].main
          expect(page).to have_content palette_list[2].main
          expect(page).to have_current_path palettes_path, ignore_query: true
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'パレット新規登録' do
      context 'パレットの入力値が正常' do
        it 'パレットの新規作成が成功する' do
          visit root_path
          fill_in "palette_main", with: '#ff0000'
          fill_in "palette_sub", with: '#ff0000'
          fill_in "palette_body", with: '#ff0000'
          find_by_id('palette_bgimage').find("option[value='Purple']").select_option
          click_button '登録'
          expect(page).to have_content 'パレットを作成しました'
          expect(find('.main-color', visible: false).value).to eq '#ff0000'
          expect(find('.sub-color', visible: false).value).to eq '#ff0000'
          expect(find('.body-color', visible: false).value).to eq '#ff0000'
          expect(find('.bgimage-change', visible: false).value).to eq 'Purple'
        end
      end
    end

    describe 'ページ遷移' do
      context '他ユーザーのパレット詳細ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_palette) { create(:palette, user: other_user) }

        it 'パレット詳細閲覧に成功する' do
          visit palette_path(other_palette)
          expect(page).to have_css('.fa-heart')
        end
      end
    end

    describe 'パレット削除' do
      let!(:palette) { create(:palette, user:) }

      it 'パレットの削除に成功する' do
        visit palette_path(palette)
        click_link '削除'
        expect(page.accept_confirm).to eq '削除してもよろしいですか'
        expect(page).to have_content 'パレットを削除しました'
        expect(page).to have_current_path new_palette_path, ignore_query: true
      end
    end
  end
end
