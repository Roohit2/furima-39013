class CreateOrderDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_delivery_addresses do |t|

      t.timestamps
    end
  end
end
