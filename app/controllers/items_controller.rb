class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end
end
# def new
#   @item = Item.new
# end

# def create
#   @item = Item.new(item_params)
#   if @item.save
#     redirect_to root_path
#   else
#    # render :new, status: :unprocessable_entity
#   end
# end

# private
# def item_params
#   params.require(:item).permit(:item_name, :item_text, :category_id, :puality_id, :cost_id, :region_id, :post_day_id, :price_id, :states_id,:user).merge(user_id: current_user.id)
# end
