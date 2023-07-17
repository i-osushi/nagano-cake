class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
     if @address.save
       flash[:notice] = "You have created new address successfully."
       redirect_to addresses_path(@address.id)
     else
      @addresses = Address.all
      render 'index'
     end
  end

  def edit

  end

  def updat

  end

  def destroy

  end


  private
  def address_params
    params.require(:addresses).permit(:customer_id, :name, :address, :postal_code )
  end

end
