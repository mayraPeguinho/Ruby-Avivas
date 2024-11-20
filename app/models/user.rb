class User < ApplicationRecord
  belongs_to :role
  has_secure_password

  validates :alias, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :role, presence: true
end
