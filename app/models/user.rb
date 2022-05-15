class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # When a 'User' is destroyed, its 'items' and 'warehouses' will also be destroyed
  has_many :items, dependent: :destroy
  has_many :warehouses, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :company, presence: true
end
