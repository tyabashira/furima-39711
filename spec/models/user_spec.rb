require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe'ユーザー新規登録' do
    it '全ての項目の入力が存在すれば登録できる' do
      
      expect(@user).to be_valid
    end

    it 'user_nameが空では登録できない' do
      
      @user.user_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("User name can't be blank")
    end

    it 'emailが空では登録できない' do
       
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     
    end

    it 'passwordが空では登録できない' do
        
      @user.password = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     
    end

    it 'first_nameが空では登録できない' do
      
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     
    end

    it 'last_nameが空では登録できない' do
        
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     
    end

    it 'first_kanaが空では登録できない' do
        
      @user.first_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
     
    end

    it 'last_kanaが空では登録できない' do
        
      @user.last_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
     
    end

    it 'birthが空では登録できない' do
       
      @user.birth = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
     
    end

    # it 'emailの一意制約違反の場合' do
    #   @user = FactoryBot.create(:user)
    #   another_user = FactoryBot.build(:user, email: user.email)  
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("は既に存在します")
     
    # end

    it 'passwordが6文字以上であれば登録できる' do
      @user = FactoryBot.build(:user, password: "12345a", encrypted_password: "12345a")    
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user = FactoryBot.build(:user, password: "1234a", encrypted_password: "1234a")   
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordに英数字が含まれているとき登録できる' do
      @user = FactoryBot.build(:user, password: "12345a", encrypted_password: "12345a")   
      expect(@user).to be_valid
    end

    it 'passwordとconfirmationが一致していないと登録できない' do
      @user = FactoryBot.build(:user, password: "12345a", encrypted_password: "12345b") 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字のみでは登録できない' do
      @user = FactoryBot.build(:user, password: "abcdef", encrypted_password: "abcdef") 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが数字のみでは登録できない' do
      @user = FactoryBot.build(:user, password: "123456", encrypted_password: "123456") 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが全角だと登録できない' do 
      @user = FactoryBot.build(:user, password: "ＡｂｃｄＥｆ1", encrypted_password: "ＡｂｃｄＥｆ1") 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'first_nameが全角でない時登録できない' do
      @user = FactoryBot.build(:user,first_name: "aiueo" )   
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it 'last_nameが全角でない時登録できない' do
      @user = FactoryBot.build(:user, last_name: "aiueo")   
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it 'first_kanaがカナでない時登録できない' do
      @user = FactoryBot.build(:user,first_kana: "あいうえお")  
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana 全角カナを使用してください')
    end 

    it 'last_kanaがカナでない時登録できない' do
      @user = FactoryBot.build(:user, last_kana: "あいうえお")  
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana 全角カナを使用してください')
    end

    


  end
end
