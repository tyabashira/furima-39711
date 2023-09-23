class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :destroy]
  before_action :item, only: [:edit, :update, :show, :destroy]
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
end

def edit
   if @item.user != current_user || @item.furima.present?
    redirect_to root_path
    return
   end
end

def update
 
  if @item.update(item_params)
  redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  
  if current_user.id == @item.user_id  
    @item.destroy
  end
  redirect_to root_path
end

def item
  @item = Item.find(params[:id])
end


 private
 def item_params
   params.require(:item).permit(:image, :item_name, :item_text, :category_id, :quality_id, :cost_id, :region_id, :post_day_id, :price, :user).merge(user_id: current_user.id)
 end

end
