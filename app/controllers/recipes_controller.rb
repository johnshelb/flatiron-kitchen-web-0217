class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end



  def create
    @recipe = Recipe.new(recipe_params(:name,ingredient_ids:[]))
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params(:name, ingredient_ids:[]))
    if @recipe.valid?
      @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render :edit
    end
  end



  def destroy
    @recipe.find(params[:id])
    @recipe.destroy
  end

  private

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end


end
