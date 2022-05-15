class Warehouse < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :street_address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end
