class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username]
  end

  def authorize_member
    if user_signed_in? && !current_user.admin?
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
