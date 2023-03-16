class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(created_at: :desc)
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
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:delivery_cost_id,:delivery_prefecture_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end
end