class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  def sum_of_price
    self.price * amount
  end

end
