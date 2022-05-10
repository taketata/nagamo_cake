class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def add_tax_price
    (self.price * 1.10).floor
  end

end
