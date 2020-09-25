class User < ApplicationRecord
    has_secure_password
    has_many :bags
    has_many :cymbals, through: :bags
    validates :email, presence: true
end
