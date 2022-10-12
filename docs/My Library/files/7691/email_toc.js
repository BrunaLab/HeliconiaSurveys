$(document).ready(function() {
	$('#add_email_toc').click(function(event) {
		event.preventDefault();
		$('#form_email_toc').submit();
		return false;
	});
	
	$("#form_email_toc").submit(function(event) {
		event.preventDefault();
		addEmailToc();
		return false;
	});
	
	if (window.location.search.indexOf('addEmailToc') > -1) {
	    addEmailToc();
	}
});

function addEmailToc() {
	var form = $('#form_email_toc');
	var url = form.prop( 'action' );
	if(typeof url != 'undefined') {
		var $loading = $('<img src="/images/loading.gif" alt="loading"/>');
		var $modal = $(document.createElement("div")).appendTo($('#email_toc_modal_container')).addClass("modal fade").append($loading.clone()).modal();
		var url = form.prop( 'action' );
		var posting = $.post( url, form.serialize() );
		posting.done(function(data) {
			$modal.html(data);
		});
	} else {
		var $modal = $(document.createElement("div")).appendTo($('#email_toc_modal_container')).addClass("modal fade").modal();
		var data = '<div class="modal-header"><a data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a><h3 id="emailTOC">Your session expired</div><div class="modal-body"><p>Your session is expired.</p><p><a href="/login?returnArgs=addEmailToc#myeuclid">Please login to MyEuclid and try again <i class="icon-arrow-right"></i></a></p></div>';
		$modal.html(data);
	}
}