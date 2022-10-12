(function() {
  $(function() {
    $(document).on('click', '#latest', function(e) {
      e.preventDefault();
      $('.tabs').removeClass('active');
      $(this).addClass('active');
      $('.toggle-lists').removeClass('visible');
      return $('#latest-block').addClass('visible');
    });
    $(document).on('click', '#popular', function(e) {
      e.preventDefault();
      $('.tabs').removeClass('active');
      $(this).addClass('active');
      $('.toggle-lists').removeClass('visible');
      return $('#popular-block').addClass('visible');
    });
    $(document).on('click', '#toc', function(e) {
      e.preventDefault();
      $('.tabs').removeClass('active');
      $(this).addClass('active');
      $('.toggle-lists').removeClass('visible');
      return $('#toc-list').addClass('visible');
    });
    return $(document).on('click', '#discussion, #comment-link', function(e) {
      e.preventDefault();
      $('.tabs').removeClass('active');
      $('#discussion, #comment-link').addClass('active');
      $('.toggle-lists').removeClass('visible');
      return $('#discussion-list').addClass('visible');
    });
  });

}).call(this);
