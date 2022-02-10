class IngredientsController < ApplicationController
  def new
    @ingredients = Food.all.map { |food| [food.name, food.id] }
  end

  def index
    @recipe_ingredients = RecipeFood.includes(:food).where(recipe_id: params[:id])
    @ingredients_count = @recipe_ingredients.count
    @ingredients_total = @recipe_ingredients.map { |ingredient| ingredient.quantity * ingredient.food.price }.sum
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
    @recipe_food = RecipeFood.find(params[:ingredient_id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def edit
    @ingredients = Food.all.map { |food| [food.name, food.id] }
    @recipe_food = RecipeFood.find(params[:ingredient_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:ingredient_id])
    # binding.break
    if @recipe_food.update(food_id: params[:recipe_food][:food_id], quantity: params[:recipe_food][:quantity].to_f)
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      render :edit
    end
  end
end
