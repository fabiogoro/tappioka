class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html
  before_action :set_categories, only: [:show, :index]

  def set_categories
    @cuisines = Cuisine.all
    @types = Type.all
    @preferences = Preference.all
  end
end
