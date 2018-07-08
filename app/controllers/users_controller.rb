class UsersController < ApplicationController
  before_action :logged_in_user, only: [ :cart, :edit, :update, :show, :destroy
    , :order, :cart, :cancelled, :completed, :cancelorder, :removecart, :addcart, :addorder]
  before_action :correct_user,   only: [ :edit, :update, :show, :destroy]


# display user's Cancelled Orders
  def cancelled
    user = current_user
    state = State.where(order_state: "Order_cancelled").first
    @order = Order.where("orders.user_id = ? AND orders.state_id = ? ", user.id, state.id )
    @order = @order.order('updated_at DESC')
  end
# display user's completed Orders
  def completed
    user = current_user
    state = State.where(order_state: "Order_completed").first
    @order = Order.where("orders.user_id = ? AND orders.state_id = ? ", user.id, state.id )
    @order = @order.order('updated_at DESC')
  end
# cancel one of user orders by pressing on a button using jquery and ajax requests
  def cancelorder
    user = current_user
    state2 = State.where(order_state: "Order_cancelled").first
    order = Order.find(params[:id])
    if !order.nil? && order.user_id == user.id
      oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1", order.id)
      if !oi.nil?
        totalprice = 0
        oi.each do |order_item|
          item = Item.where("items.id = ?", order_item.item_id).first
          totalprice = totalprice + (item.price * order_item.quantity)
          item.units = item.units + order_item.quantity
          item.save
        end
        user.balance = user.balance + totalprice
        user.save
        order.state_id = state2.id
        order.save
        render body: nil, status: :ok
        return
      else
        render body: nil, status: :error
        return
      end

    else
      render body: nil, status: :error
      return
    end
  end

# get the address using button jquery & ajax request, then change the cart into an order and add the address to it
  def addorder
    user = current_user
    address = Address.find(params[:id])
    state = State.where(order_state: "Cart").first
    order = Order.where("orders.user_id = ? AND orders.state_id = ?", user.id, state.id).first
    if order.nil? || address.nil? || address.user_id != user.id
      render body: nil, status: :error
      return
    else
      oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1", order.id)
      totalprice = 0
      oi.each do |order_item|
        totalprice = totalprice + (order_item.item.price* order_item.quantity)
        item = Item.where("items.id = ?", order_item.item_id).first
        if order_item.quantity > item.units
          render body: nil, status: :error
          return
        end
      end
      if oi.nil? || totalprice > user.balance
        render body: nil, status: :error
        return
      else
        oi.each do |order_item|
          item = Item.where("items.id = ?", order_item.item_id).first
          item.units = item.units - order_item.quantity
          item.save
        end  
        user.balance = user.balance - totalprice
        user.save
        state2 = State.where(order_state: "Order").first
        order.state_id = state2.id
        order.address_id = address.id
        order.save
        render body: nil, status: :ok
        return
      end  
    end
  end

# add an item to a cart when press on a button using jquery and ajax request

  def addcart
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

# remove an item from a cart when pressing on a button using jquery and ajax request

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
 
# display cart items on page cart 

  def cart
    @user = current_user
    state = State.where(order_state: "Cart").first
    @order = Order.where("orders.user_id = ? AND orders.state_id = ?", @user.id, state.id ).first
    if !@order.nil?
      @oi = OrderItem.where("order_items.order_id = ? AND order_items.active = 1",@order.id)
    else
      @oi = nil
    end

  end

# display order items on page order

  def order
    user = current_user
    state = State.where(order_state: "Order").first
    @order = Order.where("orders.user_id = ? AND orders.state_id = ? ", user.id, state.id )
    @order = @order.order('created_at DESC')
  end

# display products with their categories on page categories

  def index
    @user = current_user
    @categories = Category.all
  end

# display the user logged in profile, with their info, addresses, balance, etc

  def show
    @user = User.find(params[:id])
    @address = @user.addresses.where("addresses.user_id= ?", @user.id)
  end

# a page for registering a new user
  
  def new
  	@user = User.new
  end

# create a new user

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

# a page for editing user info

  def edit
    @user = User.find(params[:id])
  end

# update user's info

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

# a destroy function (needed to be revised and secured)

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

# allow those to be edited via params sent in requests

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

