class Product < ApplicationRecord
	has_one_attached :photo
	has_many :bill_items
  belongs_to :user
 scope :latest, -> { order created_at: :desc } 

 def self.search(search)
 	if search
 		where(["name LIKE ?","%#{search}%"])
 	else
 		all
 	end
 end
end



