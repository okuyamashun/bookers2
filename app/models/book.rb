class Book < ApplicationRecord
	
	belongs_to :user
	validates :opinion,  presence: true
	validates :opinion, length: { minimum: 1 }
	validates :opinion, length: { maximum: 200 }
	validates :title,  presence: true
	validates :title, length: { minimum: 1 }
	validates :title, length: { maximum: 200 }
end
