class Phone < ApplicationRecord
	belongs_to :user
	validates :number, length: { minimum: 10, maximum: 10 }
end
