$(document).ready(function(){
	$(".submit_search").click(function(event) {
		var select = $(this).parent().find("select");
		var search = $(this).parent().find("input.input-search");
		var type   = $(this).parent().find("input.input-type");
		searchField = select.val();
		if (searchField == '') {
			event.preventDefault();
			return false;
		} else if (searchField == 'about') {
			search.prop('name', 'q.s');
			type.val('site');
		} else if (searchField == 'q.s') {
			search.prop('name', 'q.s');
			type.val('all');
		} else {
			search.prop('name', searchField);
			type.val('index');
		}
	});
});