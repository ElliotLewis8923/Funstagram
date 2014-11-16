$('#ajax-modal').on('click', 'a', function(e) {
	e.stopPropagation();
	e.preventDefault();
	var likeCount = $('section#like-links span');
	var likeLink = $('section#like-links #link-name');
	$.post(this.href, function(res) {
		console.log('blah');
		likeCount.text(res.updatedlikesCount);
		console.log(res.link);
		likeLink.html("<a class='like-link' data-method='post' data-remote='true' href='/posts/" + res.postId + "/likes' rel='nofollow'>" + res.link + "</a>");
	});
});