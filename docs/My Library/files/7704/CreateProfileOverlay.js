var CreateProfileOverlay = Class.create({
	
	initialize: function(spec) {
		this.clientId = spec.clientId;
		this.reloadFlag = false;
		this.tAndCId = spec.tAndCId;
		this.tAndC = $(this.tAndCId);
		this.submitCreateUserId = spec.submitCreateUserId;
		
		this.publicKey = spec.publicKey;
		this.theme = spec.theme;
		
		// Links to redirect to when continue/go to my research buttons clicked
		this.preferencesLink = pqCoreUtil.makeUrlRelative(spec.preferencesLink);
		this.myResearchLink = pqCoreUtil.makeUrlRelative(spec.myResearchLink);
		//this.accountInfo = pqCoreUtil.makeUrlRelative(spec.accountInfoLink);
		
		if (this.submitCreateUserId) {
			this.submitCreateUser = $(this.submitCreateUserId);
		}
		
		document.observe('lightview:hidden', function(event) {
			if (this.reloadFlag)
				window.location.reload();
		}.bind(this));
		
	},

    showRecaptcha:function() {
        Recaptcha.create(this.publicKey, "recaptchaDivId", {
        	theme: this.theme,
        	callback: Recaptcha.focus_response_field
        });
    },
        
	fromCreateOverLayPage:function(){
			this.reloadFlag = true;
	},
	
	continuePage: function() {
		handleNextPage('myResearchDocs');
	},
	
	handleNextPage: function(sourceLink) {
		this.reloadFlag = false;
		var source = sourceLink.substring(sourceLink.indexOf(".") + 1);
		var overlayId = this.clientId + 'Overlay';
		if ($(overlayId)) {
			jQuery("#" + overlayId).modal('hide');
		}
		if(source == 'addTags') {
			window.location.reload();
		}
		else if(source == 'saveSearch') {
			$('openOnPageLoad').request({
				onComplete: function(t) {
					window.location.reload();
				}
			});
		}
		else if(source == 'preferences') {
			location = this.preferencesLink;
		} 	else if(source == 'accountInfo') {
			location = this.accountInfo;
		}
		else if(source == 'myResearchDocs') {
			var linkWithoutAccount = this.myResearchLink.split('?');
			var newHref = "";
			// the incoming path may have leading /, so accomodate....
			// Note, this method of changing the location avoids the IE7  and
			// Chrome issues with having the myResearchLink come in with the
			// ?accountid=#### appended.
			if (linkWithoutAccount[0].substr(0, 1) != "/") {
				newHref += '/'; 
			}
			newHref += linkWithoutAccount[0];
			if (linkWithoutAccount.length > 1) {
				newHref += "?" + linkWithoutAccount[1];
			}
			location.href = newHref;
		}
		else {
			window.location.reload();
		}
	},
	
	getOverlay: function() {
		return $(this.clientId+'Overlay');
	}
});

var createProfileOverlay;
Tapestry.Initializer.CreateProfileOverlay = function(spec) {
	createProfileOverlay = new CreateProfileOverlay(spec);
};

function showMyResearchLearnMoreOverlay() {
	Overlay.box.showOverlay('learnMoreOverlay');
	return false;
}

function closeCreateAMyResearchAccount() { 
	document.getElementById('createProfileOverlay').hide(); 
	return true; 
};

	
