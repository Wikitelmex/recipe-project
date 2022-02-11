class FoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    user = current_user
    food = user.foods.new(food_params)
    if food.save
      flash[:notice] = 'Food was successfully created.'
      redirect_to foods_path
    else
      flash[:notice] = food.errors.full_messages
      render :new
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
