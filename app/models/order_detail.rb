class OrderDetail < ApplicationRecord

belongs_to :items
belongs_to :orders

enum making_status: {impossible: 0, waiting: 1, production: 2, completion: 3}

end
