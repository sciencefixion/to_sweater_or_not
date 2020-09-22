class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: { require: true }
  validates_confirmation_of :password
  # validates :api_key, presence: { require: true }, uniqueness: true

  has_secure_password

  before_create :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.uuid
  end
end
