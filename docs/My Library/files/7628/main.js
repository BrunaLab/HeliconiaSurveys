/**
 * main.js v1
 * Created by Ben Gillbanks <https://prothemedesign.com/>
 * Available under GPL2 license
 *
 * @package Carmack
 */
/* global site_settings */

; ( function( $ ) {

	// js mobile detection
	var is_touch_device = function() {

		return ( ( 'ontouchstart' in window ) || ( navigator.MaxTouchPoints > 0 ) || ( navigator.msMaxTouchPoints > 0 ) );

	};


	// smooth scroll to #anchor
	var scroll_to_hash = function( e ) {

		var $target = $( e.hash );

		if ( $target.length ) {
			var targetOffset = $target.offset().top - parseInt( $( 'html' ).css( 'margin-top' ) );
			$( 'html,body' ).animate( { scrollTop: targetOffset }, 750 );
			focus_element( e.hash );
		}

		return false;

	};

	// set an elements focus
	// if required sets a tabindex for elements that can't normally be focused
	var focus_element = function( id ) {

		var element = document.getElementById( id.replace( '#', '' ) );

		if ( element ) {

			if ( !( /^(?:a|select|input|button|textarea)$/i.test( element.tagName ) ) ) {
				element.tabIndex = -1;
			}

			element.focus();
		}

	};

	// do all the stuffs
	$( document ).ready( function() {

		// Set default heights for social media widgets

		// Twitter
		$( 'a.twitter-timeline' ).each(
			function() {

				var thisHeight = $( this ).attr( 'height' );
				$( this ).parent().css( 'min-height', thisHeight + 'px' );

			}
		);

		// Facebook
		$( '.fb-page' ).each( function() {

			var $set_height = $( this ).data( 'height' );
			var $show_facepile = $( this ).data( 'show-facepile' );
			var $show_posts = $( this ).data( 'show-posts' ); // AKA stream
			var $min_height = $set_height; // set the default 'min-height'

			// These values are defaults from the FB widget.
			var $no_posts_no_faces = 130;
			var $no_posts = 220;

			if ( $show_posts ) {

				// Showing posts; may also be showing faces and/or cover - the latter doesn't affect the height at all.
				$min_height = $set_height;

			} else if ( $show_facepile ) {

				// Showing facepile with or without cover image - both would be same height.
				// If the user selected height is lower than the no_posts height, we'll use that instead
				$min_height = ( $set_height < $no_posts ) ? $set_height : $no_posts;

			} else {

				// Either just showing cover, or nothing is selected (both are same height).
				// If the user selected height is lower than the no_posts_no_faces height, we'll use that instead
				$min_height = ( $set_height < $no_posts_no_faces ) ? $set_height : $no_posts_no_faces;

			}

			// apply min-height to .fb-page container
			$( this ).css( 'min-height', $min_height + 'px' );

		} );

		// close overlay menu
		$( 'button.close-overlay' ).on(
			'click',
			function( e ) {

				e.preventDefault();

				$( 'body' ).removeClass( 'display-overlay' );
				$this = $( this );

				$( '.open-overlay' ).attr( 'aria-expanded', 'false' );
				$( '.close-overlay' ).attr( 'aria-expanded', 'false' );
				$( '.menu-overlay' ).attr( 'aria-expanded', 'false' );

				$( '.open-overlay' ).focus();

			}
		);

		// open overlay menu
		$( 'button.open-overlay' ).on(
			'click',
			function( e ) {

				e.preventDefault();

				setTimeout(
					function() {

						// Remove any media elements currently initialised.
						$( '.sidebar-overlay .mejs-container' ).each(
							function( i, el ) {
								if ( mejs.players[ el.id ] ) {
									mejs.players[ el.id ].remove();
								}
							}
						);

						// Initialize overlay.
						if ( window.wp && window.wp.mediaelement ) {
							window.wp.mediaelement.initialize();
						}

						// Trigger window resize event to fix video size issues.
						// Don't use jqueries trigger event since that only triggers
						// methods hooked to events, and not the events themselves.
						if ( typeof ( Event ) === 'function' ) {
							window.dispatchEvent( new Event( 'resize' ) );
						} else {
							var event = window.document.createEvent( 'UIEvents' );
							event.initUIEvent( 'resize', true, false, window, 0 );
							window.dispatchEvent( event );
						}

					},
					250
				);

				$( 'body' ).addClass( 'display-overlay' );
				$this = $( this );

				$( '.open-overlay' ).attr( 'aria-expanded', 'true' );
				$( '.close-overlay' ).attr( 'aria-expanded', 'true' );
				$( '.menu-overlay' ).attr( 'aria-expanded', 'true' );

				$( '.close-overlay' ).focus();

			}
		);

		// loop overlay navigation when we tab off of the last focusable element.
		var focusables = 'a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]';

		var last_focusable = $( '.menu-overlay' ).find( focusables ).last();

		last_focusable.on(
			'keydown',
			function( e ) {

				if ( e.keyCode === 9 ) {
					if ( !e.shiftKey ) {
						e.preventDefault();
						$( '.close-overlay' ).focus();
					}
				}

			}
		);

		// attachment page navigation
		if ( $( 'body' ).hasClass( 'attachment' ) ) {

			$( document ).keydown( function( e ) {

				if ( $( 'textarea, input' ).is( ':focus' ) ) {
					return;
				}

				var url = false;

				switch ( e.which ) {

					// left arrow key (previous attachment)
					case 37:
						url = $( '.image-previous a' ).attr( 'href' );
						break;

					// right arrow key (next attachment)
					case 39:
						url = $( '.image-next a' ).attr( 'href' );
						break;

				}

				if ( url.length ) {
					window.location = url;
				}

			} );

		}

		// masonry layout
		$( window ).load(
			function() {

				if ( $.isFunction( $.fn.masonry ) ) {

					var $footer_widgets = null;

					// footer widgets
					$( 'footer#footer .footer-widgets .container' ).imagesLoaded(
						function() {

							$footer_widgets = $( 'footer#footer .footer-widgets .container' ).masonry(
								{
									itemSelector: '.widget',
									gutter: 0,
									isOriginLeft: !$( 'body' ).is( '.rtl' ),
									percentPosition: true
								}
							);

							setTimeout(
								function() {
									$footer_widgets.masonry( 'layout' );
								},
								2000
							);

						}
					);

					// Reflow Footer Widgets if changed in the Customizer.
					if ( 'undefined' !== typeof wp && wp.customize && wp.customize.selectiveRefresh ) {

						wp.customize.selectiveRefresh.bind(
							'sidebar-updated',
							function( sidebarPartial ) {
								if ( 'sidebar-2' === sidebarPartial.sidebarId ) {
									$footer_widgets.masonry( 'reloadItems' );
									$footer_widgets.masonry( 'layout' );
								}
							}
						);

					}

					// testimonials
					$( 'body.archive .testimonials' ).imagesLoaded(
						function() {

							$( 'body.archive .testimonials' ).masonry(
								{
									itemSelector: '.testimonial',
									gutter: 0,
									isOriginLeft: !$( 'body' ).is( '.rtl' ),
									percentPosition: true
								}
							);

						}
					);

				}

			} );

		// featured content slides
		if ( $.isFunction( $.fn.elementalSlides ) ) {

			$( '.showcase' ).elementalSlides(
				{
					interval: 7000,
					autoplay: parseInt( site_settings.slider_autoplay )
				}
			);

		}

		// set menu items with submenus to aria-haspopup="true".
		$( '.menu-item-has-children' ).each(
			function() {

				$( this ).attr( 'aria-haspopup', 'true' );

			}
		);

		// Dropdown menu touch screen improvements.
		// Only performed on touch devices.
		if ( is_touch_device() ) {

			// If a dropdown menu is tapped on a touch device then focus the menu.
			$( '.menu-item-has-children > a' ).on(
				'touchstart',
				function( e ) {

					// Hide any visible menus.
					$( '.menu li' ).removeClass( 'focus' );

					var $parent = $( this ).parent( 'li' );

					/**
					 * If the parent is not focused then cancel the click.
					 * This prevents the page from changing before children can
					 * be seen and selected.
					 * If you click a link again then the link will be followed.
					 */
					if ( !$parent.hasClass( 'focus' ) && !$( '.menu' ).hasClass( 'menu-on' ) ) {
						e.preventDefault();
					}

					$parent.toggleClass( 'focus' );

				}
			);

			// If you tap on the page body then the page will remove focus from all menu items.
			$( 'body' ).on(
				'touchstart',
				function( e ) {
					if ( !$( e.target ).closest( '.menu li' ).length ) {
						$( '.menu li' ).removeClass( 'focus' );
					}
				}
			);

		}

		// Smooth scroll to element.
		$( '.scroll-to' ).click(
			function() {

				return scroll_to_hash( this );

			}
		);

		// mobile device detection
		$( 'body' ).addClass( is_touch_device() ? 'device-touch' : 'device-click' );

		// wrap select boxes.
		$( 'select' ).wrap( '<div class="form-select"></div>' );
		// unwrap select boxes in category widgets.
		$( '.widget.widget_categories select' ).unwrap().addClass( 'form-select' );

		// add author icon to comment author titles
		var user_icon = $( '.user-icon-container' ).html();
		$( '.bypostauthor > article .fn' ).append( user_icon );

		// Sticky Header
		if ( !is_touch_device() ) {

			var update_scroll = true;

			$( window ).scroll(
				function() {
					update_scroll = true;
				}
			);

			// Use an interval so that the browser doesn't get thrashed
			setInterval( function() {

				// only update the visibility if the browser has scrolled
				if ( update_scroll ) {

					var scroll_position = $( window ).scrollTop();

					if ( scroll_position > 500 ) {

						$( 'body' ).addClass( 'sticky-scroll' );

					} else {

						$( 'body' ).removeClass( 'sticky-scroll' );

					}

				}

				update_scroll = false;

			}, 200 );

		}

		// skip link fix
		// based on https://github.com/Automattic/_s/blob/master/js/skip-link-focus-fix.js

		var isWebkit = navigator.userAgent.toLowerCase().indexOf( 'webkit' ) > -1,
			isOpera = navigator.userAgent.toLowerCase().indexOf( 'opera' ) > -1,
			isIe = navigator.userAgent.toLowerCase().indexOf( 'msie' ) > -1;

		if ( ( isWebkit || isOpera || isIe ) && document.getElementById && window.addEventListener ) {
			window.addEventListener( 'hashchange', function() {

				var id = location.hash.substring( 1 );

				if ( !( /^[A-z0-9_-]+$/.test( id ) ) ) {
					return;
				}

				focus_element( id );

			}, false );
		}

	} );

} )( jQuery );
