class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end


  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
     @ingredient.update(ingredient_params(:name))
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def create
    @ingredient = Ingredient.new(ingredient_params(:name))

    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end





  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params(*args)
    params.require(:ingredient).permit(*args)
  end


end
