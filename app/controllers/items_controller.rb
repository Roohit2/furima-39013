class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destoroy
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:delivery_cost_id,:delivery_prefecture_id,:delivery_day_id,:price,:user)
  end
end