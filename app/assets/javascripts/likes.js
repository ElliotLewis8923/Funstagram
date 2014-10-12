
$(document).ready(function(){

	$('.like-link').on('click', function(event){
		var likeCount = $(this).siblings('span');
		var likeLink = $(this).children('span');
		$.post(this.href, function(response){
			console.log(likeLink);
			likeCount.text(response.updatedlikesCount);
			console.log(response.link)
			likeLink.text(response.link);
		});	
	});

});

// 	$('.like-link').on('click', function(event){
// 		console.log('clicked');
// 		var likeCount = $(this).siblings('span');
// 		var unlikeLink = $(this);
// 		$.post(this.href, function(response){
// 						console.log(response)
// 			likeCount.text(response.updatedlikesCount);
// 			unlikeLink.html(response.like);
// 		});
// 	});
// });