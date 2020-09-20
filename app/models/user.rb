class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: { require: true }

  has_secure_password
end
