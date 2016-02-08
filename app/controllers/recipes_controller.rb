class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @types = Type.all
    @preferences = Preference.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name,
                                     :cuisine_id,
                                     :type_id,
                                     :preference_id,
                                     :ingredients,
                                     :servings,
                                     :directions,
                                     :ready_in,
                                     :difficulty,
                                     :photo,
                                     :photo_cache)
    end
end
