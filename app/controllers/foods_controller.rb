class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  # create a new food
  def new
    @food = Food.new
  end

  # create a new food
  def create
    # Add flash message for all the errors
    user = User.first
    food = user.foods.new(food_params)
    if food.save
      flash[:notice] = 'Food was successfully created.'
      redirect_to foods_path
    else
      puts food.errors.full_messages
      flash[:notice] = food.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
