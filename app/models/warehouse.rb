class Warehouse < ApplicationRecord
  # Associations
  belongs_to :user

  # For active storage and hosting of images on cloudinary
  has_one_attached :photo

  # Validations
  validates :photo, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :street_address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

  # When a 'Warehouse' is destroyed, its 'items' will also be destroyed
  has_many :items, dependent: :destroy
end
