class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id,       null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.integer :customer_id,   null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      # 商品個数
      t.integer :amount,        null: false

      t.timestamps
    end
  end
end
