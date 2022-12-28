require 'rails_helper'

RSpec.describe 'Userモデルのテスト' do
  describe 'バリデーションのテスト' do
    context 'emailカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, email: '')
        expect(user.valid?).to be false
      end
    end

    context 'nameカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, name: '')
        expect(user.valid?).to be false
      end
    end

    context 'passwordカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, password: '')
        expect(user.valid?).to be false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Paletteモデルとの関係' do
      it '1:N' do
        expect(User.reflect_on_association(:palettes).macro).to eq :has_many
      end
    end
  end
end
