class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :destroy, :edit]
  before_action :set_find, only: [:edit, :show, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def destoroy
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:delivery_cost_id,:delivery_prefecture_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end

  def set_find
    @item = Item.find(params[:id])
  end
end
