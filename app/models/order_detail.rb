class OrderDetail < ApplicationRecord

belongs_to :item
belongs_to :order

# 制作ステータス {0:着手不可、1:制作待ち、2:制作中、3:製作完了}
enum making_status: {impossible: 0, waiting: 1, producting: 2, completion: 3}

## 小計を求めるメソッド
  def subtotal
    item.add_tax_price * amount
  end

end
