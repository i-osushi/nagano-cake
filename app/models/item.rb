class Item < ApplicationRecord
# order_detailsのどのidとアソシエーションするか記述
has_many :order_details, class_name: "OrderDetail",foreign_key: "item_id", dependent: :destroy
# order_detailsが中間テーブルであり実際結びつけるモデルを指定
has_many :orders, through: :order_details

end
