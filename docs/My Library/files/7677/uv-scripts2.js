// Stop cross-frame script
if(top.frames.length > 0) top.location.href=self.location;

// Trigger jQuery. UV stores jQuery in UV.jQuery
UV.jQuery(document).ready(function() {
	var $ = UV.jQuery;
	var uvIdent = 'ZY89krPchloLAi8VLMg';

	// Add UserVoice script for buttons, along with other UserVoice workarounds
	if( $('#custom-buttons').length > 0 ) {
	  // Load UV script
	  $.getScript( ('https:' == document.location.protocol ? 'https://' : 'http://') + 'widget.uservoice.com/' + uvIdent + '.js');

	  // Add navigation icons, which can't be specified in UV
	  $('#custom-buttons').html(
		'<a class="browse" href="#knowledgebase">Browse Knowledge Base</a>' +
		'<a class="feedback" href="#givefeedback">Give Feedback</a>' +
		'<a class="ask" href="javascript:UserVoice.showPopupWidget()">Ask a Question</a>'
	  );

	  $('body.uv-home-page div.uvModule-featuredForum h2.uvModuleTitle').attr('id', 'givefeedback');
	  $('body.uv-home-page div.uvModule-knowledgebase h2.uvModuleTitle').attr('id', 'knowledgebase');
	}
	
	// The UV editor insists on changing the target attribute for all <a> tags, so we must workaround
	$('a.fixme').each(function() {
	  $(this).removeAttr('rel');
	  $(this).removeAttr('target');
	});

	// Install widgets
	$('#wbservices-trigger').click(function() {
	  // open/close the WB services popup in the footer
	  $(this).toggleClass('open');
	  $('#wbservices').toggleClass('open');
	});
});



// functions to generate Omniture identifiers specifically for UserVoice, based on the DOM

function wbUVGetPageNameAttribute(limit) {
  if( typeof(limit) === 'undefined' ) limit = 100;
  var $ = UV.jQuery;
  var title = wbUVGetPageTitle();
  var pg = 'Data Help Desk';

  var $bc = $('div.uvBreadcrumbs a:first');
  var bcTitle = $bc.text();
  var bcPath = $bc.attr('href');

  bcTitle = bcTitle ? bcTitle : '';
  bcPath = bcPath ? bcPath : '';
  if( bcTitle ) bcTitle = bcTitle.substr(2);

  if( $('body').hasClass('uv-forum') ) {
	pg += ' > Feedback';
	
    // In a forum. Test if we are looking at a forum or a specific submission
	if( bcPath.match(/^\/forums\//) )
	  pg += ' > ' + bcTitle;

    pg += ' > ' + title;
  }
  else if( $('body').hasClass('uv-topic') ) {
    pg += ' > Knowledge Base';
	if( bcPath.match(/^\/knowledgebase\/topics\//) )
	  pg += ' > ' + bcTitle;

    pg += ' > ' + title;
  }
  else if( bcPath ) {
	/* if there's a breadcrumb then we're on the interior of the site somewhere, so add the title
	 * Otherwise, we're on the home page
	*/
    pg += ' > ' + title;
  }

  if( limit ) pg = pg.substr(0, limit);
  return pg;
}

function wbUVGetPageTitle() {
  var $ = UV.jQuery;

  var t = $('h1.uvIdeaTitle:first').text();
  if( ! t ) t = $('h1.uvPageTitle:first').text();

  return t;
}

// test
/*
UV.jQuery(document).ready(function() {
  var $ = UV.jQuery;
  var $pgAttr = $('</p>').text(wbUVGetPageNameAttribute());

  $('div.footer-left').append($pgAttr);
});
*/
