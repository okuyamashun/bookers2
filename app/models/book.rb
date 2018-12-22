class Book < ApplicationRecord
	
	belongs_to :user
	validates :opinion, length: { minimum: 1 }
	validates :opinion, length: { maximum: 200 }
	validates :title,  presence: true
end
