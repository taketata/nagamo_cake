class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def confirm
    if params[:order][:select_address].to_i == 2
      @order = Order.new(order_params)

    elsif params[:order][:select_address].to_i == 1
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:payment_method].to_i
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.total_payment = @total + @order.postage
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:address,:postal_code,:name,:postage,:total_payment)
  end

  def order_detail_params
    params.require(:order_detail).permit(:amount,:price)
  end

end
