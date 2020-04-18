class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
         has_many :products
validates :first_name, :last_name, :email, presence: true
         validates_each :first_name, :last_name do |record, attr, value|
record.errors.add(attr, 'must contain only letters!') if
value =~ /[^\A[a-zA-Z]+\z]/
end
has_one :profile
         def full_name
         	"#{first_name} #{last_name}"
         end
end
