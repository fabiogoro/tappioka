class TypesController < ApplicationController
  before_action :set_categories, only: [:show, :index]
  before_action :check_admin, only: [:create, :new]

  def show
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.create(type_params)
    respond_with @type
  end

  private
    def type_params
      params.require(:type).permit(:name)
    end
end
