class RecipeFoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  # create a new food
end
