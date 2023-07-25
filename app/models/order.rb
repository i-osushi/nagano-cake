class Order < ApplicationRecord
  # order_detailsのどのidとアソシエーションするか記述
 has_many :order_details
 # , class_name: "OrderDetail",foreign_key: "order_id", dependent: :destroy
# order_detailsが中間テーブルであり実際結びつけるモデルを指定
 has_many :items, through: :order_details
# 会員　:　注文　＝　１　：　N
 belongs_to :customer

# 支払い方法 {0:クレジットカード、1:銀行振込}
enum payment_method: { credit_card: 0, transfer: 1}

# 注文ステータス {0:入金待ち、1:入金確認、2:制作中、3:発送準備中、4:発送済み}
enum status: {waiting_payment: 0, confirm_payment: 1, producting: 2, waiting_delivery: 3, start_delivery: 4}

# お届け先　｛自分の住所　登録済み住所　新規住所｝
enum select_address: { own_address: 0, registered_address: 1, new_address: 2}

def total
    order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end

end
