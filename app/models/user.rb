class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :reservations
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..10}
  validates :encrypted_password, presence: true

  has_one_attached :avatar
end
