class ApplicationController < ActionController::Base
	include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
  	user_path(current_user)
	end


protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) } 
	end


  protect_from_forgery with: :exception
end
