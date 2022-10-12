Tapestry.Initializer.ContainerBlock = function (parameters) {

	function initAccordion(wrapperId, active) {
	    	var jQueryObject = jQuery(wrapperId).find('.ui-accordion');
	    	jQueryObject.accordion({
	    		active: active,
	    		beforeActivate: function(event, ui) {
	    			if (ui.newHeader.length > 0) {
	    				var button = ui.newHeader.find(".c-Button");
	    				button.removeClass(button.attr("data-collapsed-icon"));
	    				button.addClass(button.attr("data-active-icon"));
	    			} else {
	    				var button = ui.oldHeader.find(".c-Button");
	    				button.removeClass(button.attr("data-active-icon"));
	    				button.addClass(button.attr("data-collapsed-icon"));
	    			}
	    		}
	        // autoHeight: false,
	        // navigation: true,
	        // collapsible: true
	        });

	    	jQueryObject.find('[data-collapsed-icon]').each(function(index, button) {
	    		if (index === active){
				    button.classList.remove(button.getAttribute('data-collapsed-icon'));
				    button.classList.add(button.getAttribute('data-active-icon'));
			    }
	    	});

	    	jQueryObject.show();
	}
    initAccordion(parameters.wrapperId, parameters.active);
};

