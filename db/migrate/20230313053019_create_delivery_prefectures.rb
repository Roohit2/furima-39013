class CreateDeliveryPrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_prefectures do |t|
      t.string     :title                      , null: false
      t.text       :text                       , null: false
      t.integer    :delivery_prefecture_id     , null: false
      t.timestamps
    end
  end
end
