class CommentsController < ApplicationController

	include ActionView::Helpers::DateHelper
	include ActionView::Helpers::UrlHelper

	def create
		if user_signed_in?
			@post = Post.find(params[:post_id])
			@comment = @post.comments.create(params[:comment].permit(:text))
			@comment.user_id = current_user.id
			if @comment.save
				render json: { commentText: @comment.text, 
							   commentUser: link_to(@comment.username, user_path(@comment.user)),
							   commentTimestamp: time_ago_in_words(@comment.created_at) }
			end
		else
			redirect_to '/users/sign_in'
		end
	end

end
