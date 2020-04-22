class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
before_save { self.email = email.downcase }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

         has_many :products
validates :first_name, :last_name, :email, presence: true
         validates_each :first_name, :last_name do |record, attr, value|
record.errors.add(attr, 'must contain only letters!') if
value =~ /[^\A[a-zA-Z]+\z]/
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                end
has_one :profile
         def full_name
         	"#{first_name} #{last_name}"
         end
end
