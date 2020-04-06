class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
  belongs_to :category
  #變成有點像必填的欄位 
end
