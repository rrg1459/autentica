class ApplicationController < ActionController::Base

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :ver_dolar

protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,           keys: [:nombre, :apellido, :email, :email_anterior, :username, :password])
		devise_parameter_sanitizer.permit(:sign_in,           keys: [:login, :username, :tos])
		devise_parameter_sanitizer.permit(:accept_invitation, keys: [:nombre, :apellido, :username, :password, :password_confirmation])
	end

	def ver_dolar
		$dolar = Dolar.last.cambio.to_f / 100
	end

private

end


