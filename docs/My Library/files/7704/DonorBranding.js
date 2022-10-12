jQuery(function($) {
	$('#donorBrandingModal').modal('show');

	$('#donorBrandingModal').on('shown.bs.modal', function() {
		$('#donorBrandingButton').focus()
	})
});
