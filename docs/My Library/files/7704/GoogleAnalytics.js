var pqga = (function() {
	//this variable is used in onmouseover and onmouseout events on some tml files, do not remove
	var funcDelay = null;
	
    return {
    	funcDelay: funcDelay,
    	
    		/**
         * Method to push data to Google Analytics. This method can be used to push any
         * data value to Google Analytics through the 'Data Value' variable defined in
         * Tag Manager.
         * 
         * @param dataValue
         */
	    	pushDataToGA: function(dataValue) {
	    		window.dataLayer = window.dataLayer || [];
	        	dataLayer.push({
	        		'dataValue' : dataValue
	        	});
	    },
        
        /**
         * Method to push an event to Google Analytics. This method can be used to push
         * an event being used in a trigger based that custom event.
         * 
         * @param eventName
         */
        pushEventToGA: function(eventName) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		event : eventName
        	});  
        },
        
        /**
         * Method to push event with data to Google Analytics. This method can be used
         * to push an event along with data value being used in a trigger based that
         * custom event. The variable 'Data Value' defined in Tag Manager is being used
         * for data.
         * 
         * @param eventName
         * @param dataValue
         */
        pushEventWithDataToGA: function(eventName, dataValue) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		event : eventName,
        		'dataValue' : dataValue
        	});  
        },
        
        /**
         * Method to push media object events with data to Google Analytics. This method can be used
         * to push an event along with data value being used in a trigger based that
         * custom event. The variable 'interaction' defined in Tag Manager is being used
         * for media object interaction data.
         * 
         * @param eventName
         * @param interaction
         */
        pushEventWithDataToGAForMediaObject: function(eventName, interaction) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		event : eventName,
        		'interaction' : interaction
        	});  
        },
        
        /**
         * Method to push page title to Google Analytics. This method is being used to
         * push Analytics specific page title to be used in Google Analytics. The
         * variable 'AnalyticsPageTitle' defined in Google Tag Manager is being used
         * here.
         * 
         * @param analyticsPageTitle
         */
        sendPageTitleToGA: function(analyticsPageTitle) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'AnalyticsPageTitle' : analyticsPageTitle
        	}); 
        },
        
        /**
         * Method to push product name to Google Analytics. 
         * The variable 'AnalyticsProductName' defined in Google Tag Manager is being used
         * here.
         * 
         * @param analyticsProductName
         */
        sendAnalyticsProductNameGA: function(analyticsProductName) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'AnalyticsProductName' : analyticsProductName
        	});
        },
        
        /**
         * Method to push open layer product moniker to Google Analytics. 
         * The variable 'Product_Moniker_OOB' defined in Google Tag Manager is being used
         * here.
         * 
         * @param productMonikerOOB
         */
        sendAnalyticsProductMonikerOOBGA: function(productMonikerOOB) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'Product_Moniker_OOB' : productMonikerOOB
        	});
        },
       
        /**
         * Method to push publisher name to Google Analytics. 
         * The variable 'AnalyticsPublisherName' defined in Google Tag Manager is being used
         * here.
         * @param analyticsPublisherName
         */
        sendAnalyticsPublisherNameGA: function(analyticsPublisherName) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'AnalyticsPublisherName' : analyticsPublisherName
        	});
        },
        
        /**
         * Method to send account id to Google Analytics. 
         * The variable 'AnalyticsAccountId' defined in Google Tag Manager is being used
         * here.
         * @param analyticsAccountId
         */
        sendAnalyticsAccountIdToGA: function(analyticsAccountId) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'AnalyticsAccountId' : analyticsAccountId
        	});
        },
        
        sendSessionIDToGA: function(sessionID) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'SessionID' : sessionID
        	});
        },
        
        sendJSessionIDToGA: function(jSessionID) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'jSessionID' : jSessionID
        	});
        },
        
        sendClientIDHitToGA: function(ClientId) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'ClientID_Hit' : ClientId
        	});
        },
        
        sendClientIDSessionToGA: function(ClientId) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'ClientID_Session' : ClientId
        	});
        },
 
        sendOpenLayerToGA: function(openLayer) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'OpenLayer' : openLayer
        	});
        },
        
        sendOpenLayerUserToGA: function(openLayer) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push({
        		'OpenLayer_User' : openLayer
        	});
        },

        /**
         * This method can be used to fire a text entry event wherever required in the
         * application, which can be used to create a trigger based on that event in
         * Google Tag Manager. For example, refer to 'Browse Issue Navigation Search
         * Within Trigger' defined in Publications folder in Google Tag Manager.
         * 
         * @param eventName
         */
        fireTextEntryEvent: function(event, eventName) {
        	if (event.keyCode == 13) {
        		this.pushEventToGA(eventName);
        	}
        },
        
        /* Custom events methods */
        selectedValueToDataLayer: function() {
        	var value = document.getElementById("itemsPerPage").value;
        	this.pushEventWithDataToGA('onChange', value);
        },
        
        pushSelectEventAndValueToGA: function(elementId, eventName) {
        	var elem = document.getElementById(elementId);
        	var value = elem.options[elem.selectedIndex].innerHTML;	
        	this.pushEventWithDataToGA(eventName, value);
        },
        
        gaSelectDeselectCheckbox: function(checkbox, key) {
        	var isChecked = checkbox.checked;
        	if (isChecked) {
        		this.pushEventWithDataToGA(key + 'Select', 'Select');
        	} else {
        		this.pushEventWithDataToGA(key + 'Deselect', 'Deselect');
        	}
        },
        
        gaSelectDeselectCheckboxWithValue: function(checkbox, key, value) {
        	var isChecked = checkbox.checked;
        	if (isChecked) {
        		this.pushEventWithDataToGA(key + 'Select', value);
        	} else {
        		this.pushEventWithDataToGA(key + 'Deselect', value);
        	}
        },

		gaDocViewIndexingTermsCollapseExpand : function() {
			if (document.getElementById("indexSearchTermsLink").getAttribute(
					'aria-expanded') == 'true') {
				this.pushEventWithDataToGA('indexingTermsEvent', 'Collapse');
			} else {
				this.pushEventWithDataToGA('indexingTermsEvent', 'Expand');
			}
        },
        
        gaRelatedDocsExpandCollapse: function(name) {
        	if (name == 'ebrary') {
        		if (document.getElementById("relatedDocs_ebrary").getAttribute(
        				'aria-expanded') == 'true') {
        			this.pushEventWithDataToGA('relatedDocsEbraryEvent', 'Collapse');
        		} else {
        			this.pushEventWithDataToGA('relatedDocsEbraryEvent', 'Expand');
        		}
        	} 
        },
        
        advancedSearchBoxTextEntryEvent: function(event, eventName, fieldId) {
        	if (event.keyCode == 13) {
        		if(eventName == 'advancedSearchTextEnterKeyPress') {
        			if(fieldId == 'queryTermField') {
        				this.pushEventWithDataToGA('advancedSearchTextEntryEvent', 'TextArea1');
        			}
        			
        			if(fieldId.indexOf('queryTermField_') > -1) {
        				var str = fieldId.split('_');				
        				if(str[1] == '0') {
        					this.pushEventWithDataToGA('advancedSearchTextEntryEvent', 'TextArea2');
        				} else {
        					this.pushEventWithDataToGA('advancedSearchTextEntryEvent', 'TextArea'+((parseInt(str[1])+1)*2));
        				}
        			}
        			
        			if(fieldId.indexOf('queryTermFieldRight_') > -1) {
        				var str = fieldId.split('_');				
        				if(str[1] == '0') {
        					this.pushEventWithDataToGA('advancedSearchTextEntryEvent', 'TextArea3');
        				} else {
        					this.pushEventWithDataToGA('advancedSearchTextEntryEvent', 'TextArea'+(((parseInt(str[1])+1)*2)+1));
        				}
        			}
        		}
        		this.pushEventToGA(eventName);
        	} 
        },

        sendDocviewCustomDimensionsToGA: function(customDimensions) {
        	window.dataLayer = window.dataLayer || [];
        	dataLayer.push(customDimensions); 
        }
    };  
})();