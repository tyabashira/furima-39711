require 'rails_helper'

RSpec.describe FurimaShopping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @furima_shopping = FactoryBot.build(:furima_shopping, user_id: user.id, item_id: item.id)
    
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@furima_shopping).to be_valid
    end
    it "phoneが10桁では登録できること" do
      @furima_shopping.phone = 1234567890
      expect(@furima_shopping).to be_valid
    end
    it "phoneが11桁では登録できること" do
      @furima_shopping.phone = 12345678901
      expect(@furima_shopping).to be_valid
    end
    it "建物が空でも登録できること" do
      @furima_shopping.build = nil
      expect(@furima_shopping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "user_idが空では登録できないこと" do
      @furima_shopping.user_id = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @furima_shopping.item_id = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @furima_shopping.token = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Token can't be blank")
    end
    it "post_codeが3桁-4桁でないと登録できないこと" do
      @furima_shopping.post_code = 1234567
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Post code を入力してください")
    end
    it "post_codeが空では登録できないこと" do
      @furima_shopping.post_code = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Post code can't be blank")
    end
    
    it "cityが空では登録できないこと" do
      @furima_shopping.city = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("City can't be blank")
    end
    it "streetが空では登録できないこと" do
      @furima_shopping.street = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Street can't be blank")
    end
    it "phoneが空では登録できないこと" do
      @furima_shopping.phone = nil
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Phone can't be blank")
    end
    it "phoneが9桁以下では登録できないこと" do
      @furima_shopping.phone = 123456789
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Phone 正しく入力してください")
    end
    it "phoneが12桁以上では登録できないこと" do
      @furima_shopping.phone = 123456789012
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Phone 正しく入力してください")
    end
    it "phoneが数字でなければ登録できないこと" do
      @furima_shopping.phone = "aiueoaiueo"
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Phone is not a number")
    end
    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @furima_shopping.region_id = 0
      @furima_shopping.valid?
      expect(@furima_shopping.errors.full_messages).to include("Region can't be blank")
    end
  
  end
end