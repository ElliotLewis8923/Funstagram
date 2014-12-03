module LikesHelper
	def render_likes(string)
		render json: { updatedlikesCount: pluralize(@post.likes.count, 'like'), 
					   postId: params[:post_id], 
					   link: string }
	end
end
