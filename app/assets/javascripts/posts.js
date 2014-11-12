var options = {
    "backdrop" : "static"
}

$(document).ready(function() {

	$('.image-link').on('click', function() {
		var route = this.href
		$.get(this.href, function(response) {
			console.log(route);
			$('#imgModal .modal-body').html(response);
			$('#imgModal').modal('show');
		});  
    });

	  $('#imgModal').submit(function(event) {
	 	console.log('hi')  
	    var form = $('#imgModal form');
	    $.ajax({
	      type: form.attr('method'),
	      url: form.attr('action') + '/',
	      data: form.serialize(), 
	      success: function(data) {
			$("#imgModal #comments-list").append("<li><div id='comment-text'>" + data.commentText + "</div><div id='comment-user'>" + data.commentUser + "</div></li>");
			    var commentBox = $("#comments-list");
			    commentBox.scrollTop(commentBox.prop("scrollHeight"));
			    $("textarea").val('');    	
		}});
	});
});