
$(document).ready(function(){

	$('.like-link').on('click', function(event){
		var likeCount = $(this).siblings('span');
		var links = $(this).siblings('.like-links');
		$.post(this.href, function(response){
			likeCount.text(response.updatedlikesCount);
			console.log(response.updatedlikesCount);
			console.log('.likes');
		});	
	});
});