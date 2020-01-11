require 'rails_helper'

describe User do
  describe '#create' do
    context 'can save' do
      it "is valid with a nickname, email, password, last_name, first_name, last_name_kana, first_name_kana, birthday, tel" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a nickname" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid with a duplicate nickname" do
        user = create(:user)
        another_user = build(:user, nickname: user.nickname)
        another_user.valid?
        expect(another_user.errors[:nickname]).to include("はすでに存在します")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid with a duplicate email" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid without a password less than 7 characters " do
        user = build(:user, password: "123456")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it "is invalid without a last_name" do
        user = build(:user, last_name: "")
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "is invalid without a first_name" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "is invalid without a last_name_kana" do
        user = build(:user, last_name_kana: "")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end

      it "is invalid without a first_name_kana" do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      it "is invalid without a birthday" do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end

      it "is invalid with a duplicate tel" do
        user = create(:user)
        another_user = build(:user, tel: user.tel)
        another_user.valid?
        expect(another_user.errors[:tel]).to include("はすでに存在します")
      end

    end
  end
end