/**
 * @file
 * A JavaScript file for the site with globally used scripts.
 *
 * Our JavaScript must be wrapped in a closure.
 * @see https://drupal.org/node/1446420
 * @see http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth
 *
 * @copyright Copyright 2016 Palantir.net
 */

(function ($) {

  Drupal.behaviors.breakpoints = {
    attach: function (context, settings) {
      // Define breakpoints on the global window object so we can use them later.
      // This way we keep our breakpoints more defined.
      window.breakpoints = {
        bp0: '350',
        bp1: '750',
        bp_menu: '970',
        bp2: '1280',
        bp3: '1400'
      }
    }
  };

  Drupal.behaviors.fonts = {
    attach: function (context, settings) {
      // Attach the necessary Fonts.com script.
      var MTIProjectId='b903912d-8081-45c4-a001-2a5e1e12a9b5';
    }
  };

  Drupal.behaviors.header = {
    attach: function (context, settings) {
      // If we reuse any selectors, store them into variables to avoid accessing the
      // DOM multiple times.
      var $primaryNavItem = $('.primary-nav__item');
      var $headerDrawerContainer = $('.header__drawer-container');
      var $secondaryNavBack = $('.secondary-nav__back-trigger');
      var $secondaryNavClose = $('.secondary-nav__close');

      // Location in main navigation
      $('.location-slider').slick({
        infinite: true,
        dots: false,
        arrows: true
      });

      // Toggle menu from hamburger
      $('.trigger--menu').click(function(event) {
        if ($(window).width() < window.breakpoints.bp_menu) {
          // Set trigger with is-open class
          $(this).toggleClass('is-open');
          // Remove focus on trigger
          $(this).blur();
          // prevent link from reloading page
          event.preventDefault();

          // set header drawer to is-active (mobile)
          $('.header__drawer').toggleClass('is-active');

          if ($headerDrawerContainer.hasClass('is-active')) {
            setTimeout(function () {
              $headerDrawerContainer.removeClass('is-active');
            }, 500);
          } else {
            $headerDrawerContainer.addClass('is-active');
          }

          // remove is-open classes from any nav items when you click on this to reset the menu
          $('.secondary-nav__drawer').removeClass('is-open');
          $primaryNavItem.removeClass('is-open');
          $secondaryNavBack.removeClass('is-fixed');
          $('.header__utility-nav').removeClass('is-hidden');
          $primaryNavItem.removeClass('is-hidden');
          $('.tertiary-nav-trigger').removeClass('is-active');
          $('.tertiary-nav__list').removeClass('is-open');
          $('#site-search-drawer').removeClass('is-open');

          // Close the Firebrand menu if it exists.
          $('.uib-dropdown-menu.dropdown-menu').hide();
        }
      });

      // on click of a primary nav item, toggle it's child drawer
      $('.primary-nav__trigger').click(function(event) {
        event.preventDefault();
        $(this).blur();


        $(this).parents('.primary-nav__item.has-children').toggleClass('is-open');
        $(this).siblings('.secondary-nav__drawer').toggleClass('is-open');

        // remove the openings from the sibling items & search
        $(this).parents('.primary-nav__item').siblings('.primary-nav__item').removeClass('is-open');
        $(this).parents('.primary-nav__item').siblings('.primary-nav__item').children('.secondary-nav__drawer').removeClass('is-open');
        $('#site-search-drawer').removeClass('is-open');

        // Close the Firebrand menu if it exists.
        $('.uib-dropdown-menu.dropdown-menu').hide();

        if ($(window).width() < window.breakpoints.bp_menu) {
          // at mobile, add an is-hidden class to the other primary nav items
          $(this).parents('.primary-nav__item').siblings('.primary-nav__item').toggleClass('is-hidden');
          // and to the utility nav
          $('.header__utility-nav').toggleClass('is-hidden');

          // Resize any slick sliders in the drawer when the drawers open
          $(this).siblings('.secondary-nav__drawer').find('.slick-slider').slick('setPosition');
          $(this).siblings('.secondary-nav__drawer').children('.secondary-nav__back-trigger').toggleClass('is-fixed');
        }
      });

      // when clicking the x, close the drawer and allow for a keypress close
      $secondaryNavClose.keypress(function(e) {
        var key = e.which;
        if (key == 13)  // the enter key code
        {
          $(this).click();
          return false;
        }
      });

      $secondaryNavClose.on('click', function(event) {
        $(this).parents('.secondary-nav__drawer').removeClass('is-open');
        $(this).parents().parents('.primary-nav__item').removeClass('is-open');
      });

      // use the back trigger to close the secondary menu when it is opened
      // and only when the menu is mobile version
      // when clicking the x, close the drawer and allow for a keypress close
      $secondaryNavBack.keypress(function(e) {
        var key = e.which;
        if (key == 13)  // the enter key code
        {
          $(this).click();
          return false;
        }
      });

      $secondaryNavBack.on('click', function(event) {
        if ($(window).width() < window.breakpoints.bp_menu) {
          $(this).parents('.secondary-nav__drawer').removeClass('is-open');
          $(this).parents().parents('.primary-nav__item').removeClass('is-open');
          $(this).removeClass('is-fixed');
          $('.header__utility-nav').removeClass('is-hidden');
          $primaryNavItem.removeClass('is-hidden');
          $('.tertiary-nav-trigger').removeClass('is-active');
          $('.tertiary-nav__list').removeClass('is-open');
        }
      });

      // on click of a secondary nav arrow, toggle it's child drawer
      $('.tertiary-nav-trigger').click(function(event) {

        if ($(window).width() < 750) {
          event.preventDefault();
          $(this).blur();
          // add active class to this
          $(this).toggleClass('is-active');
          // add open class to it's child
          $(this).siblings('.tertiary-nav__list').toggleClass('is-open');
        }
      });
    }
  };

  Drupal.behaviors.search = {
    attach: function (context, settings) {
      // Search Triggers
      $('.trigger--search').click(function(event) {
        $(this).blur();
        event.preventDefault();
        var $searchDrawer = $('#site-search-drawer');

        $searchDrawer.toggleClass('is-open');

        // Close any open menu items
        $('.secondary-nav__drawer').removeClass('is-open');
        $('.primary-nav__item').removeClass('is-open').removeClass('is-hidden');
        $('.secondary-nav__back-trigger').removeClass('is-fixed');
        $('.header__utility-nav').removeClass('is-hidden');
        $('.tertiary-nav-trigger').removeClass('is-active');
        $('.tertiary-nav__list').removeClass('is-open');
        $('.header__drawer-container').removeClass('is-active');
        $('.header__drawer').removeClass('is-active');
        $('.trigger--menu').removeClass('is-open');

        // Close the Firebrand menu if it exists.
        $('.uib-dropdown-menu.dropdown-menu').hide();
      });

      if ($('#site-search-drawer').length > 0) {
        var transitionEnd = transitionEndEventName();
        $('#site-search-drawer').get(0).addEventListener(transitionEnd, function (e) {
          if ($(e.target).attr('id') == 'site-search-drawer') {
            if ($('#site-search-drawer').hasClass('is-open')) {
              $('#site-search').focus();
            } else {
              var $searchTrigger = $('.trigger--search');
              $searchTrigger.focus();
              $searchTrigger.blur();
            }
          }
        }, false);
      }
      
      /**
       * Allows us to detect when CSS transitions have finished
       */
      function transitionEndEventName () {
        var i,
            undefined,
            el = document.createElement('div'),
            transitions = {
              'transition':'transitionend',
              'OTransition':'otransitionend',  // oTransitionEnd in very old Opera
              'MozTransition':'transitionend',
              'WebkitTransition':'webkitTransitionEnd'
            };

        for (i in transitions) {
          if (transitions.hasOwnProperty(i) && el.style[i] !== undefined) {
            return transitions[i];
          }
        }
      }

      // on click of the x in search, close search.
      var $searchClose = $('.search__close');

      $searchClose.keypress(function(e) {
        var key = e.which;
        // the enter key code
        if(key == 13) {
          $(this).click();
          return false;
        }
      });

      $searchClose.on('click', function(event) {
        event.preventDefault();
        $(this).blur();
        $(this).parents('#site-search-drawer').removeClass('is-open');
      });
    }
  };


  Drupal.behaviors.footer = {
    attach: function (context, settings) {
      // Toggle footer menus at mobile
      $('.footer-list--trigger').click(function(event) {
        if ($(window).width() < window.breakpoints.bp1) {
          $(this).toggleClass('is-active');
          $(this).blur();
          event.preventDefault();
          $(this).parents('.footer__title').next('.footer__sub').toggleClass('is-open');
        }
      });
    }
  };

  Drupal.behaviors.modal = {
    attach: function (context, settings) {
      // Modal behaviors
      // Need to add exit by ESC key and make the rest of the page unfocusable when open
      // Also should add a close when user clicks overlay
      // on click of the x in modal, close the modal
      $('.modal__close').click(function(event) {
        event.preventDefault();
        $(this).blur();
        $(this).parents('.modal').removeClass('is-open');
        event.stopPropagation();
      });

      // Also close the modal on ESC key press.
      $(document).keyup(function(e) {
        var key = e.which;
        // the ESC key code
        if (key == 27) {
          $('.modal').each(function() {
            if ($(this).hasClass('is-open')) {
              modalClose($(this));
              return false;
            }
          });
          return false;
        }
      });

      // Close the modal when clicked out side of.
      $('.modal').click(function(e) {
        if ($(e.target).hasClass('modal')) {
          modalClose($(this));
        }
      });
      /**
       * Close the modal on escape or clicking outside of modal window.
       */
      function modalClose(object) {
        object.blur();
        object.removeClass('is-open');
      }
    }
  };

})(jQuery, Drupal);
;
/**
 * @file
 * A JavaScript file for the site, specifically for the match height plugin.
 *
 * Our JavaScript must be wrapped in a closure.
 * @see https://drupal.org/node/1446420
 * @see http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth
 *
 * @copyright Copyright 2016 Palantir.net
 */
