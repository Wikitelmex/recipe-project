class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }

  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end
