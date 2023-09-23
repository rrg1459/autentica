class DolarsController < ApplicationController

	include ApplicationHelper
 
	before_action :set_dolar, only: [:show, :edit, :update]

	def index
		@dolars = Dolar.order('created_at DESC')
	end

	def edit
	end

	def update
		@dolar.update(cambio: params[:dolar][:cambio].to_f*100)
		redirect_to edit_dolar_path(@dolar), notice: 'Dolar actualizado'
	end


	private


	def set_dolar
		@dolar = Dolar.last
	end
end
