class State < ApplicationRecord
	has_many :orders, dependent: :destroy
	def to_s
     self.order_state
  	end
end
