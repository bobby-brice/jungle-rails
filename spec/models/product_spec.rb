require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'product is valid with valid attributes' do
      category = Category.new(name: "Electronics")
      product = Product.new(name: "Drone", price: 100, quantity: 1, category: category)
      expect(product).to be_valid
      expect(product.errors.full_messages).to eq []
    end

    it 'validates whether product name is valid' do
      category = Category.new(name: "Electronics")
      product = Product.new(name: nil, price: 100, quantity: 1, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eq [
        "Name can't be blank"
      ]
    end

    it 'validates whether product price is valid' do
      category = Category.new(name: "Electronics")
      product = Product.new(name: "Walkman", price: nil, quantity: 1, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eq [
        "Price cents is not a number", "Price is not a number", "Price can't be blank"
      ]
    end

    it 'validates whether product quantity is valid' do
      category = Category.new(name: "Electronics")
      product = Product.new(name: "Walkman", price: 100, quantity: nil, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eq [
        "Quantity can't be blank"
      ]
    end

    it 'validates whether product category is valid' do
      # category = Category.new(name: nil)
      product = Product.new(name: "Walkman", price: 100, quantity: 1, category: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eq [
        "Category can't be blank"
      ]
      
    end

  end
end
