class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  def index
   @items = Item.all.order("created_at DESC")
  end

 def new
    @item = Item.new
end

 def create
   @item = Item.new(item_params)
  if @item.save
     redirect_to root_path
   else
    render :new, status: :unprocessable_entity
  end
end

def show
  @item = Item.find(params[:id])
end

def edit
  if user_signed_in?
  @item = Item.find(params[:id])
  if @item.user != current_user
    redirect_to root_path
    return
  end
else
  redirect_to  new_user_session_path
end
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
  redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end
end


 private
 def item_params
   params.require(:item).permit(:image, :item_name, :item_text, :category_id, :quality_id, :cost_id, :region_id, :post_day_id, :price, :user).merge(user_id: current_user.id)
 end

end
