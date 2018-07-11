class PhonesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :delete]
  before_action :correct_phone,   only: [ :edit, :update, :delete]

  def new
    @user = current_user
    @phone = @user.phones.new
  end

  def create
    @user = current_user
    @phone = @user.phones.new(phone_params)
    if @phone.save
      flash[:success] = "Phone Number Added Successfully"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])
    if @phone.update_attributes(phone_params)
      flash[:success] = "Phone edited"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def delete
    @phone = Phone.find(params[:id])
    if !@phone.nil?
      @phone.destroy
      render body: nil, status: :ok
    else
      render body: nil, status: :error
    end
  end





  private

  def phone_params
      params.require(:phone).permit(:user_id, :number)
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

  # Confirms the phone belongs to the current user.
  def correct_phone
      @user = current_user
      @phone = Phone.find(params[:id])
      redirect_to(root_url) unless @phone.user_id == @user.id
  end




end
