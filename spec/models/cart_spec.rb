require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到購物車裡，然後購物車裡就有東西了" do
      # AAA
      # Arrange
      cart = Cart.new
      # Act
      cart.add_item(1)  
      # Assert
      expect(cart.empty?).to be false
    end

    it "如果加了相同種類的商品到購物車裡，購買項目不會增加，數量會改變" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new

      #cat1 = Category.create(name: 'Cat1')
      #cat1 = Factory.create(name: 'Cat1')
      #i1 = cat1.items.create(name: 'item1', price: '100')
      #i2 = cat1.items.create(name: 'item2', price: '80')

      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)

      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      expect(cart.items.first.item).to be_a Item
      expect(cart.items.first.item.price).to be i1.price
    end



    it "可以計算整台購物車的總消費金額" do
    end

    it "特別活動可搭配折扣（例如聖誕節全面9折、或滿千送百、滿額免運" do
    end
  end

  describe "進階功能" do
    it "可以將購物車內容轉換成Hash並存到session裡" do
    end
  
    it "也可以存放在Session的內容（Hash格式），還原成購物車的內容" do
    end
  end
end
