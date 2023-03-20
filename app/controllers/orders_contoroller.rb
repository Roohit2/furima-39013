class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:postal_code, :delivery_prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        price: order_params[:id],
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
end