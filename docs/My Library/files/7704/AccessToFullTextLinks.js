var AccessToFullTextLinks = Class.create({
	afterZoneUpdated: function(event) {
		$('fullTextLinksZone').observe(Tapestry.ZONE_UPDATED_EVENT, this.focusElement.bindAsEventListener(this));
	}
	
});

Tapestry.Initializer.accessToFullTextLinks = function(spec) {
	accessToFullTextLinks = new AccessToFullTextLinks(spec);
}
