class Item < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse

  has_one_attached :photo
  validates :photo, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :quantity, presence: true

  validates :description, presence: true

  # `description` has to be between 10 and 50 characters
  validates :description, length: { in: 10..50 }
end
