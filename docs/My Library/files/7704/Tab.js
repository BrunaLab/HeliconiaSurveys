document.observe('dom:loaded', function() {
	if (sessionStorage.tabTriggered === "true") {
		var element = $(JSON.parse(sessionStorage.tabFocusId));
		if (element) {
			// handling the case of a drop-down menu hidden id where we want the focus to apply to the visible menu item instead
			if (element.up(1).previous() != null && element.up(1).previous().readAttribute('data-toggle') === 'dropdown') {
				element = element.up(1).previous();
			}
			element.focus();
		}
		sessionStorage.tabTriggered = "false";
	}	
});