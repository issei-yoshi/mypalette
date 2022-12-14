require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context 'emailカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, email: '')
        expect(user.valid?).to eq false;
      end
    end

    context 'nameカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, name: '')
        expect(user.valid?).to eq false;
      end
    end

    context 'passwordカラム' do
      it '空欄の場合は作成できない' do
        user = build(:user, password: '')
        expect(user.valid?).to eq false;
      end
    end
  end
end