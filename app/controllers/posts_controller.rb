class PostsController < ApplicationController

	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:caption, :image))
		redirect_to posts_path
	end

end
