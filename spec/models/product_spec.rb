require 'rails_helper'

describe Product do
  describe '#create' do
    it 'is valid with name, description, shipping_charge, shipping_method, shipping_prefecture, price, progress' do
      product = build(:product)
      expect(product).to be_valid
    end
    it 'is invalid without a name' do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include('を入力してください')
    end
    it 'is invalid without a description' do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include('を入力してください')
    end
    it 'is invalid without a shipping_charge' do
      product = build(:product, shipping_charge: nil)
      product.valid?
      expect(product.errors[:shipping_charge]).to include('を入力してください')
    end
    it 'is invalid without a shipping_method' do
      product = build(:product, shipping_method: nil)
      product.valid?
      expect(product.errors[:shipping_method]).to include('を入力してください')
    end
    it 'is invalid without a shipping_prefecture' do
      product = build(:product, shipping_prefecture: nil)
      product.valid?
      expect(product.errors[:shipping_prefecture]).to include('を入力してください')
    end
    it 'is invalid without a price' do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include('を入力してください')
    end
    it 'is invalid without a progress' do
      product = build(:product, progress: nil)
      product.valid?
      expect(product.errors[:progress]).to include('を入力してください')
    end
  end
end