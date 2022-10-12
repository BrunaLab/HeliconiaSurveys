(function($) {
  $(document).ready(function() {
    $('.button').on('click', function() {
      $('.target').slideToggle();
    });
  });
})(jQuery);

function cxsRefreshed() {
  jQuery('.button').on('click', function() {
    jQuery('.target').slideToggle();
  });
}
