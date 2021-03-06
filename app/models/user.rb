class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :pools, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings_as_owner, through: :pools, source: :bookings
  has_many :messages
end
