class Warehouse < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :street_address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

  # When a 'Warehouse' is destroyed, its 'items' will also be destroyed
  has_many :items, dependent: :destroy
end