(function ($) {
  Drupal.behaviors.match_height = {
    attach: function (context, settings) {
      // Match Height Scripts
      runMatchHeight();

      $(document).ready(function() {
        runMatchHeight();
      });

      $(window).resize(function() {
        runMatchHeight();
      });

      function runMatchHeight() {
        // Match Height Scripts
        $('.matchheight').matchHeight();
        // Match height ordering for small teasers
        $('.sm-teaser__title').matchHeight();
        $('.sm-teaser__img-link').matchHeight();
        $('.sm-teaser').matchHeight();
        // matchheight ordering for podcast teaser
        $('.podcast-mh').matchHeight();
        $('.podcast-teaser').matchHeight();

        // matchheight for multistep forms
        $('.form--multistep input').matchHeight();
        $('.form--multistep .form-row--half').matchHeight();

        if ($(window).width() > window.breakpoints.bp1) {
          $('.matchheight-desktop').matchHeight({
            byRow: false
          });
        };

        if ($(window).width() < window.breakpoints.bp1) {
          $('.matchheight-mobile').matchHeight({
            byRow: false
          });
        }
      }
    }
  };

  Drupal.behaviors.match_height_search = {
    attach: function (context, settings) {
      // Match height for the search results page
      $('.sm-teaser__title').matchHeight();
      $('.sm-teaser__title').matchHeight();

      // Match the filter labels, too
      $('.checkbox-wrapper label').matchHeight()
    }
  };
})(jQuery, Drupal);
;
/**
 * @file
 * A JavaScript file for the wishlist related scripts.
 */
