class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:caption, :image))
		@post.user_id = current_user.id
		@post.save!
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@user = User.find(@post.user_id)
		respond_to do |format|
        	format.html { redirect_to root_path }
        	format.js { render :template => 'posts/show.js.erb' }
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
		flash[:notice] = "Your post was successfully updated"
	end

end
