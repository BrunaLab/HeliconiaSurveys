'use strict';

$(document).ready(function () {

  // initialize foundation
  $(document).foundation();

  // polyfill for IE object-fit issue
  // works along with shared.scss line 7
  objectFitImages();

  // This function allows us to hit "enter"
  // in the sidebar search card
  // and have it direct us to the search page
  // with that query autopopulated
  // and the results for that query loaded
  var searchForm = function () {
    var $searchField = $("input#search-input");
    var $searchForm = $('form#search-form');
    $searchForm.on('submit', function () {
      var theQuery = $searchField.val();
      var searchURL = "search/";
      var queryString = '?q=' + theQuery + '&hPP=10&idx=prod_POSTS_new_fields&p=0&is_v=1';
      var theLocation = window.location.pathname;
      var getRegExForPageType = function getRegExForPageType() {
        if (s.contains(theLocation, "/post/")) {
          return new RegExp(/(post).+/);
        } else if (s.contains(theLocation, "/tags/")) {
          return new RegExp(/(tags).+/);
        } else if (s.contains(theLocation, "/categories/")) {
          return new RegExp(/(categories).+/);
        }
      };

      if (window.location.pathname === "/") {
        window.location.href = "search/" + queryString;
      } else {
        var theRegEx = getRegExForPageType();
        // extra work needs to be done because of the '?'
        // and how it interacts with the starting URL
        // on non-post pages
        window.location.href = decodeURIComponent(theLocation.replace(theRegEx, "search/" + queryString));
      }
      return false;
    });
  }();

  // The Disqus script is added to pages when a user clicks to see the comments
  // We've had problems in the past where always having it available on the page
  // interfered with other scripts
  var disqusCtrl = function disqusCtrl() {
    var disqusScript = '\n      <script>\n      (function() { // DON\'T EDIT BELOW THIS LINE\n      var d = document, s = d.createElement(\'script\');\n\n      s.src = \'//scholasticablog.disqus.com/embed.js\';\n\n      s.setAttribute(\'data-timestamp\', +new Date());\n      (d.head || d.body).appendChild(s);\n      })();\n      </script>\n    ';

    // Loading actual comments on clicking a button
    $('#load-comments').click(function () {
      $('body').append(disqusScript);
      $('#load-comments').slideUp();
      return false;
    });

    // Getting the number of comments on a blog post and displaying it
    // to be ex: "Show Comments (15)"

    var disqusPublicKey = "op06GlSYeIRtfLIve2QqTNJc2qAc27yyOTOj74fvIcZvrAzoojLRNMHsg7yGKuZq";
    var disqusShortname = "scholasticablog";
    var threadUrl = 'link:' + window.location.href;

    $.ajax({
      type: 'GET',
      url: 'https://disqus.com/api/3.0/threads/set.json',
      data: { api_key: disqusPublicKey, forum: disqusShortname, thread: threadUrl },
      cache: false,
      dataType: 'jsonp',
      success: function success(result) {
        if (result.response.length === 1) {
          var btnText = 'Show Comments (' + result.response[0].posts + ')';
          $('a#load-comments').html(btnText);
        }
      }
    });
  };

  // Many posts have images in the body that we want
  // to have captioned. This allows to use the alt
  // tags for those images for their captions
  var captionHandler = function captionHandler() {
    var nonHeroImages = $(".post-content img").not('.the-hero');
    nonHeroImages.each(function (index, item) {
      $(item).wrap('<div class="non-hero-image text-center"></div>');
      $(item).after('\n          <figcaption class="caption">' + $(item).attr('alt') + '</figcaption>\n      ');
    });
  };

  if ($('article#post')) {
    disqusCtrl();
    captionHandler();
  }

  // Newsletter signup forms can only be submitted if the user opts in
  $('input#mc-embedded-subscribe.button').prop("disabled", true);
  $("input#gdpr-active-consent").change(function () {
    if (this.checked) {
      $('input#mc-embedded-subscribe.button').prop("disabled", false);
      $("input#gdpr-active-consent").prop('checked', true);
    } else {
      $('input#mc-embedded-subscribe.button').prop("disabled", true);
      $("input#gdpr-active-consent").prop('checked', false);
    }
  });

  // Validate newsletter signup forum

  $('#mc-embedded-subscribe').click(function () {
    var noInterestsSelected = function noInterestsSelected() {
      return $('.lr-checkbox:checked').length === 0 && $('.sprj-checkbox:checked').length === 0;
    };
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var email = $('#mce-EMAIL').val();

    if (noInterestsSelected()) {
      $('.checkbox-validation-message').removeClass('hidden');
      return false;
    } else {
      $('.checkbox-validation-message').addClass('hidden');
    }

    if (!re.test(email)) {
      $('.email-validation-message').removeClass('hidden');
      return false;
    } else {
      $('.email-validation-message').addClass('hidden');
    }
  });
});