class ItemsController < ApplicationController
  def index
   @items = Item.all
  end

 def new
  if user_signed_in?
    @item = Item.new
   else
    redirect_to new_user_session_path
 end
end

 def create
   @item = Item.new(item_params)
  if @item.save
     redirect_to root_path
   else
    render :new, status: :unprocessable_entity
  end
end

 private
 def item_params
   params.require(:item).permit(:image, :item_name, :item_text, :category_id, :quality_id, :cost_id, :region_id, :post_day_id, :price, :user).merge(user_id: current_user.id)
 end

end
