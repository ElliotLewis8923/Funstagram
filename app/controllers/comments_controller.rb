class CommentsController < ApplicationController

	def create
		if user_signed_in?
			@post = Post.find(params[:post_id])
			@comment = @post.comments.create(params[:comment].permit(:text))
			@comment.user_id = current_user.id
			if @comment.save
				render json: { commentText: @comment.text, commentUser: @comment.username }
			end
		else
			redirect_to '/users/sign_in'
		end
	end

end
