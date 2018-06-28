class UsersController < ApplicationController
  before_action :logged_in_user, only: [ :cart, :index, :edit, :update, :show, :destroy]
  before_action :correct_user,   only: [ :edit, :update, :show, :destroy]

  def addorder
    user = current_user
    state = State.where(order_state: "Cart").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id).first
    if order.nil?
      render body: nil, status: :error
      return
    else
      oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1", order.id)
      if oi.nil?
        render body: nil, status: :error
        return
      else
        state2 = State.where(order_state: "Order").first
        order.state_id = state2.id
        order.save
        render body: nil, status: :ok
        return
      end  
    end
  end



  def addcart
    #byebug
    user = current_user
    state = State.where(order_state: "Cart").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id).first
    item = Item.find(params[:item_id])
    if item.nil? || item.units == 0
      render body: nil, status: :error
      return
    end
 
 
    if order.nil?
      order = Order.create!(user_id: user.id, state_id: state.id)
      order.order_items.create(order_id: order.id, item_id: item.id, quantity: 1, active: 1)
    else
      oi = OrderItem.where("order_items.order_id = ? AND order_items.item_id = ? AND order_items.active = 1", order.id, item.id).first
      if !oi.nil?
      oi[:quantity] += 1
      oi.save
      else
      orderitem = order.order_items.create(order_id: order.id, item_id: item.id, quantity: 1, active: 1)
      end
    end
    render body: nil, status: :ok
  end 

  def removecart
    user = current_user
    state = State.where(order_state: "Cart").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id).first
    item = Item.find(params[:item_id])
    if item.nil? || order.nil?
      render body: nil, status: :error
      return
    end
    oi = OrderItem.where("order_items.order_id = ? AND order_items.item_id = ? AND order_items.active = 1", order.id, item.id).first
    if oi.nil?
      render body: nil, status: :error
      return
    end
    oi.active = 0
    oi.save
    render body: nil, status: :ok
  end




  def tempo
  end

  def cart
    user = current_user
    state = State.where(order_state: "Cart").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id ).first
    if !order.nil?
      @oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1",order.id)
    else
      @oi = nil
    end

  end

  def order
    user = current_user
    state = State.where(order_state: "Order").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id ).first
    if !order.nil?
      @oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1",order.id)
    else
      @oi = nil
    end
  end

  def index
    @user = current_user
    @categories = Category.all

    #@user = @current_user
    #@categories = Category.all
    #@items = Item.all
    #@photos = Photo.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :gender, :birthday)
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

  # Confirms the correct user.
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

end

