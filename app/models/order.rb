class Order < ApplicationRecord
  # order_detailsのどのidとアソシエーションするか記述
 has_many :order_details, class_name: "OrderDetail",foreign_key: "order_id", dependent: :destroy
# order_detailsが中間テーブルであり実際結びつけるモデルを指定
 has_many :items, through: :order_details

enum payment_method: { credit_card: 0, transfer: 1}

enum status: {waiting_payment: 0, confirm_payment: 1, producting: 2, waiting_delivery: 3, start_delivery: 4}

end
