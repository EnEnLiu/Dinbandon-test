class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
                    
  has_many :comment
  belongs_to :category
  #變成有點像必填的欄位 
  has_one_attached :cover

  #scope :available, -> { where(deleted_at: nil) }
  default_scope {where(deleted_at: nil )}

  def destroy
    update(deleted_at: Time.now)
  end

end
