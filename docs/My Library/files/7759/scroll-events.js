(function() {
  $(function() {
    $('.scroll-link').on('click', function(e) {
      e.preventDefault();
      if ($(this).data('scroll') && $($(this).data('scroll')).length > 0) {
            var target = $($(this).data('scroll'));
            $('html, body').stop().animate(
                {
                    scrollTop: target.offset().top-100
                },
                1000
            );
        }
    });
    $('.scroll-top-waypoint').waypoint(function(direction) {
      var $parent;
      if (direction === 'down') {
        $('.article-top-nav').addClass('fixed');
        $('.app-container').addClass('no-jank-padding');
        $('.article-minor-block', '.minor-floating-block').addClass('fixed');
        return $parent = $("app-container").eq(0);
      } else {
        $('.article-top-nav').removeClass('fixed');
        $('.app-container').removeClass('no-jank-padding');
        return $('.article-minor-block', '.minor-floating-block').removeClass('fixed');
      }
    });
    return $('.about-top-waypoint').waypoint(function(direction) {
      var $parent;
      if (direction === 'down') {
        $('.minor-floating-block').addClass('fixed');
        return $parent = $("app-container").eq(0);
      } else {
        return $('.minor-floating-block').removeClass('fixed');
      }
    });
  });

}).call(this);
