class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :set_user

	def show
	end

	def edit
	end

	def update
		@usuario.update(user_params)
		if @usuario.save
			 redirect_to user_path(current_user.id), notice: 'Usuario actualizado'
		else
			render 'edit'
		end
	end

	def cambiar_clave
		@minimum_password_length = User.password_length.min
	end

	def nueva_clave
		if @usuario.update_with_password(user_params)
			bypass_sign_in(@usuario)
			redirect_to root_path
		else
			render 'cambiar_clave'
		end
	end

	def destroy
		@usuario.destroy if current_user.id == 1
		redirect_to users_url
	end

	private
	def user_params
		params.require(:user).permit(:nombre, :apellido, :username, :password, :password_confirmation, :current_password, :email, :email_anterior, :twitter, :instagram, :facebook, :linea_id)
	end

	def set_user
		@usuario = User.find(params[:id])
	end

end
