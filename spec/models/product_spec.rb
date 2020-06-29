require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should validate all fields' do
      @category = Category.new({ name: "tech2"})
      @product = Product.new({
        name: "Hello",
        price: 100,
        quantity: 10,
        category: @category 
      })
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it 'should throw an error when name is blank' do
      @category = Category.new({ name: "tech2"})
      @product = Product.new({
        name: nil,
        price: 100,
        quantity: 10,
        category: @category
      })
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should throw an error when price is blank' do
      @category = Category.new({ name: "tech2"})
      @product = Product.new({
        name: "Hello",
        price: nil,
        quantity: 10,
        category: @category
      })
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should throw an error when quantity is blank' do
      @category = Category.new({ name: "tech2"})
      @product = Product.new({
        name: "Hello",
        price: 100,
        quantity: nil,
        category: @category 
      })
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should throw an error when category is blank' do
      @category = Category.new({ name: "tech2"})
      @product = Product.new({
        name: "Hello",
        price: 100,
        quantity: 10,
        category: nil
      })
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
