class Item < ApplicationRecord
  WAREHOUSES = Warehouse.where(user: current_user)
  belongs_to :user
  belongs_to :warehouse

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :quantity, presence: true

  validates :description, presence: true

end
