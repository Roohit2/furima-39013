class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :delivery_prefecture

  validates :name, presence:true
  validates :description, presence:true
  validates :price, presence:true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , only_integer: true }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_one :order
  has_one_attached :image
  validates :image, presence:true

end