require 'rails_helper'

describe Address do
  describe '#create' do
    it 'is valid with a postal_code, prefecture, city, street and building.' do
      address = build(:address)
      expect(address).to be_valid
    end
    it 'is valid without a building.' do
      address =build(:address, building: nil)
      expect(address).to be_valid
    end
    it 'is invalid without a postal_code' do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include('を入力してください')
    end
    it 'is invalid without a prefecture' do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include('を入力してください')
    end
    it 'is invalid without a city' do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include('を入力してください')
    end
    it 'is invalid without a street' do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include('を入力してください')
    end
  end
end
