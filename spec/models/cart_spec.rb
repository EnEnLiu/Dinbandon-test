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
  end


  describe "進階功能" do
  end
end
