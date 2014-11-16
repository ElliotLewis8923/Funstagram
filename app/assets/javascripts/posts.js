$('a[data-toggle=modal]').on('click', function() {
  $('.dropdown').removeClass('open');
});

$('a[data-target=#ajax-modal]').on('click', function(e) {
   e.preventDefault();
   e.stopPropagation();
   $('body').modalmanager('loading');
   $.rails.handleRemote( $(this) );
});

$(document).on('click', '[data-dismiss=modal], .modal-scrollable', function() {
  $('.modal-body-content').empty();
});

$(document).on('click', '#ajax-modal', function(e) {
  e.stopPropagation();
});