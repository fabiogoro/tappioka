class CuisinesController < ApplicationController
  before_action :set_categories, only: [:show, :index]

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    respond_with @cuisine
  end

  def like
    @cuisine = Cuisine.find(params[:id])
    unless @cuisine.users.exists?(current_user.id)
      @cuisine.users << current_user
      @cuisine.save
      redirect_to cuisines_path, notice: t(:succefully_add_cuisine)
    else
      @cuisine.users.delete(current_user)
      @cuisine.save
      redirect_to cuisines_path, notice: t(:succefully_remove_cuisine)
    end
  end

  private
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
end
