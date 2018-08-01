class Item < ApplicationRecord
	belongs_to :category
	has_many :photos, dependent: :destroy
	has_many :order_items, dependent: :destroy
end
