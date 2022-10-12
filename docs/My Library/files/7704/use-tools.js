var pqUseTools = (function() {
	return {
		handleToolbarToggle : function(event) {
			var count = event.memo;
			if (count > 0) {
				pqUseTools.enableTools();
				pqUseTools.enableKeyboardNavigation();
			} else {
				pqUseTools.disableTools();
				pqUseTools.disableKeyboardNavigation();
			}
		},
		showPopover : function(element) {
			$j(element).popover({
				html : true,
				content : function() {
					return $j('#noSelectedItemUseToolsPopover').html();
				},
				placement : 'top'
			});
			if ($j('#citethisLink').hasClass("disabled")) {
				$j(element).popover('toggle');
			} else {
				$j(element).popover('destroy');
			}
		},
		hidePopover : function(element) {
			$j(element).popover('destroy');
		},
		disableTools : function() {
			$j('a.tool-option-link').addClass("btn disabled");
		},
		enableTools : function() {
			$j('a.tool-option-link').removeClass("btn disabled");
		},
		disableKeyboardNavigation : function() {
			$j('a.tool-option-link').attr("tabindex", -1);
		},
		enableKeyboardNavigation : function() {
			$j('a.tool-option-link').removeAttr("tabindex");
		},
		// Prevent double-click by checking if previous click was less than 0.5 seconds ago
		preventDoubleClick : function(clickElement, hiddenElement) {
			$j(clickElement).on('click', function(e) {
				var link = $j(e.target);
				e.preventDefault();
				if (!link.data('lockedAt') || +new Date() - link.data('lockedAt') > 500) {
					$j(hiddenElement)[0].click();
			    }
				link.data('lockedAt', +new Date());
			});
		}
	};
})();

$j(document).ready(function() {
	// Handle use tools toggle based on marked list item selection
	document.on('pq:selectedItemsUpdate', function(event) {
		pqUseTools.handleToolbarToggle(event);
	});
	document.on('pq:selectedItemsUpdateInSelectItemToolbar', function(event) {
		pqUseTools.handleToolbarToggle(event);
	});

	// Disable keyboard navigation for disabled use tools at page load
	var useToolsLinkSelector = $j('a.tool-option-link');
	if (useToolsLinkSelector.first().hasClass("disabled")) {
		pqUseTools.disableKeyboardNavigation();
	}
	// Hide the element displayed before 'All save options', if more than 5 use tools
	if (useToolsLinkSelector.length > 5) {
		useToolsLinkSelector.last().prev().remove();
	}

	// Add popover to use tools to display warning a message to user that use
	// tools are not available when no items are selected for post-processing
	$j('#use-tools-wrapper').hover(function() {
		pqUseTools.showPopover(this)
	}, function() {
		pqUseTools.hidePopover(this)
	});

	// Prevent double clicks
	pqUseTools.preventDoubleClick('#allSaveOptionsLink', '#allSaveOptionsHiddenLink');
});