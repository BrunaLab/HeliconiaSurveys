(function( $ ) {

	/**
	 * Single Post Promo
	 */

	// var single_post_promo_editor = function( panel, model, view ) {
	// 	var $panel = panel.$el;
	// 	// Do stuff
	// };


	/**
	 * Post Archive
	 */

	var post_archive_form = (function() {

		var init = function( $widget ) { // $widget is the jQuery wrapper element automatically passed from the elementorFrontend hook
			// Exit if there are no instances of the post archive, or more than one
			if ($('.post-archive').length === 0 || $('.post-archive').length > 1) {
				console.log("Error: Incorrect number of 'post-archive' instances found.");
				return false;
			}

		  // Watch for form submissions
		  $widget.find('form.post-archive__controls').on('submit', function(e) {
		  	e.preventDefault();
		  	submit_form($(this));
		  });
		};

		var submit_form = function( $form ) {
			// Setup URL for submission
			var url = window.location.origin + window.location.pathname;

			// Get values from each input, pass to an array
			var vars = [];
			$form.find('.post-archive__control-container input, .post-archive__control-container select').each(function() {
				if ($(this).val() !== '') {
					vars.push({
						name: $(this).attr('data-name'),
						val: $(this).val()
					});
				}
			});

			// Append vars to the URL
			for (var i=0; i<vars.length; i++) {
				if (i === 0) {
					url += '?'
				} else {
					url += '&'
				}
				url += vars[i].name + '=' + vars[i].val;
			}

			url += '#posts';

			// Navigate to the URL (PHP handles the rest of the query)
			window.location.href = url;
		};

		return {
		  init: init,
		}
	})();

	var post_archive_load_more = (function() { // Powers the 'load more' button on post archives

		// Global vars
	  var requestURLBase = ''; // URL base for requests, fetched from the button
	  var posts = []; // Array to hold individual posts to render, posts fetched from WP REST API
	  var categories = []; // Array to hold categories, categories fetched from WP REST API

	  //
	  //  Initialization / termination
	  //
	  var init = function( $widget ) { // $widget is the jQuery wrapper element automatically passed from the elementorFrontend hook
	    // Only run if there is a load more button present on the page
	    if ($widget.find('a.post-archive__load-more').length === 0) {
	      return false;
	    }

	    // Get categories right off the bat
	    ajaxGetCategories($widget.find('a.post-archive__load-more'), $widget);

	    $widget.find('a.post-archive__load-more').click(function() {
	      ajaxListPosts($(this), $widget);
	    });
	  };

	  var finish = function($button, $widget) {
	    // Add new post IDs to the $button's exclude attribute so we don't fetch them again in the future
	    let excludePosts = $button.attr('data-exclude_posts');
	    for (let i=0; i<posts.length; i++) {
	      excludePosts += ',' + posts[i].id;
	    }
	    $button.attr('data-exclude_posts', excludePosts);

	    // See if there are more posts to load, and if so re-enable the button
	    let postsLoaded = $widget.find('.post-archive__post-list > li').length;
	    if (parseInt($button.attr('data-total_post_count')) - postsLoaded > 0) { // There are still posts to load
	      buttonStateEnabled($button);
	    } else { // All posts are loaded, so don't re-enable the button. Provide visual feedback that all posts are loaded.
	      $button.text('All posts loaded');
	    }

	    // Remove the loading state to stop button animation
	    buttonStateNoLoading($button);
	  };


	  //
	  //  Button States
	  //
	  //  See _load-more.scss for button styles.
	  // 
	  var buttonStateDisabled = function($button) {
	    $button.addClass('post-archive__load-more--disabled');
	  };

	  var buttonStateLoading = function($button) {
	    $button.addClass('post-archive__load-more--loading');
	  };

	  var buttonStateNoLoading = function($button) {
	    $button.removeClass('post-archive__load-more--loading');
	  };

	  var buttonStateEnabled = function($button) {
	    $button.removeClass('post-archive__load-more--loading').removeClass('post-archive__load-more--disabled');
	  };


	  //
	  //  AJAX Requests
	  //
	  var ajaxListPosts = function( $button, $widget ) {
	    buttonStateDisabled($button); // Disable the button to prevent overlapping queries
	    buttonStateLoading($button); // Put the button in "loading" status (for animation purposes)

	    // Format the URL
	    var requestURL = $button.attr('data-url-base');
	    if ( $button.attr('data-post_type') === 'post' ) {
	    	requestURL += '/posts';
	    } else if ( $button.attr('data-post_type') === 'page' ) { 
	    	requestURL += '/pages';
	    } else {
	    	requestURL += '/' + $button.attr('data-post_type');
	    }
	    requestURL += '?per_page=9';
	    requestURL += '&exclude=' + $button.attr('data-exclude_posts');

	    // Check if there are URL vars (ie. user-applied filters), and apply them to our request
	    var queryParams = getUrlParams(window.location.search);

	    // Check if there are addditional taxonomy filters that have been applied by editors (on the load more button)
	    // Data attribute will look like this: data-taxonomies="category,4|category,5|post_tag,6"
	    if ($button.attr('data-taxonomies')) { // Split string out into a meaningful array
	    	var taxonomies = $button.attr('data-taxonomies').split('|');
	    	for (var i=0; i<taxonomies.length; i++) {
	    		taxonomies[i] = taxonomies[i].split(',');
	    		
	    		// Loop throuh queryParams, check for duplicates – if not a duplicate, add it!
	    		if (queryParams[taxonomies[i][0]]) { // Does this key already exist in queryParams
	    			if (queryParams[taxonomies[i][0]].indexOf(taxonomies[i][1]) === -1) { // Does queryParams already contain the same value for this key?
	    				queryParams[taxonomies[i][0]] += ',' + taxonomies[i][1]; // No, so add it
	    			}
	    		} else { // Key doesn't exist in queryParams, so add it + its value
	    			queryParams[taxonomies[i][0]] = taxonomies[i][1];
	    		}
	    	}
	    }

	    // Append queryParams to the requestURL
	    var keys = Object.keys(queryParams);
	    if (keys.length > 0) {
	      for (var i=0; i<keys.length; i++) {
	        if (keys[i] === 'search') {
	          requestURL += '&search=' + queryParams.search;
	        }
	        else if (keys[i] === 'date') {
	          var beforeDate = new Date(parseInt(queryParams.date)+1,0,1); // eg. before 1/1/2020, assuming queryParams.date = 2019
	          var afterDate = new Date(parseInt(queryParams.date)-1,11,31); // eg. after 12/31/2018, assuming queryParams.date = 2019
	          requestURL += '&before=' + beforeDate.toISOString() + '&after=' + afterDate.toISOString();
	        }
	        else if (keys[i] === 'category') {
	        	requestURL += '&categories=' + queryParams[keys[i]];
	        }
	        else if (keys[i] === 'post_tag') {
	        	requestURL += '&tags=' + queryParams[keys[i]];
	        }
	        else { // If not search, date, category or post_tag, must be a custom taxonomy
	        	requestURL += '&' + keys[i] + '=' + queryParams[keys[i]];
	        }
	      }
	    }

	    console.log(requestURL);

	    $.ajax({
	      url: requestURL,
	      cache: false
	    })
	    .done(function(data) {
	      handleAjaxListSuccess(data, $button, $widget);
	    })
	    .fail(function(jqXHR, textStatus, errorThrown) {
	      handleAjaxListFailure(jqXHR, textStatus, errorThrown, $button);
	    })
	    .always(function() {
	        
	    });
	  };

	  var ajaxGetCategories = function ( $button, $widget ) {
	  	var requestURL = $button.attr('data-url-base');
	    requestURL += '/' + 'categories';
	    console.log(requestURL);

	    $.ajax({
	      url: requestURL,
	      cache: false
	    })
	    .done(function(data) {
	      handleAjaxGetCategoriesSuccess(data, $button, $widget);
	    })
	    .fail(function(jqXHR, textStatus, errorThrown) {
	      handleAjaxGetCategoriesFailure(jqXHR, textStatus, errorThrown, $button);
	    })
	    .always(function() {
	        
	    });
	  };

	  var ajaxGetSinglePost = function(post, postLoadNum, $button) {
	    // Format the URL
	    var requestURL = $button.attr('data-url-base');
	    if ( $button.attr('data-post_type') === 'post' ) {
	    	requestURL += '/posts';
	    } else if ( $button.attr('data-post_type') === 'page' ) { 
	    	requestURL += '/pages';
	    } else {
	    	requestURL += '/' + $button.attr('data-post_type');
	    }
	    requestURL += '/' + post.id;
	    requestURL += '?_embed=1';

	    console.log(requestURL);

	    $.ajax({
	      url: requestURL,
	      cache: false
	      })
	      .done(function(data) {
	        handleAjaxGetSinglePostSuccess(data, postLoadNum, $button);
	      })
	      .fail(function(jqXHR, textStatus, errorThrown) {
	        handleAjaxGetSinglePostFailure(jqXHR, textStatus, errorThrown, $button);
	      })
	      .always(function() {
	        
	      });
	  };


	  //
	  //  AJAX Helpers
	  //
	  var getUrlParams = function(url) {
	    var queryString = url ? url.split('?')[1] : window.location.search.slice(1); // get query string from url (optional) or window
	    var obj = {};
	    if (queryString) {
	      queryString = queryString.split('#')[0]; // stuff after # is not part of query string, so get rid of it
	      var arr = queryString.split('&');

	      for (var i = 0; i < arr.length; i++) {
	        var a = arr[i].split('='); // separate the keys and the values
	        // set parameter name and value (use 'true' if empty)
	        var paramName = a[0];
	        var paramValue = typeof (a[1]) === 'undefined' ? true : a[1];
	        // keep case consistent
	        paramName = paramName.toLowerCase();
	        if (typeof paramValue === 'string') paramValue = paramValue.toLowerCase();
	        // if the paramName ends with square brackets, e.g. colors[] or colors[2]
	        if (paramName.match(/\[(\d+)?\]$/)) {
	          // create key if it doesn't exist
	          var key = paramName.replace(/\[(\d+)?\]/, '');
	          if (!obj[key]) obj[key] = [];
	          if (paramName.match(/\[\d+\]$/)) { // if it's an indexed array e.g. colors[2]
	            // get the index value and add the entry at the appropriate position
	            var index = /\[(\d+)\]/.exec(paramName)[1];
	            obj[key][index] = paramValue;
	          } else { // otherwise add the value to the end of the array
	            obj[key].push(paramValue);
	          }
	        } else { // we're dealing with a string
	          if (!obj[paramName]) { // if it doesn't exist, create property
	            obj[paramName] = paramValue;
	          } else if (obj[paramName] && typeof obj[paramName] === 'string'){ // if property does exist and it's a string, convert it to an array
	            obj[paramName] = [obj[paramName]];
	            obj[paramName].push(paramValue);
	          } else { // otherwise add the property
	            obj[paramName].push(paramValue);
	          }
	        }
	      }
	    }

	    return obj;
	  }


	  //
	  //  Request handling
	  //
	  var handleAjaxGetCategoriesSuccess = function(data, $button, $widget) {
	  	categories = data;
	  };

	  var handleAjaxGetCategoriesFailure = function(jqXHR, textStatus, errorThrown, $button) {
	  	console.log("Get Categories AJAX Error:");
	    console.log(textStatus);
	    console.log(errorThrown);
	    buttonStateEnabled($button);
	  };

	  var handleAjaxGetSinglePostFailure = function(jqXHR, textStatus, errorThrown, $button) {
	    // handleError('Error: Unable to fetch additional posts. Please try again later.');
	    console.log("Get Single Post AJAX Error:");
	    console.log(textStatus);
	    console.log(errorThrown);
	    buttonStateEnabled($button);
	  };

	  var handleAjaxGetSinglePostSuccess = function(data, postLoadNum) {
	    // Set this post's loaded value to true
	    posts[postLoadNum] = data;
	  };

	  var handleAjaxListFailure = function(jqXHR, textStatus, errorThrown, $button) {
	    // handleError('Error: Unable to fetch additional posts. Please try again later.');
	    console.log("List Posts AJAX Error:");
	    console.log(textStatus);
	    console.log(errorThrown);
	    buttonStateEnabled($button);
	  };

	  var handleAjaxListSuccess = function(data, $button, $widget) {
	    // New posts were found, clear out posts vars and recreate them for this query
	    posts = [];
	    
	    // Get single posts, and queue up renderPostsWhenLoaded to render the posts when they're all loaded.
	    for (var i=0; i<data.length; i++) {
	      posts.push(false);
	      ajaxGetSinglePost(data[i], i, $button);
	    }

	    renderPostsWhenLoaded($button, $widget);
	  };

	  var renderPostsWhenLoaded = function($button, $widget) {
	    // Wait until all posts have loaded to try to pass them to the renderer
	    var renderWait = setInterval(function() {
	      var readyToRender = true;

	      if (categories.length === 0) {
	      	readyToRender = false;
	      }
	      
	      for (var i=0; i<posts.length; i++) {
	        if (posts[i] === false) {
	          readyToRender = false;    
	        }
	      }

	      if (readyToRender) {
	        clearInterval(renderWait);
	        renderPosts($button, $widget);

	        // Posts have been sent to the renderer, so perform our wrapup to prepare the button to be clicked again
	        finish($button, $widget);
	      }
	    }, 100);
	  };


	  //
	  //  Rendering
	  //
	  var renderPosts = function($button, $widget) {

	    var render = '';

	    posts.forEach(function(post) {
	    	
	    	// Setup the post classes
	    	var postClass = "post-list__post";
	    	postClass += ' post-list__post--image-' + $button.attr('data-image_position');
	    	postClass += ' post-list__post--has-image-' + $button.attr('data-show_image');
	    	postClass += ' post-list__post--image-size-' + $button.attr('data-image_size');

	    	// Setup category label
	    	var postLabel = '';
	    	if ( post.categories.length > 0 ) {
	    		// Find the category name
    			for (var i=0; i<categories.length; i++) {
	    			if (post.categories[0] === categories[i].id) {
	    				postLabel += categories[i].name;
	    			}
	    		}
	    	}
	    	// Uncomment to display all categories
	    	// postLabel = '';
	    	// for (var i=0; i<post.categories.length; i++) {
	    	// 	for (var c=0; c<categories.length; c++) {
	    	// 		if (post.categories[i] === categories[c].id) {
	    	// 			if (i > 0) {
	    	// 				postLabel += ', ';
	    	// 			}
	    	// 			postLabel += categories[c].name;
	    	// 		}
	    	// 	}
	    	// }
	    	if (postLabel.length === 0) {
	    		postLabel = $button.attr('data-post_type_label');
	    	}

	    	// Get the image, as large as possible!
	    	var imageURL = false;
	    	if ( post._embedded['wp:featuredmedia'] ) {
	    		if ( post._embedded['wp:featuredmedia'][0].media_details.sizes.large ) {
		    		imageURL = post._embedded['wp:featuredmedia'][0].media_details.sizes.large.source_url;
		    	}
		    	else if ( post._embedded['wp:featuredmedia'][0].media_details.sizes.medium_large ) {
		    		imageURL = post._embedded['wp:featuredmedia'][0].media_details.sizes.medium_large.source_url;
		    	}
		    	else if ( post._embedded['wp:featuredmedia'][0].media_details.sizes.medium ) {
		    		imageURL = post._embedded['wp:featuredmedia'][0].media_details.sizes.medium.source_url;
		    	}
		    	else if ( post._embedded['wp:featuredmedia'][0].media_details.sizes.thumbnail ) {
		    		imageURL = post._embedded['wp:featuredmedia'][0].media_details.sizes.thumbnail.source_url;
		    	}
	    	}

	      render += '<li class="' + postClass + '">';
	      	if (post._embedded['wp:featuredmedia'] && $button.attr('data-show_image') === 'yes') {
	      		render += '<a class="post-list__post-image" href="' + post.link + '" style="background-image: url(' + imageURL + ');"></a>';
	      	} else {
	      		render += '<a class="post-list__post-image" href="' + post.link + '"></a>';
	      	}
	      	render += '<div class="post-list__post-text">';
	      		if ($button.attr('data-show_category_label') === 'yes') {
		      		render += '<span class="post-list__post-label">' + postLabel + '</span>';
	      		}
	      		if ($button.attr('data-show_title') === 'yes') {
		      		render += '<span class="post-list__post-title">';
				      	render += '<a href="' + post.link + '">' + post.title.rendered + '</a>';
				      render += '</span>';
				    }
			     	render += '<div class="post-list__post-meta">';
			     		if ($button.attr('data-show_date') === 'yes') {
			      		render += '<span class="post-list__post-date">' + formatPostDate(post) + '</span>';
			      	}
			      	if (post._embedded.author && $button.attr('data-show_author') === 'yes') {
			      		render += '<span class="post-list__post-author">' + post._embedded.author[0].name + '</span>';
			      	}
			      render += '</div> <!-- .post-list__post-meta -->';
			      if (post.excerpt && $button.attr('data-show_excerpt') === 'yes') {
			      	render += '<div class="post-list__post-excerpt">' + post.excerpt.rendered + '</div>';
			      }
			      if ($button.attr('data-show_read_more') === 'yes') {
			      	render += '<a class="post-lsit__post-read-more" href="' + post.link + '">Read more&hellip;</a>';
			      }
		      render += '</div> <!-- .post-list__post-text -->';
	      render += '</li>';
	    });

	    // Insert posts into the page
	    $widget.find('ul.post-list').append(render);
	  };


	  //
	  //  Rendering helpers
	  //
	  var formatPostDate = function(post) {
	    var date = new Date(post.date);
	    var options = { year: 'numeric', month: 'long', day: 'numeric' };
      date = date.toLocaleDateString("en-US", options)

	    return date;
	  };

		return {
		  init: init,
		}
	})();


	var post_archive_view_controls = (function() {
		
		var init = function( $widget ) { // $widget is the jQuery wrapper element automatically passed from the elementorFrontend hook
			// Initial storage setup
			if (localStorage.getItem('post_archive_view_style') === null) {
				localStorage.setItem('post_archive_view_style', 'grid'); // Grid is our default.
			}
			var view_style = localStorage.getItem('post_archive_view_style');

			// Find the post archive on the page and ensure it's set to the same style.
			var $post_list = $widget.find('ul.post-list');
			if (view_style === 'grid' && !$post_list.hasClass('post-list--grid')) {
				$post_list.removeClass('post-list--list').addClass('post-list--grid');
				$widget.find('.post-archive__view-control--list').removeClass('post-archive__view-control--active');
				$widget.find('.post-archive__view-control--grid').addClass('post-archive__view-control--active');
			}
			else if (view_style === 'list' && !$post_list.hasClass('post-list--list')) {
				$post_list.removeClass('post-list--grid').addClass('post-list--list');
				$widget.find('.post-archive__view-control--list').addClass('post-archive__view-control--active');
				$widget.find('.post-archive__view-control--grid').removeClass('post-archive__view-control--active');
			}

			// Watch for clicks on the post list view controls
			$widget.find('a.post-archive__view-control').click(function() {
				set_view_style( $widget, $(this) );
			});
		};

		var set_view_style = function ( $widget, $clicked_control ) {
			var current_view_style = localStorage.getItem('post_archive_view_style');
			var new_view_style = $clicked_control.attr('data-style');
			var $post_list = $widget.find('ul.post-list');

			if (new_view_style !== current_view_style) { // Set the new view style
				$post_list.removeClass('post-list--' + current_view_style).addClass('post-list--' + new_view_style);
				$widget.find('.post-archive__view-control--' + current_view_style).removeClass('post-archive__view-control--active');
				$widget.find('.post-archive__view-control--' + new_view_style).addClass('post-archive__view-control--active');
				localStorage.setItem('post_archive_view_style', new_view_style);
			}
		};

		return {
			init: init
		}
	})();



	/**
	 * Post List
	 */	
	


	/**
	 * Initialize widgets
	 */

	$( window ).on( 'elementor/frontend/init', function() {
		// Front end actions
		elementorFrontend.hooks.addAction( 'frontend/element_ready/post-archive.default', post_archive_form.init );
		elementorFrontend.hooks.addAction( 'frontend/element_ready/post-archive.default', post_archive_load_more.init );
		elementorFrontend.hooks.addAction( 'frontend/element_ready/post-archive.default', post_archive_view_controls.init );

		// Editor actions
		if (typeof elementor !== 'undefined') { // Only run editor code when the editor is loaded.
			// elementor.hooks.addAction( 'panel/open_editor/widget/single-post-promo', single_post_promo_editor );
		}
	});

})(jQuery);