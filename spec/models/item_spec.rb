require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
   describe'出品機能' do
    context '出品機能が正しい時' do
     it '全ての項目の入力が存在すれば登録できる' do     
      expect(@item).to be_valid
    end
   end
    context '出品機能が異常な時' do
     it 'imageが空では登録できない' do
      
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end

    it 'item_nameが空では登録できない' do
      
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'item_textが空では登録できない' do
      
      @item.item_text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item text can't be blank")
    end

    it 'category_idが空では登録できない' do
      
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it ' quality_idが空では登録できない' do
      
      @item.quality_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality can't be blank")
    end

    it 'cost_id が空では登録できない' do
      
      @item.cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
    end

    it ' region_idが空では登録できない' do
      
      @item.region_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end

    it 'post_day_id が空では登録できない' do
  
      @item.post_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Post day can't be blank")
    end

    it 'price が空では登録できない' do
      
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end

    it '41文字以上では登録できない' do
      @item.item_name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name 40文字以下にしてください")
    end

    it '1001文字以上では登録できない'do
      @item.item_text = 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Item text 1000文字以下にしてください")
    end

    it '販売価格が299以下では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
   
    it '販売価格が10,000,000以上では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '販売価格が半角数字でない場合、登録できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '販売価格が数字でないと登録できない' do
      @item.price = 'abcdef'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
end