class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods

  has_many :recipes
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
end
