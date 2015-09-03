# class AddressesController < ApplicationController
#
#   def new
#     @address = Address.new
#   end
#
#   def create
#     @address = current_user.build_address(address_params)
#     if @address.save
#       redirect_to cart_path
#     else
#       flash[:error] = "You have missing fields."
#       render :new
#     end
#   end
#
#   def show
#     @address = Address.find(params[:id])
#   end
#
#   private
#   def address_params
#     params.require(:address).permit(:street_address, :state, :city, :zip)
#   end
#
# end
