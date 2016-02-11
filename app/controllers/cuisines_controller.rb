class CuisinesController < ApplicationController
  before_action :set_categories, only: [:show, :index]
  before_action :check_admin, only: [:create, :new]

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
    if @cuisine.users.exists?(current_user.id)
      like_destroy
    else
      like_create
    end
  end

  private
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end

    def like_destroy
      @cuisine.users.delete(current_user)
      @cuisine.save
      redirect_to cuisines_path, notice: t(:succefully_remove_cuisine)
    end

    def like_create
      @cuisine.users << current_user
      @cuisine.save
      redirect_to cuisines_path, notice: t(:succefully_add_cuisine)
    end
end
