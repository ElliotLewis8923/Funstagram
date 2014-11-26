$('#ajax-modal').on('submit', '#signedin-modal form', function(e) {
	e.stopPropagation();
	e.preventDefault();
    var form = $('#ajax-modal form');
    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: form.serialize(), 
      success: function(data) {
		$("#ajax-modal ul").append("<li class='list-group-item'><p class='list-group-item-text'>"      
          + data.commentUser + "</p><p class'list-group-item=heading'>"
          + data.commentText + "</p><i class='timestamp'>" 
          + data.commentTimestamp + " ago</i></li>");
    var commentBox = $("#comments-list");
    commentBox.scrollTop(commentBox.prop("scrollHeight"));
    $("#ajax-modal textarea").val(''); }
    });
});