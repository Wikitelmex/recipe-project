add recipes controler index, show, destroy, new, createclass RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
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
  end

  def create
    @recipe = Recipe.new({
                           name: params[:recipe][:name],
                           user_id: current_user.id,
                           description: params[:recipe][:description],
                           preparation_time: params[:recipe][:preparation_time].to_i,
                           cooking_time: params[:recipe][:cooking_time].to_i,
                           public: params[:recipe][:public]
                         })
    if @recipe.save
      flash[:success] = 'Recipe created'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = 'Could not create recipe'
      render :new
    end
  end
end
