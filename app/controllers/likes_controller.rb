class LikesController < ApplicationController

	include ActionView::Helpers::TextHelper

	def create
		@post = Post.find(params[:post_id])
		if @post.likes.find_by(:user_id => current_user.id).nil?
			@like = @post.likes.create(:user_id => current_user.id)
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), link: 
				'Unlike' }
		else
			@post.likes.find_by(:user_id => current_user.id).destroy
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), link: 
				'Like' }
		end
	end

	# def destroy
	# 	@post = Post.find(params[:post_id])
	# 	@like = Like.find(params[:id])
	# 	@like.destroy
	# 	render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), like: 
	# 		"<a class='like-link' data-method='post' data-remote='true' href='/posts/" + @post.id.to_s + "/likes' rel='nofollow'>Like</a>" }
	# end

	#<%= link_to 'Unlike', post_like_path(@post, @post.likes.find_by(:user_id => current_user.id)), method: :delete, remote: true, class: "unlike-link" %>



end
