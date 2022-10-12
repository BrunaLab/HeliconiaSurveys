//
// Used by /docview pages to extend session time-out from 30 min to 60 mins.
// See PQ-52822
//
// Additional info at https://wiki.proquest.com/display/Devs2/OneSearch+Session+Timeout
//
// This is quite the hack, it just sends a "do-nothing" round-trip AJAX query to the
// server at 23 minutes and then 7 minutes.

var publisherName='not set'
var firstTimeoutDuration = 23 * 60 * 1000 // 23   minutes in ms
var secondTimeoutDuration = 7 * 60 * 1000 //  7   minutes in ms
var anchorToFulltextTSection;
var scroll = false;

var docViewBase = {
	initialize: function(spec) {
		publisherName = spec.publisherName;
		anchorToFulltextTSection = spec.anchorToFTSection;
		scroll = spec.scrollToSection;
		////
		// Ping after 23 minutes to avoid to pop-up, then 7 minutes later to give you the full hour
		////
		setTimeout(function() { ping(secondTimeoutDuration); }, firstTimeoutDuration);  
	}
};

function ping(resetTime) {
	Cookies.create("osTimestamp", new Date().getTime() / 1000);  // For PQ-61526, to tell other tabs we're still active.
//	console.log(pqCoreUtil.makeUrlRelative('/index.homepagelayout.endsession:ping [' + resetTime + ']'));
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET","/index/homepagelayout.endsession:ping", true);
	xhttp.send();
	delete xhttp;
	if(resetTime != 0) {
		setTimeout(function(){ ping(0); }, resetTime);
	}
}

/**
 * Scroll to the section in the loaded fulltext document
 * 
 * @param anchor to section id
 * @returns
 */
function scrollToSection(id) {
	if (jQuery("#" + id).length == 0) {
		jQuery('html,body').animate({
			scrollTop : 0
		}, 'slow');
	} else {
		jQuery('html,body').animate({
			scrollTop : parseInt(jQuery("#" + id).offset().top)
		}, 'slow');
	}

}

/**
 * Only applies to section id coming from intra doc links
 * With intra doc linking the section id is of the form
 * IDLS_fulltextSectionId_tocNodeSectionId
 * This method returns fulltext section id from the section id param provided.
 * 
 * @param section
 * @returns full text section id
 */
function getFullTextSectionId(section) {
	var fulltextTOCNodeSectionId = section ? section.split('_') : "";
	section =  fulltextTOCNodeSectionId.length > 1 ?  fulltextTOCNodeSectionId[1] : section;
	return section;
}

Tapestry.Initializer.docViewBase = function(options) {
	docViewBase.initialize(options);
};

$j(window).load(function() {
	pqga.sendAnalyticsPublisherNameGA(publisherName);
	
	
	if (anchorToFulltextTSection && scroll) {
		scrollToSection(getFullTextSectionId(anchorToFulltextTSection));
	}
	
});


