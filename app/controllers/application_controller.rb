class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) } 
	end


  protect_from_forgery with: :exception
end
