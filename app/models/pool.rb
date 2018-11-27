class Pool < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :address, :description, :capacity, :price, presence: true
end
