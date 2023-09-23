class SessionsController < ApplicationController

	def create
		begin
			@user = User.from_omniauth(request.env['omniauth.auth'])
			session[:user_id] = @user.id
			flash[:success] = "Welcome, #{@user.name}!"
		rescue
		 flash[:warning] = "There was an error while trying to authenticate you..."
		end
		redirect_to root_path
	end

	def googleAuth
		rando                     = (rand*1000000).to_i
		access_token              = request.env["omniauth.auth"]
		user                      = User.from_omniauth(access_token)
		user.apellido             = user.nombre
		user.password             = "p#{rando}" if user.username.blank?
		user.username             = "u#{rando}" if user.username.blank?
		user.confirmed_at         = Time.now
		user.google_token         = access_token.credentials.token
		refresh_token             = access_token.credentials.refresh_token
		user.google_refresh_token = refresh_token if refresh_token.present?
		user.save
		sign_in(user)
		redirect_to root_path
	end
end