class OrdersController < ApplicationController
	def add_to_cart
		user = current_user
	    
	    item = Item.find(params[:item_id])
	    if item.nil? || item.units == 0
	      render json: { error_message: "This item is not available" }, status: :error
	      return
	    end
	 
		state = State.find_by_order_state("Cart")
	 	order = Order.find_by(user_id: user.id, state_id: state.id)
	    order ||= Order.create!(user_id: user.id, state_id: state.id)

		oi = OrderItem.find_by(order_id: order.id, item_id: item.id, active: 1)
		oi ||= order.order_items.create(item_id: item.id, quantity: 0, active: 1)

        if oi.quantity < item.units
          OrderItem.update(oi.id, quantity: oi.quantity + 1)

          render body: nil, status: :ok
          return
        end

		render body: nil, status: :error
		return
	end
end
