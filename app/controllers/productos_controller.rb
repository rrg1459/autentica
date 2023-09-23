class ProductosController < ApplicationController

	include ApplicationHelper
 
	# before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :set_productos, only: [:show]

	def index
		@productos = Post.order('created_at DESC')
	end

	def show
	end
 
	private
	def set_productos
		@producto = Post.find(params[:id])
	end
end