class AddressesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :delete, :choose]
  before_action :correct_address,   only: [ :edit, :update, :delete]

  def new
    @user = current_user
    @address = @user.addresses.new
  end

  def create
    @user = current_user
    @address = @user.addresses.new(address_params)
    if @address.save
      flash[:success] = "Address Added Successfully"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end


  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      flash[:success] = "Address edited"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def choose
    @user = current_user
    @address = @user.addresses.all
  end


  def delete
    @address = Address.find(params[:id])
    if !@address.nil?
      @address.destroy
      render body: nil, status: :ok
    else
      render body: nil, status: :error
    end
  end



  private

  

  def address_params
      params.require(:address).permit(:user_id, :address, :city, :state_or_province, :contry)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the address belongs to the current user.
  def correct_address
      @user = current_user
      @address = Address.find(params[:id])
      redirect_to(root_url) unless @address.user_id == @user.id
  end


end
