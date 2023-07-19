class CartItem < ApplicationRecord
  # 会員・商品：カート内商品= 1 : N
  belongs_to :customer
  belongs_to :item
  
  def add_tax_price
    tax = 1.1
    (self.price * tax).round
  end
end
