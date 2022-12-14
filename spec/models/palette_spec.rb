require 'rails_helper'

RSpec.describe 'Paletteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    let(:user) { FactoryBot.create(:user) }
    let!(:palette) { build(:palette, user_id: user.id) }

    context 'mainカラム' do
      it '空欄の場合は作成できない' do
        palette = build(:palette, main: '')
        expect(palette.valid?).to eq false;
      end
    end

  end
end