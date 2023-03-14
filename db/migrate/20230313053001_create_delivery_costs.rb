class CreateDeliveryCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_costs do |t|
      t.string     :title                , null: false
      t.text       :text                 , null: false
      t.integer    :delivery_cost_id     , null: false
      t.timestamps
    end
  end
end
