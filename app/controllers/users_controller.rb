class UsersController < ApplicationController
  before_action :set_categories, only: [:show]

  def show
    @user = User.find(params[:id])
  end
end
