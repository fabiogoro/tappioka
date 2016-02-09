class CuisinesController < ApplicationController
  before_action :set_categories, only: [:show, :index]

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    respond_with @cuisine
  end

  private
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
end
