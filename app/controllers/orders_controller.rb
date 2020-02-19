class OrdersController < ApplicationController
  def new
    @card = Card.find_by(user_id: current_user.id)
    @card = Card.new
  end


  def create
    @order = Order.create(order_params).merge(item_id: params[:id] , buyer_user_id: current_user.id)
    @item = Item.find(params[:id])
    @item.status = 3
    @item.save
      flash[:success] = "購入しました。"
    redirect_to ("/") and return
  end

end


