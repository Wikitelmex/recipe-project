class Food < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :measurement_unit, presence: true
  validates :price, presence: true
  
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
