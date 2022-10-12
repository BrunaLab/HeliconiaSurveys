
var usernameValidator;

UsernameValidator = Class.create({
	
	initialize: function(spec) {
		this.lookupUrl = spec.lookupUrl;
	},
	
	getLookupUrl: function() {
		return this.lookupUrl;
	},
	
	setMessage: function(message) {
		this.message = message;
	},
	
	getMessage: function() {
		return this.message;
	}
	
});

Tapestry.Validator.username = function(field, message) {
	
	field.addValidator(function(value) {
		var checkUrl = pqCoreUtil.makeUrlRelative(usernameValidator.getLookupUrl());
		var responseText;
		
		new Ajax.Request(checkUrl, {
			method: 'post',
			parameters: {'username': value},
			onFailure: function(t)
			{
				alert('Error communicating with the server');
			},
			onException: function(t, exception)
			{
				alert('Exception: Error communicating with the server: ' + exception);
				throw exception;
			},
			onSuccess: function(t) {
				responseText = t.responseText;
				if (t.responseText == 'true') {
					// Work around problem with using throw command
					field.showValidationMessage(message);
				}
			}
		});
	});

};

Tapestry.Initializer.usernameValidator = function(spec)
{
	usernameValidator = new UsernameValidator(spec);
}
