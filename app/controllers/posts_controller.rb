class PostsController < ApplicationController

	layout nil, :only => [:show]

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
		respond_to do |format|
          format.html {render :show}
      end
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

	def edit
		@post = Post.find(params[:id])
		if current_user.id == @post.user_id
			render 'edit'
		else
			redirect_to posts_path
		end
	end

	def update
		@post = Post.find(params[:id])
		@post.update(params[:post].permit(:caption))
		redirect_to posts_path
		flash[:notice] = "Your post has been successfully updated"
	end

end
