class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  has_many :messages, dependent: :destroy
end
