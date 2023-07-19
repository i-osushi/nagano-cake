class CartItem < ApplicationRecord
  # 会員・商品：カート内商品= 1 : N
  belongs_to :customer
  belongs_to :item
  
  def get_image(height, width)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [height, width]).processed
  end
  
  def add_tax_price
    tax = 1.1
    (self.price * tax).round
  end
  
  ## 小計を求めるメソッド
  def subtotal
    item.add_tax_price * amount
  end
end
