class User < ApplicationRecord
  has_secure_password

  has_many :transactions

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
end
