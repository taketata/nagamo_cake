class Admin::OrdersController < ApplicationController
  def show
  end

  def update
  @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end

end
