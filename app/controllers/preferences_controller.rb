class PreferencesController < ApplicationController
  before_action :set_categories, only: [:show, :index]
  before_action :check_admin, only: [:create, :new]

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(preference_params)
    respond_with @preference
  end

  private
    def preference_params
      params.require(:preference).permit(:name)
    end
end
