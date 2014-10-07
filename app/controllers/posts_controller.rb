class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:caption, :image))
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.user_id == current_user.id
			@post.destroy
			redirect_to posts_path
			flash[:notice] = "Your post was successfully destroyed"
		else
			redirect_to posts_path
		end
	end

end
