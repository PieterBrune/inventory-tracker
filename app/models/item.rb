class Item < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :warehouse

  # For active storage and hosting of images on cloudinary
  has_one_attached :photo

  # Validations
  validates :photo, presence: true

  validates :warehouse_id, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :quantity, presence: true

  validates :description, presence: true

  # `description` has to be between 10 and 100 characters
  validates :description, length: { in: 10..100 }
end
