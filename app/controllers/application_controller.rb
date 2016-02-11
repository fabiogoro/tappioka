class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_categories
    @cuisines = Cuisine.all
    @types = Type.all
    @preferences = Preference.all
  end

  private
    def configure_permitted_parameters
      configure_sign_up
      configure_update
    end

    def configure_sign_up
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :city
      devise_parameter_sanitizer.for(:sign_up) << :facebook
      devise_parameter_sanitizer.for(:sign_up) << :twitter
    end

    def configure_update
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :city
      devise_parameter_sanitizer.for(:account_update) << :facebook
      devise_parameter_sanitizer.for(:account_update) << :twitter
    end

    def check_admin
      unless current_user && current_user.is_admin?
        redirect_to root_path, alert: t(:not_admin)
      end
    end
end
