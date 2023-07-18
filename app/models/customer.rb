class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # カート内商品：会員 = N : 1
  has_many :cart_items, dependent: :destroy
  # 配送先：会員　＝　N:1
  has_many :addresses, dependent: :destroy
  # 注文　：　会員　＝　N:1
  has_many :orders, dependent: :destroy

end
