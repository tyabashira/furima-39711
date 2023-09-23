class FurimaShopping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :street, :phone, :build, :token, :price

  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  validates :region_id, numericality: { other_than: 0,  message: "can't be blank"} 
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true,numericality:{only_integer: true}, length: { in: 10..11, message: "正しく入力してください" }
  validates :user_id,presence: true
  validates :item_id,presence: true
  
  validates :token, presence: true

def save
 
  furima = Furima.create( user_id: user_id, item_id: item_id)
  Shopping.create(post_code: post_code, city: city, street: street, phone: phone, region_id: region_id, build: build, furima_id: furima.id)
  

end

end



