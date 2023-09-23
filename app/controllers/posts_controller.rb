class PostsController < ApplicationController


	include ApplicationHelper
	
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]
 
	def index
		@posts = Post.order('created_at DESC')
	end
 
	def show
	end
 
	def new
		@post = Post.new
	end
 
	def create
		params[:post][:precio] = params[:post][:precio].to_f * 100
		@post = Post.new(post_params)
		@post.save ? (redirect_to posts_path, notice: 'Producto creado') : (render :new)
	end
 
	def edit
	end
 
	def update
		params[:post][:precio] = params[:post][:precio].to_f * 100
		@post.update_attributes(post_params) ? (redirect_to post_path(@post), notice: 'Producto actualizado') : (render :edit)
	end

	def destroy
		@post.destroy ? mensaje = 'Producto borrado' : mensaje = 'No se pudo borrar el producto'
		redirect_to root_url, notice: mensaje
	end

	private
 
	def post_params
		params.require(:post).permit(:title, :body, :precio, :existencia, :publicado, :image, :remove_image)
	end
 
	def set_post
		@post = Post.find(params[:id])
	end
end