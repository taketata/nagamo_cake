class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer:item_id
      t.integer:customer_id
      t.integer:amount
      t.integer:price

      t.timestamps
    end
  end
end
