class Address < ApplicationRecord
	belongs_to :user
	has_many :orders
	validates :address,  presence: true, length: { maximum: 100, minimum: 10 }, allow_nil: true
	validates :city, presence: true, length: { maximum: 50, minimum: 3 }, allow_nil: true
	validates :state_or_province, presence: true, length: { maximum: 50, minimum: 3 }, allow_nil: true
end
