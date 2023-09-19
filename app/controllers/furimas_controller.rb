class FurimasController < ApplicationController

   def index
     @shopping = Shopping.new
     @item = Item.find(params[:item_id])
    end

     def create
     @shopping = Shopping.new(shopping_params)
     binding.pry
     if @shopping.valid?
       @shopping.save
       return redirect_to root_path
     else
      render 'index', status: :unprocessable_entity
     end
   end

   private

   def shopping_params
     params.require(:shopping).permit(:post_code, :states_id, :city, :street, :build, :phone)
   end
end
