class LikesController < ApplicationController

	include ActionView::Helpers::TextHelper

	def create
		@post = Post.find(params[:post_id])
		if @post.likes.find_by(:user_id => current_user.id).nil?
			@post.likes.create(:user_id => current_user.id).save!
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), 
					    postId: params[:post_id], link: 'Unlike' }
		else
			@post.likes.find_by(:user_id => current_user.id).destroy
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), 
					    postId: params[:post_id], link: 'Like' }
		end
	end

end
