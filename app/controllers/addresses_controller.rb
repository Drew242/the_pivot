class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      @address.update_attribute(:user_id, current_user.id)
      redirect_to cart_path
    else
      flash[:error] = "You have missing fields."
      render :new
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:street_address, :state, :city, :zip)
  end

end
