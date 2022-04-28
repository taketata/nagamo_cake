class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer:customer_id
      t.string:address
      t.string:postal_code
      t.string:name
      t.integer:postage
      t.integer:payment_method,default:1
      t.integer:total_payment

      t.timestamps
    end
  end
end