(function ($, Drupal, drupalSettings) {
    'use strict';
    Drupal.behaviors.commerce_cart_form = {
        attach: function (context, settings) {
            if(!!window.performance && window.performance.navigation.type === 2) {
                jQuery(".loader").show();
                window.location.reload();
            }
            // code to change the text of flag for cart page
            $('.save_for_later_link').each(function () {
                if ($(this).find('a').text() == 'Add to wishlist') {
                    $(this).find('a').text('Save for later');
                }
            });
            // code to remove item when item flagged from cart
            $('.save_for_later_link').click(function (event) {
                var text = $(this).find('a').text();
                var href = $(this).find('a').attr('href');
                if (text != 'Remove from wishlist') {
                    event.preventDefault();
                    $.ajax({
                        url: "/MIT-Press-updated/cartflaggeditem",
                        data: {flag_url: href},
                        success: function (result) {
                            window.location.href = href;
                        }
                    });
                }
            });
              // code to add more giftee info fields on cart page
            $(document).on('click', '.giftee-add-mores', function (e) {
                var data_print = 1;
                var current = 0;
                var userEmail = drupalSettings.mitpress_theme.userEmail.email;
                $('.gift__book_section').find('.error_help').remove();
                $('.gift__book_section').find('.form-text').removeClass('error_help');
                $('.gift__book_section').find('.form-text').removeClass('bor_red');
                var id = $(this).attr('fieldsetid');
                var div_id = $(this).closest('div.giftee-info-fieldset').attr('id');
                var count_fields = $("#" + div_id + " .fieldset-wrapper").length;
                var filters = [];
                var found = [];
                $('.gift__book_section #' + div_id + ' input').each(function () {
                    var values = this.value;
                    var name = $(this).attr('name');
                    if (values.length === 0) {
                        var b = name.split('][');
                        var giftee_name = name;
                        var giftee_email = name.replace('giftee_name', 'giftee_email');
                        var confirm_email = name.replace('giftee_name', 'confirm_email');
                        $("input[name='" + giftee_name + "']").addClass('bor_red').delay(10000).queue(function () {
                            $(this).removeClass("bor_red").dequeue();
                        });
                        $("input[name='" + giftee_email + "']").addClass('bor_red').delay(10000).queue(function () {
                            $(this).removeClass("bor_red").dequeue();
                        });
                        $("input[name='" + confirm_email + "']").addClass('bor_red').delay(10000).queue(function () {
                            $(this).removeClass("bor_red").dequeue();
                        });
                        if (current == 0) {
                            $("input[name='" + giftee_email + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">Please fill giftee information details.</div>');
                            setTimeout(function () {
                                $('.error_help').remove();
                            }, 10000);
                        }
                        current++;
                        data_print = 2;
                    } else if (name.indexOf("confirm_email") >= 0) {
                        var b = name.split('][');
                        var giftee_email_name = name.replace('confirm_email', 'giftee_email');
                        var confirm_email_name = name;
                        var email = $("input[name='" + giftee_email_name + "']").val().toLowerCase();
                        var confirm_email = $("input[name='" + confirm_email_name + "']").val().toLowerCase();
                        if (typeof email !== 'undefined' && email.length > 0) {
                            found = $.inArray(email, filters);
                            if (found >= 0) {
                                $("input[name='" + giftee_email_name + "']").addClass('bor_red').delay(10000).queue(function () {
                                    $(this).removeClass("bor_red").dequeue();
                                });
                                $("input[name='" + confirm_email_name + "']").addClass('bor_red').delay(10000).queue(function () {
                                    $(this).removeClass("bor_red").dequeue();
                                });
                                if (current == 0) {
                                    $("input[name='" + giftee_email_name + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">You should not enter the same Giftee Email Address again</div>');
                                    setTimeout(function () {
                                        $('.error_help').remove();
                                    }, 10000);
                                }
                                current++;
                                data_print = 2;
                            } else {
                                filters.push(email);
                            }
                        }
                    }
                    var fieldset_length = $("#" + div_id + " .fieldset-wrapper").length;
                    console.log('fieldset_length', fieldset_length);
                    if (fieldset_length > 1) {
                        $("#" + div_id + " fieldset.giftee-info-fieldset").each(function () {
                            var values = $(this).attr('id');
                            $("#" + values + " input").each(function () {
                                var input_values = $(this).attr('name');
                                if (input_values.indexOf("confirm_email") >= 0) {
                                    var confirm_email = $("fieldset.giftee-info-fieldset input[name='" + input_values + "'").val().toLowerCase();
                                    var email_id = input_values.replace("confirm_email", "giftee_email");
                                    var email = $("fieldset.giftee-info-fieldset input[name='" + email_id + "'").val().toLowerCase();
                                }
                                if (typeof email !== 'undefined') {
                                    var name = $(this).attr('name');
                                    var b = name.split('][');
                                    var giftee_name1 = name;
                                    var giftee_email1 = name.replace('giftee_name', 'giftee_email');
                                    var confirm_email1 = name.replace('giftee_name', 'confirm_email');
                                    if (isEmail(email) || isEmail(confirm_email)) {
                                        if (email !== confirm_email) {
                                            $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                $(this).removeClass("bor_red").dequeue();
                                            });
                                            $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                $(this).removeClass("bor_red").dequeue();
                                            });
                                            if (current == 0) {
                                                $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">Giftee e-mail address does not match Giftee confirmation email address.</div>');
                                                setTimeout(function () {
                                                    $('.error_help').remove();
                                                }, 10000);
                                            }
                                            current++;
                                            data_print = 2;
                                        }
                                        if (userEmail.length > 0) {
                                            if (userEmail === email) {
                                                $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                    $(this).removeClass("bor_red").dequeue();
                                                });
                                                $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                    $(this).removeClass("bor_red").dequeue();
                                                });
                                                if (current == 0) {
                                                    $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">You should not gift an ebook to yourself.</div>');
                                                    setTimeout(function () {
                                                        $('.error_help').remove();
                                                    }, 10000);
                                                }
                                                current++;
                                                data_print = 2;
                                            }
                                        }
                                    }
                                    if (!isEmail(email) || !isEmail(confirm_email)) {
                                        $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        if (current == 0) {
                                            // $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red"> Please enter valid e-mail address. </div>');
                                            // setTimeout(function () {
                                            //     $('.error_help').remove();
                                            // }, 10000);
                                        }
                                        current++;
                                        data_print = 2;
                                    }
                                }
                            });
                        });
                    } else {
                        $(".fieldset-wrapper input").each(function () {
                            var input_values = $(this).attr('name');
                            if (input_values.indexOf("confirm_email") >= 0) {
                                var confirm_email = $("fieldset.giftee-info-fieldset input[name='" + input_values + "'").val().toLowerCase();
                                var email_id = input_values.replace("confirm_email", "giftee_email");
                                var email = $("fieldset.giftee-info-fieldset input[name='" + email_id + "'").val().toLowerCase();
                            }
                            if (typeof email !== 'undefined') {
                                var name = $(this).attr('name');
                                var b = name.split('][');
                                var giftee_name1 = name;
                                var giftee_email1 = name.replace('giftee_name', 'giftee_email');
                                var confirm_email1 = name.replace('giftee_name', 'confirm_email');
                                if (isEmail(email) || isEmail(confirm_email)) {
                                    if (email !== confirm_email) {
                                        $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        if (current == 0) {
                                            $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">Giftee e-mail address does not match Giftee confirmation email address.</div>');
                                            setTimeout(function () {
                                                $('.error_help').remove();
                                            }, 10000);
                                        }
                                        current++;
                                        data_print = 2;
                                    }
                                }
                                if (email.length > 0) {
                                    if (!isEmail(email) || !isEmail(confirm_email)) {
                                        $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                            $(this).removeClass("bor_red").dequeue();
                                        });
                                        if (current == 0) {
                                            // $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">Please enter valid e-mail address -- .</div>');
                                            // setTimeout(function () {
                                            //     $('.error_help').remove();
                                            // }, 10000);
                                        }
                                        current++;
                                        data_print = 2;
                                    }
                                    if (userEmail.length > 0) {
                                        if (userEmail === email) {
                                            $("input[name='" + giftee_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                $(this).removeClass("bor_red").dequeue();
                                            });
                                            $("input[name='" + confirm_email1 + "']").addClass('bor_red').delay(10000).queue(function () {
                                                $(this).removeClass("bor_red").dequeue();
                                            });
                                            if (current == 0) {
                                                $("input[name='" + giftee_email1 + "']").closest(".fieldset-wrapper").append('<div class="error_help" style="color:red">You should not gift an ebook to yourself.</div>');
                                                setTimeout(function () {
                                                    $('.error_help').remove();
                                                }, 10000);
                                            }
                                            current++;
                                            data_print = 2;
                                        }
                                    }
                                }
                            }
                        });
                    }
                });
                if (data_print === 2) {
                    e.preventDefault();
                    e.preventDefault();
                    data_print = 1;
                } else if (data_print === 1) {
                    if (count_fields < 10) {
                        var id = $(this).attr('fieldsetid');
                        var div_id = $(this).closest('div.giftee-info-fieldset').attr('id');
                        var counter = $('#' + id).attr('counter');
                        var num = parseInt(counter) + 1;
                        var attr = $('#' + id).find('.fieldset-wrapper').attr('id');
                        if (typeof attr == 'undefined') {
                            $('#' + id).find('.fieldset-wrapper').attr('id', 'fieldset-wrapper-' + counter);
                        }
                        $('#' + div_id + ' .giftee-info-fieldset').last().clone().appendTo('#' + div_id);
                        $('#' + id).attr('counter', num);
                        $('#' + div_id + ' .giftee-info-fieldset').last().find('input').each(function () {
                            var fieldset_id = $('#' + div_id + ' .giftee-info-fieldset').last().attr('id').slice(0, -1);
                            var new_field_set_id = fieldset_id + count_fields;
                            var field_name = $(this).attr('name');
                            var new_field_name = field_name.slice(0, -2) + 10 + ']';
                            $(this).attr('name', new_field_name);
                            $('#' + div_id + ' .giftee-info-fieldset').last().attr('id', new_field_set_id);
                            $(this).val('');
                        });
                        $(this).removeClass('giftee-add-more');
                        $(this).addClass('giftee-delete-fieldwrapper');
                        $(this).text('-');
                        // code to increase quantity if one giftee info added
                        var a = id.split('-');
                        var input_id = 'edit-edit-quantity-' + a[3];
                        $('input#' + input_id).val(parseInt(count_fields) + 1);
                        $('input#' + input_id).attr('max', parseInt(count_fields) + 1);
                        $(".giftee-info-fieldset .fieldset-wrapper > span").last().removeClass('giftee-delete-fieldwrapper');
                        $(".giftee-info-fieldset .fieldset-wrapper > span").last().addClass('giftee-add-more');
                        $(".giftee-info-fieldset .fieldset-wrapper > span").last().text('+');
                        $(".giftee-info-fieldset .fieldset-wrapper .col-xs-12 > span").last().removeClass('giftee-delete-fieldwrapper');
                        $(".giftee-info-fieldset .fieldset-wrapper .col-xs-12 > span").last().addClass('giftee-add-more');
                        $(".giftee-info-fieldset .fieldset-wrapper .col-xs-12 > span").last().text('+');
                    }
                }
            });
            // code to delete giftee info fields on cart page
            $(document).on('click', '.giftee-delete-fieldwrapper', function () {
                $('.gift__book_section').find('.form-text').removeClass("bor_red");
                var id = $(this).attr('fieldsetid');
                $(this).closest('.giftee-info-fieldset').remove();
                // code to decrease quantity if one giftee info deleted
                var a = id.split('-');
                var input_id = 'edit-edit-quantity-' + a[3];
                var editqtyid = $('input#' + input_id).val();
                $('input#' + input_id).val(parseInt(editqtyid) - 1);
                $('input#' + input_id).attr('max', parseInt(editqtyid) - 1);
            });
            // code to download order invoice
            $('.details-pdf').click(function () {
                var pdf = new jsPDF("l", "mm", "a4");
                var options = {
                    pagesplit: true
                };
                pdf.addHTML($("#print-area"), options, function () {
                    pdf.save("details.pdf");
                });
            });
            $(document.body).find('div.storedebookinfo').each(function () {
                var ebookinfo = $(this).text();
                var giftebookid = $(this).attr('giftebookid');
                var fieldsetid = $(this).attr('fieldsetid');
                if (ebookinfo == 1) {
                    $('input#' + giftebookid).prop('checked', true);
                    $('#' + fieldsetid).css('display', 'block');
                }
            });
            function isEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }
            var bbr = $('#bbr').val();
            if (bbr === 'yes') {
                location.reload(true);
            } else {
                $('#bbr').val('yes');
            }
        }
    };
 // code to disable quantity default increment functionality for ebook
        /*    if ($('form').length) {
                var idstr = $('form').attr('id');
                if (idstr.match("^views-form-commerce-cart-form-")) {
                    $('#' + idstr).find('tr.Ebook').each(function () {
                        $(this).find('.views-field-edit-quantity input').attr('max', 1);
                    });
                }
            } */
})(jQuery, Drupal, drupalSettings);;
/**
 * @file
 * Search autocomplete.
 */

