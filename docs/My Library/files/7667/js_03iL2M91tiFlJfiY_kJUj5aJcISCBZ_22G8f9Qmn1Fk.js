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
  Drupal.behaviors.firebrand = {
    attach: function (context, settings) {
      var $header = $('.header');

      $header.on('click', '.user-badge-button', function() {
        var $menu = $('.uib-dropdown-menu.dropdown-menu');
        if ($menu.find('span.secondary-nav__close').length === 0) {
          $menu.append('<span class="secondary-nav__close" aria-label="close" role="button" tabindex="0"><span class="element-invisible">Close</span></span>');
          $menu.prepend('<span class="secondary-nav__back-trigger is-fixed" role="button" aria-label="close" tabindex="0"><span class="element-invisible">Back</span></span>');
        }

        toggleDrawer();
      });

      $header.on('click', '.uib-dropdown-menu.dropdown-menu .secondary-nav__close, .uib-dropdown-menu.dropdown-menu .secondary-nav__back-trigger', function() {
        toggleDrawer();
      });

      function toggleDrawer() {
        closeMainNavDrawers();
        $('.uib-dropdown-menu.dropdown-menu').slideToggle('500');
        $('.uib-dropdown-menu.dropdown-menu .secondary-nav__back-trigger').toggleClass('is-fixed');
      }

      function closeMainNavDrawers() {
        // Close any open menu items
        $('#site-search-drawer').removeClass('is-open');
        $('.secondary-nav__drawer').removeClass('is-open');
        $('.primary-nav__item').removeClass('is-open').removeClass('is-hidden');
        $('.secondary-nav__back-trigger').removeClass('is-fixed');
        $('.header__utility-nav').removeClass('is-hidden');
        $('.tertiary-nav-trigger').removeClass('is-active');
        $('.tertiary-nav__list').removeClass('is-open');

        if ($(window).width() >= window.breakpoints.bp_menu) {
          $('.trigger--menu').removeClass('is-open');
          $('.header__drawer-container').removeClass('is-active');
          $('.header__drawer').removeClass('is-active');
        }
      }
    }
  };

})(jQuery, Drupal);
;
