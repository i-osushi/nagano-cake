class Item < ApplicationRecord
# order_detailsのどのidとアソシエーションするか記述
has_many :order_details, class_name: "OrderDetail",foreign_key: "item_id", dependent: :destroy
# order_detailsが中間テーブルであり実際結びつけるモデルを指定
has_many :orders, through: :order_details

# カート内商品：商品 = N : 1
has_many :cart_items, dependent: :destroy

# ジャンルidとのアソシエーション
belongs_to :genre, foreign_key: 'genre_id'
# ActiveStorage
has_one_attached :image

validates :name, presence: true
validates :introduction, presence: true
validates :genre, presence: true
validates :price, presence: true

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
  
end
