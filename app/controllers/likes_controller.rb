class LikesController < ApplicationController

	include ActionView::Helpers::TextHelper

	def create
		@post = Post.find(params[:post_id])
		puts @post.likes.count
		if @post.likes.find_by(:user_id => current_user.id).nil?
			@like = @post.likes.create(:user_id => current_user.id).save!
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), link: 
				'Unlike' }
		else
			puts @post.likes.find_by(:user_id => current_user.id)
			@post.likes.find_by(:user_id => current_user.id).destroy
			render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), link: 
				'Like' }
		end
	end

end
