class Review < ApplicationRecord
  belongs_to :pool
  belongs_to :user
  validates :content, presence: true
  validates :rating, numericality: true, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
