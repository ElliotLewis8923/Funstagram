
$(document).ready(function(){

	$('.like-link').on('click', function(event){
		var likeCount = $(this).siblings('span');
		var likeLink = $(this);
		$.post(this.href, function(response){
			likeCount.text(response.updatedlikesCount);
			likeLink.html(response.unlike);
		});	
	});

	$('.unlike-link').on('click', function(event){
		console.log('clicked');
		var likeCount = $(this).siblings('span');
		var unlikeLink = $(this);
		$.post(this.href, function(response){
			likeCount.text(response.updatedlikesCount);
			unlikeLink.text(response.like);
		});
	});
});