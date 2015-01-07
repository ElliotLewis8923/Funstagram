class LikesController < ApplicationController

	include LikesHelper
	include ActionView::Helpers::TextHelper

	def create
		@post = Post.find(params[:post_id])
		@like = @post.likes.find_by(:user_id => current_user.id)
		if @like.nil?
			@post.likes.create(:user_id => current_user.id).save!
			render_likes('Unlike')
		else
			@like.destroy
			render_likes('Like')
		end
	end
end
