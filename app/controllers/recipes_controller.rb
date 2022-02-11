class RecipesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).includes(:foods).find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:info] = 'Recipe deleted'
    else
      flash[:error] = 'Could not delete recipe'
    end
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:success] = 'Recipe created'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to recipe_new_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :description, :preparation_time, :cooking_time, :public)
  end
end
