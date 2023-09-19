class Shopping < ApplicationRecord
  belongs_to :furima

  validates :post_code, presence: true
  validates :region_id, numericality: { other_than: 0,  message: "can't be blank"} 
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true
 
end
