var MainContentLeft = Class.create(
{
	initialize: function(spec)
	{
		this.cookieName = spec.cookieName;
		this.sidePanelToggleLink = $(spec.sidePanelToggleLink);
		this.mainContentLeft = $(spec.mainContentLeftId);
		this.sidePanel = $(spec.sidePanelId);
		this.showSidePanelText = spec.showSidePanelText;
		this.hideSidePanelText = spec.hideSidePanelText;
		
		if (this.sidePanelToggleLink != null) {
			this.sidePanelToggleLink.observe('click', this.toggleColumn.bindAsEventListener(this));
		}
	},
	
	toggleColumn: function(event)
	{
		event.stop();
		if (this.sidePanel.hasClassName('hidden')) {
			Cookies.create(this.cookieName, 'open');
			this.sidePanelToggleLink.update(this.hideSidePanelText + ' <span class="uxf-icon uxf-right-open-mini"></span>');
			this.mainContentLeft.writeAttribute('class', 'col-md-9 col-sm-8');
			this.sidePanel.writeAttribute('class', 'col-md-3 col-sm-4 col-xs-12');
		} else {
			Cookies.create(this.cookieName, 'closed');
			this.sidePanelToggleLink.update(this.showSidePanelText + ' <span class="uxf-icon uxf-right-open-mini"></span>');
			this.mainContentLeft.writeAttribute('class', 'col-xs-12 col-sm-12 col-md-12 col-lg-12');
			this.sidePanel.writeAttribute('class', 'hidden');
		}
	}
});

var mainContentLeft;
Tapestry.Initializer.mainContentLeft = function(spec)
{
	mainContentLeft = new MainContentLeft(spec);
}
