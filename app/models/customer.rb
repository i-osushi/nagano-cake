class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # カート内商品：会員 = N : 1
  has_many :cart_items, dependent: :destroy

  has_many :addresses, dependent: :destroy

  has_many :orders, dependent: :destroy



end
