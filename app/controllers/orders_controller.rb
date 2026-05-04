class OrdersController < ApplicationController
  def new
    @items = Inventory::Item.all
  end

  def create
    item = Inventory::Item.find(params[:item_id])
    
    result = Sales::PlaceOrder.call(
      customer_name: params[:customer_name],
      item: item,
      quantity: params[:quantity].to_i
    )

    if result.success?
      redirect_to order_path(result.order), notice: "Order placed successfully!"
    else
      @items = Inventory::Item.all
      flash.now[:alert] = result.message
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Sales::Order.find(params[:id])
  end
end
