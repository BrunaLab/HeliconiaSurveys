// Variable to keep count of how many times MathJax is attempted to be loaded
var pqMathJaxLoadTries = 0;
// Variable to see if MathJax has defined after Window's onload event
var pqMathJaxLoadOnWindow = false;
// Variable to see if MathJax rendered or typeset on the page
var pqMathJaxCalled = false;

var pqMathJaxToggle = Class.create({

	initialize : function(spec) {
		this.registerToggle(spec.enableMathJax, spec.disableMathJax);
	},
	
	registerToggle : function(enableMathJax, disableMathJax) {
		// Wait for the async MathJax javascript file to be ready
		$j('#mathJaxScript').on('load', this.createToggle(enableMathJax, disableMathJax));
	},

	getToggleId : function() {
		// Having different ids to target different styling depending on if 'hit highlighting' toggle is present
		var toggleMathJaxId;
		if ($j('#toggleHits').length) {
			toggleMathJaxId = 'toggleMathJaxWithToggleHits';
		} else {
			toggleMathJaxId = 'toggleMathJax';
		}
		return toggleMathJaxId;
	},

	createToggle : function(enableMathJax, disableMathJax) {
		if (pqMathJaxLoadTries < 5) {
			if (!(window.MathJax && MathJax.Hub)) {
				pqMathJaxLoadTries++;
				// Try again after a little time
				var that = this;
				setTimeout(that.createToggle(enableMathJax, disableMathJax), 30);
				return;
			}
		} else {
			// One last try to wait for fully loaded page
			if (!(window.MathJax && MathJax.Hub)) {
				if (!pqMathJaxLoadOnWindow) {
					pqMathJaxLoadOnWindow = true;
					var that = this;
					$j(window).load(function() {setTimeout(that.createToggle(enableMathJax, disableMathJax), 100)});
					return;
				}
				if (!(window.MathJax && MathJax.Hub)) {
					console.log('Failed asynchronous loading or ready state of MathJax!');
					return;
				}
			}
		}
		
		MathJax.Hub.Register.StartupHook('End', function() {
			if (pqMathJaxParseErrorHappened) {
				var toggleMathJaxId = pqMathJaxToggleInstance.getToggleId();
				$j('#' + toggleMathJaxId).text(enableMathJax);
			}
		});
		
		// The below hook is called for each math expression that is typeset on the page
		MathJax.Hub.Register.MessageHook('New Math', function() {
			if (!pqMathJaxCalled) {
				pqMathJaxCalled = true;
				var toggleMathJaxId = pqMathJaxToggleInstance.getToggleId();
				$j('#mathJaxToggleContainer').html('<a id="' + toggleMathJaxId + '" href="javascript:void(0)">' + disableMathJax + '</a>');
				$j('#' + toggleMathJaxId).click(function() {
					if ($j(this).text() === disableMathJax) {
						MathJax.Hub.Queue(['setRenderer', MathJax.Hub, 'PlainSource']);
						MathJax.Hub.Queue(['Rerender', MathJax.Hub]);
						$j(this).text(enableMathJax);
					} else {
						MathJax.Hub.Queue(['setRenderer', MathJax.Hub, 'CommonHTML']);
						MathJax.Hub.Queue(['Rerender', MathJax.Hub]);
						$j(this).text(disableMathJax);
						if (pqMathJaxParseErrorHappened) {
							// fix the error message's line-height CSS
							setTimeout(function() {$j('.mjx-chtml').addClass('fixLineHeight');}, 1000);
						}
					}
				});
			}
		});

	}
});

var pqMathJaxToggleInstance;
Tapestry.Initializer.pqMathJaxToggle = function(spec) {
	pqMathJaxToggleInstance = new pqMathJaxToggle(spec);
};