class Profile < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :firstname, :lastname, :address, presence: true

end
