class Order < ApplicationRecord
  # order_detailsのどのidとアソシエーションするか記述
 has_many :order_details, class_name: "OrderDetail",foreign_key: "order_id", dependent: :destroy
# order_detailsが中間テーブルであり実際結びつけるモデルを指定
 has_many :items, through: :order_details

end
