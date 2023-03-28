class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :destroy, :edit]
  before_action :set_find, only: [:edit, :show, :update, :destroy]
  before_action :sold_out, only: [:edit]

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
    if @item.user_id == current_user.id
      @item.edit
      redirect_to root_path
    else
      redirect_to root_path
  end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
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

  def sold_out
    return if @item.order.nil?
    redirect_to root_path
  end

end
