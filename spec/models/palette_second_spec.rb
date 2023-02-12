require 'rails_helper'

RSpec.describe 'Platte_secondモデルのテスト' do
  describe 'バリデーションテスト' do
    let(:user) { create(:user) }
    let(:palette_second) { build(:palette_second, user_id: user.id) }

    context 'mainカラム' do
      it '空欄の場合は作成できない' do
        palette_second = build(:palette_second, main: '')
        expect(palette_second.valid?).to be false
      end
    end

    context 'subカラム' do
      it '空欄の場合は作成できない' do
        palette_second = build(:palette_second, sub: '')
        expect(palette_second.valid?).to be false
      end
    end

    context 'bodyカラム' do
      it '空欄の場合は作成できない' do
        palette_second = build(:palette_second, body: '')
        expect(palette_second.valid?).to be false
      end
    end
  end
end