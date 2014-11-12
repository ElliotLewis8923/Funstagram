$(document).ready(function() {

	$('.like-link').on('click', function() {
		var likeCount = $(this).siblings('span');
		var likeLink = $(this).children('span');
		$.post(this.href, function(response) {
			likeCount.text(response.updatedlikesCount);
			likeLink.text(response.link);
		});	
	});

});