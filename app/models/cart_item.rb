class CartItem < ApplicationRecord
  # 会員・商品：カート内商品= 1 : N
  belongs_to :customer
  belongs_to :item
  
end
