class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit,
                                            :update, :favourite,
                                            :destroy, :mail]
  before_action :set_categories, only: [:show, :index, :new, :edit,
                                        :update, :create, :favourite, :destroy]

  def show
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def index
    @recipes = Recipe.order(created_at: :desc).limit(20)
    @favourites = Recipe.order_by_favourites.first(20)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    respond_with @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
    unless @recipe.user == current_user
      redirect_to root_path, alert: t(:cant_edit)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.update(recipe_params)
      respond_with @recipe
    else
      redirect_to root_path, alert: t(:cant_edit)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.delete
      redirect_to root_path, notice: t(:succefully_removed_recipe)
    else
      redirect_to @recipe, notice: t(:unsuccefully_removed_recipe)
    end
  end

  def favourite
    @recipe = Recipe.find(params[:id])
    if @recipe.fans.exists?(current_user.id)
      favourite_destroy
    else
      favourite_create
    end
  end

  def mail
    @recipe = Recipe.find(params[:id])
    @email = params[:email]
    @user = current_user
    RecipeMailer.recipe_email(@recipe, @user, @email).deliver_now
    redirect_to @recipe, notice: t(:sent)
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name,
                                     :cuisine_id, :type_id,
                                     :preference_id, :ingredients,
                                     :servings, :directions,
                                     :ready_in, :difficulty,
                                     :photo, :photo_cache)
    end

    def favourite_destroy
      @recipe.fans.delete(current_user)
      @recipe.save
      redirect_to @recipe, notice: t(:succefully_remove_favorite)
    end

    def favourite_create
      @recipe.fans << current_user
      @recipe.save
      redirect_to @recipe, notice: t(:succefully_add_favorite)
    end
end
