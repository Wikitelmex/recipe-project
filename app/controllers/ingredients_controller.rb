class IngredientsController < ApplicationController
  def new
    @ingredients = Food.all.map { |food| [food.name, food.id] }
  end

  def create
    @recipe_food = RecipeFood.new({
      recipe_id: params[:id],
      food_id: params[:recipe_food][:food_id],
      quantity: params[:recipe_food][:quantity].to_f
    })
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
  end
end
