(function() {
  $(function() {
    $(document).on('click', '#dyslexia-mode', function(e) {
      e.preventDefault();
      $('#dyslexia-mode').toggleClass('active');
      return $('.app-container').toggleClass('dyslexia-mode');
    });
    $(document).on('click', '#text-smaller', function(e) {
      e.preventDefault();
      return $('.major-article-block').css('font-size', '-=1px');
    });
    $(document).on('click', '#text-larger', function(e) {
      e.preventDefault();
      return $('.major-article-block').css('font-size', '+=1px');
    });
    $(document).on('click', '.author-hover', function(e) {
      e.preventDefault();
      return $(this).parents('.author-block').toggleClass('show-author');
    });
    $(document).on('click', '.hide-author', function(e) {
      e.preventDefault();
      return $(this).parents('.author-block').removeClass('show-author');
    });
    $(document).on('click', '.expand-stats', function(e) {
      e.preventDefault();
      return $('.hidden-stats').toggleClass('show-stats');
    });
    $(document).on('click', '#open-author-modal', function(e) {
      e.preventDefault();
      $('#add-author-modal').addClass('show');
      return $('body').addClass('lock-scroll');
    });
    $(document).on('click', '.modal-close', function(e) {
      e.preventDefault();
      $('#add-author-modal').removeClass('show');
      return $('body').removeClass('lock-scroll');
    });
    $(document).on('click', '.expand-content', function(e) {
      e.preventDefault();
      $('.in').removeClass('in');
      $('.expand-content').html('Learn More <i class="fa fa-angle-down"></i>');
      $(this).html('Learn More <i class="fa fa-angle-up"></i>');
      $(this).parents('.expanding-about').children('.content-hide-xl').toggleClass('show');
      return $('html, body').animate({
        scrollTop: $(this).offset().top + (-100)
      }, 2000);
    });
    $(document).on('click', '.close-content', function(e) {
      e.preventDefault();
      console.log('closing...');
      $('.in').removeClass('in');
      return $('.expand-content').html('Learn More <i class="fa fa-angle-down"></i>');
    });
    $(document).on('change', '#login-modal', function(e) {
      if ($('#login-modal').is(':checked')) {
        return $('body').addClass('lock-scroll');
      } else {
        return $('body').removeClass('lock-scroll');
      }
    });
    $(document).on('change', '.has-funding input[type="radio"]', function(e) {
      if ($('#yes').is(':checked')) {
        $("#funding-yes").addClass('show');
        $("#funding-no").removeClass('show');
      }
      if ($('#no').is(':checked')) {
        $("#funding-yes").removeClass('show');
        return $("#funding-no").addClass('show');
      }
    });
    $(document).on('change', '.has-competing input[type="radio"]', function(e) {
      if ($('#yes-compete').is(':checked')) {
        $("#comp-yes").addClass('show');
        $("#comp-no").removeClass('show');
      }
      if ($('#no-compete').is(':checked')) {
        $("#comp-yes").removeClass('show');
        return $("#comp-no").addClass('show');
      }
    });
    $(document).on('change', '.review-preference input[type="radio"]', function(e) {
      if ($('#yes-review-preference').is(':checked')) {
        $("#recommend_reviewers").addClass('show');
        $("#exclude_reviewers").addClass('show');
      }
      if ($('#no-review-preference').is(':checked')) {
        $("#recommend_reviewers").removeClass('show');
        return $("#exclude_reviewers").removeClass('show');
      }
    });
    return $('.wysiwig-area').jqte();
  });

}).call(this);
