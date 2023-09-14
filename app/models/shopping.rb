 class Shopping < ApplicationRecord
   belongs_to :furima
   belongs_to :states

   validates :post_code, presence: true
   validates :states, numericality: { other_than: 0,  message: "can't be blank"}
   validates :city, presence: true
   validates :street, presence: true
  validates :phone, presence: true
 end
