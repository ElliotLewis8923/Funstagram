$('#ajax-modal').on('click', '#like-link', function(e) {
	e.stopPropagation();
	e.preventDefault();
	var likeCount = $('section#like-links span');
	var likeLink = $('#link-name');
	$.post(this.href, function(res) {
		console.log(res.link);
		likeCount.text(res.updatedlikesCount);
		likeLink.html("<a id='like-link' data-method='post' data-remote='true' class='btn btn-default' href='/posts/" 
			+ res.postId 
			+ "/likes' rel='nofollow'>" 
			+ res.link 
			+ "</a>"
		);
	});
});