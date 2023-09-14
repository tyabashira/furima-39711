class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :post_day
  belongs_to :quality
  belongs_to :region
  belongs_to :user
  belongs_to :furima
  has_one_attached :image
 
  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum:40, message:"40文字以下にしてください" }
  validates :item_text, presence: true, length: { maximum:1000, message:"1000文字以下にしてください" }

  validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "は ¥300~9,999,999 の間で半角数字で指定してください" }

  validates :category_id, numericality: { other_than: 1,  message: "can't be blank"} 
  validates :cost_id, numericality: { other_than: 1,  message: "can't be blank"} 
  validates :post_day_id, numericality: { other_than: 1,  message: "can't be blank"} 
  validates :quality_id, numericality: { other_than: 1,  message: "can't be blank"} 
  validates :region_id, numericality: { other_than: 0,  message: "can't be blank"} 
end
