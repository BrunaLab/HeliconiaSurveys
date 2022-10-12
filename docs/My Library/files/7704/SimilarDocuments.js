var SimilarDocuments = Class.create({
	initialize: function(spec) {
		this.showSimilarDocsElement = $$('a[id^=showSimilarDocs]');
		if (this.showSimilarDocsElement != null) {
			this.showSimilarDocsElement.observe('click', this.afterZoneUpdated.bindAsEventListener(this));
		}
		this.hideSimilarDocsElement = $$('a[id^=hideSimilarDocs]');
		if (this.hideSimilarDocsElement != null) {
			this.hideSimilarDocsElement.observe('click', this.afterZoneUpdated.bindAsEventListener(this));
		}
		this.showMoreDocuments = $$('a[id^=showMoreRelatedItemsLink]');
		if (this.showMoreDocuments != null) {
			this.showMoreDocuments.observe('click', this.afterZoneUpdated.bindAsEventListener(this));
		}
	},

	focusElement: function(event) {
		var element = $$('a[id^=showSimilarDocs]');
		if (element != null && element[0] != null) {
			element[0].focus();
		} else {
			element = $$('a[id^=hideSimilarDocs]');
			if (element != null && element[0] != null) {
				element[0].focus();
			}
		}
		// JS logic to execute when using Recommender service after 'similarDocsZone' update
		this.showMoreRelatedDocs(event);
	},
	

	showMoreRelatedDocs : function(event) {
		if ($j('.wt-sim-doc-results-item:eq(5) a').length) {
			$j('a[id*="showMoreRelatedItemsLink"]').hide();
			$j('#hideMoreRelatedItemsLink').show();
			$j('.wt-sim-doc-results-item:eq(5) a').focus();
			pqGlobal.removeAndAddTruncationEffect();
		}
	},
	
	afterZoneUpdated: function(event) {
		$('similarDocsZone').observe(Tapestry.ZONE_UPDATED_EVENT, this.focusElement.bindAsEventListener(this));
	}
});

Tapestry.Initializer.similarDocuments = function(spec) {
	similarDocuments = new SimilarDocuments(spec);
}

function hideMoreRelatedDocs() {
	$j('#hideMoreRelatedItemsLink').hide();
	$j('a[id*="showMoreRelatedItemsLink"]').show();
	$j('.wt-sim-doc-results-item').each(function(index) {
		if (index >= 5) {
			$j(this).hide();
		}
	});
	$j('a[id*="showMoreRelatedItemsLink"]').focus();
}