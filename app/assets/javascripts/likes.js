$('#ajax-modal').on('click', '#like-link', function(e) {
	e.stopPropagation();
	e.preventDefault();
	var likeCount = $('section#like-links span');
	var likeLink = $('section#like-links #link-name');
	$.post(this.href, function(res) {
		likeCount.text(res.updatedlikesCount);
		likeLink.html("<a id='like-link' data-method='post' data-remote='true' href='/posts/" 
			+ res.postId 
			+ "/likes' rel='nofollow'>" 
			+ res.link 
			+ "</a>"
		);
	});
});