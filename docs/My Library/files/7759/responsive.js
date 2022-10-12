(function() {
  $(function() {
    var ipad, responsiveEvents, screen_size;
    ipad = 1180;
    screen_size = window.innerWidth;
    $('.button-with-list').on('click', function(e) {
      var $this;
      $this = $(this);
      $this.toggleClass('show-list');
      return setTimeout(function() {
        return $this.removeClass('show-list');
      }, 5000);
    });
    $('.icon-with-list').on('click', function(e) {
      var $this;
      $this = $(this);
      $this.toggleClass('show-list');
      return setTimeout(function() {
        return $this.removeClass('show-list');
      }, 5000);
    });
    $(document).on('click', '.nav-button', function(e) {
      e.preventDefault();
      return $('.navigation').toggleClass('expand');
    });
    $(document).on('click', '.subnav-toggle.responsive', function(e) {
      var $toggler;
      e.preventDefault();
      $toggler = $(this);
      $toggler.parents('.has-subnav').toggleClass('selected-subnav');
      return $toggler.parents('.has-subnav').children('ul').toggleClass('view-subnav');
    });
    $(document).on('click', '.ipad-toc-button', function(e) {
      e.preventDefault();
      return $('.ipad-toc').toggleClass('show-ipad-toc');
    });
    responsiveEvents = function() {
      console.log(window.innerWidth);
      if (window.innerWidth < ipad) {
        return $('.subnav-toggle').addClass('responsive');
      } else {
        return $('.subnav-toggle').removeClass('responsive');
      }
    };
    $(document).on('ready', responsiveEvents);
    $(window).on('resize', responsiveEvents);
    return $(document).ready(function() {
      return $(".table-wrapper").each((function(_this) {
        return function(index, element) {
          if (parseInt($(element).children('.table-scroll').prop('scrollWidth')) <= parseInt($(element).width())) {
            return $(element).addClass('hide');
          }
        };
      })(this));
    });
  });

}).call(this);