(function($, Drupal) {

  var ajaxPath = 'search_api_autocomplete/search_api_views_mitpress_search/title';
  var formSelector = '.search-box';
  var inputSelector = '.search-input';
  var resultWrapperSelector = '.predictive-search';
  var timeout = null;

  // TODO:
  // Autocompletes for the moment seems to be also one of the reasons a lot of search queries are being executed
  // against SOLR and increasing or usage. The following code is commented in order to deactivate autocomplete.
  // After some time decide if we should revise this and confirm with client if they want this feature back in
  // and the best way to do it without impacting the number of queries being run.
  /*
  Drupal.behaviors.mitPressSearchAutocomplete = {
    attach: function (context, settings) {

      return;
      $(formSelector, context).each(function () {
        initAutocomplete(this, settings);
      });
    }
  };
  */

  /**
   * Initialize the search autocomplete.
   */
  function initAutocomplete(el, settings) {
    var input = $(inputSelector, el).first();

    $(input).on('keyup', function (event) {
      if (event.which === 13 || event.which === 32)  {
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (timeout) {
        clearTimeout(timeout);
      }
      timeout = setTimeout(function () {
        keypressCallback(el, settings);
      }, 300);
    });
  }

  /**
   * Timeout for handling keypress.
   */
  function keypressCallback(el, settings) {
    var input = $(inputSelector, el).first();
    var value = input.val();

    if (!value) {
      hideSuggestions(el);
      return;
    }

    // Do AJAX.
    var url = settings.path.baseUrl + ajaxPath;
    showThrobber(el);
    $.ajax(url, {
      data: {q: input.val().toLowerCase()},
      error: function () {
        hideSuggestions(el);
      },
      success: function (data) {
        showSuggestions(el, data);
      }
    });

    /**
     * Hides the autocomplete suggestions.
     */
    function hideSuggestions(el) {
      $(resultWrapperSelector, el).hide();
    }

    /**
     * Shows the autocomplete suggestions.
     */
    function showSuggestions(el, suggestions) {
      var results = $(resultWrapperSelector, el);
      var html = '';

      for (k in suggestions) {
        html += '<li>' + suggestions[k].value + '</li>';
      }

      if (html) {
        results.html(html).show();
        $('li', results).click(function () {
          var input = $(inputSelector, el).first();
          input.val($(this).text());
          hideSuggestions(el);
        });
      }
      else {
        results.html(html).hide();
      }
    }

    /**
     * Shows the throbber in the autocomplete suggestions.
     */
    function showThrobber(el) {
      var results = $(resultWrapperSelector, el);
      results.html('<li><div class="ajax-progress ajax-progress-throbber"><div class="throbber">&nbsp;</div></div></li>');
      results.show();
    }
  }

})(jQuery, Drupal);
;
