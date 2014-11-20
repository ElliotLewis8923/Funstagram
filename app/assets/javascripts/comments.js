$('#ajax-modal').on('submit', 'form', function(e) {
	e.stopPropagation();
	e.preventDefault();
    var form = $('#ajax-modal form');
    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: form.serialize(), 
      success: function(data) {
		$("#ajax-modal ul").append("<li class='list-group-item'><div id='comment-text'>" 
          + data.commentText + "</div><div id='comment-user>" 
          + data.commentUser + "</div></li>");
		    var commentBox = $("#comments-list");
		    commentBox.scrollTop(commentBox.prop("scrollHeight"));
		    $("#ajax-modal textarea").val(''); }
    });
});