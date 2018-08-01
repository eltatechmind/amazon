class Order < ApplicationRecord
	belongs_to :state
	belongs_to :address
	belongs_to :user
	has_many :order_items, dependent: :destroy
    def to_s
     self.id
  	end
end
