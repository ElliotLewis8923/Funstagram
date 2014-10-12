// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

var options = {
    "backdrop" : "static"
}




$(document).ready(function(){
           $('.image-link').on('click', function(){
           		$.get(this.href, function(response) {
                	$('#imgModal .modal-body').html(response);
                	$('#imgModal').modal('show')
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
    });
});