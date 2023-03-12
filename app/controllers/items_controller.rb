class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
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
