class LikesController < ApplicationController

	include ActionView::Helpers::TextHelper

	def create
		@post = Post.find(params[:post_id])
		if @post.likes.find_by(:user_id => current_user.id).nil?
			@like = @post.likes.create(:user_id => current_user.id)
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), newLink: 
				"<a class='unlike-link' data-method='delete' data-remote='true' href='/posts/" + @post.id.to_s + "/likes/" + @like.id.to_s + "' rel='nofollow'>Unlike</a>" }
		else
			redirect_to post_path(@post)
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@like = Like.find(params[:id])
		@like.destroy
		puts @post.inspect
		puts @like.inspect
		render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), newLink: 
			"<a class='like-link' data-method='post' data-remote='true' href='/posts/" + @post.id.to_s + "/likes' rel='nofollow'>Like</a>" }
	end



end
