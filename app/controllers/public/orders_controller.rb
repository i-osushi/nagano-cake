class Public::OrdersController < ApplicationController
  # before_action :authenticate_customers!
  def new
    @order = Order.new
  end

  def confirm

  end

  def complete
  end

  def index
  end

  def show
  end
end
