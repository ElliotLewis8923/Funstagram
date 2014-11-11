class CommentsController < ApplicationController

	# def new
	# 	@post = Post.find(params[:post_id])
	# 	@comment = Comment.new
	# end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:text))
		@comment.user_id = current_user.id
		if @comment.save
			render json: { commentText: @comment.text, commentUser: @comment.username }
		end
	end

end
