class Player < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password

  has_many :matches, dependent: :destroy
end
