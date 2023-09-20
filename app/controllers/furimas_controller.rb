class FurimasController < ApplicationController

   def index
     @furima_shopping = FurimaShopping.new
     @item = Item.find(params[:item_id])
    end

    def new
      @furima_shopping = FurimaShopping.new
    end

    def create
    
      @furima_shopping = FurimaShopping.new(furima_shopping_params)
      if @furima_shopping.valid?
        @furima_shopping.save
        redirect_to root_path
      else
        render :index, status: :unprocessable_entity
      end
    end
  
   private

   def furima_shopping_params
     params.require(:furima_shopping).permit(:post_code, :region_id, :city, :street, :build, :phone).merge(user_id: current_user.id, item_id: params[:item_id] )
   end
end
