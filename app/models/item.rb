class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :delivery_prefecture

  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}

end
