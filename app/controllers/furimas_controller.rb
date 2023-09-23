class FurimasController < ApplicationController
  before_action :authenticate_user!
   def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     @furima_shopping = FurimaShopping.new
     @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id 
        redirect_to root_path
      end
      if @item.furima.present?
        redirect_to root_path
      end
   end
   

    def create
    @item = Item.find(params[:item_id])
      @furima_shopping = FurimaShopping.new(furima_shopping_params)

      if @furima_shopping.valid?
   
        pay_item
       
        @furima_shopping.save
        redirect_to root_path
      else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render :index, status: :unprocessable_entity
      end
    end
  
   private

   def furima_shopping_params
     params.require(:furima_shopping).permit(:post_code, :region_id, :city, :street, :build, :phone, :price).merge(user_id: current_user.id, item_id: params[:item_id] , token: params[:token])
   end
  
   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
        Payjp::Charge.create(
          amount:@item.price,  # 商品の値段
          card: furima_shopping_params[:token],    # カードトークン
          currency: 'jpy'        # 通貨の種類（日本円）
        )
        end
      end
