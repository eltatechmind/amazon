class Phone < ApplicationRecord
	belongs_to :user
	VALID_PHONE_REGEX = /\A[0-9]+\z/
	validates :number, length: { minimum: 10, maximum: 10 },format: { with: VALID_PHONE_REGEX }, presence: true, uniqueness: true
end
