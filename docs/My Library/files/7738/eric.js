function dser(s) {
    if (!s) s = window.location.search.substr(1);
    var found = false;
    var t = s.split('&');
    for (var i = 0; i < t.length; i++) {
        var kvp = t[i].split('=');
        if (kvp.length == 2) {
            var v = decodeURIComponent(kvp[1].replace(/\+/g, ' '));
            $('#sbar form :input[name="' + kvp[0] + '"]').each(function(idx, e) {
                found = true;
                if ($(this).prop('type') == 'checkbox') {
                    if ($(this).val() == v)
                        $(this).attr('checked', true);
                }
                else if (!!$(this).attr('multiple')) {
                    if (v != 'all') $(this).find('option[value="' + v + '"]').attr('selected', 'selected');
                }
                else {
                    $(this).val(v);
                }
            });
        }
    }
    return found;
}

$(function() {
    $('#i #details a.dlnk').each(function(i) {
        $(this).attr('href', $(this).attr('title'));
        $(this).attr('title', 'Run example search');
    });
    $('#r').on('click', 'td.rf_m', function(e) {
        e.preventDefault();
        $(this).closest('table').find('tr').show();
        $(this).closest('tfoot').hide();
    });
    $('#rf').on('mouseenter', 'tbody td > a:first-child', function(e) {
        e.preventDefault();
        $(this).next().show();
    });
    $('#rf').on('mouseleave', 'tbody td', function(e) {
        e.preventDefault();
        $(this).find('a:nth-child(2)').hide();
    });
    $('#tab1b').click(function(e) {
        e.preventDefault();
        $('form#f').hide();
        $('form#ft').show();
    });
    $('#tab2b').click(function(e) {
        e.preventDefault();
        $('form#f').show();
        $('form#ft').hide();
    });
    $('#main').on('click', 'input#contactsubmit', function(e) {
        $('input#contactsubmit').attr('disabled', 'disabled').attr('value', 'Please wait...');
        e.preventDefault();
        var postC = $.post('d.ashx?post=contact', $('form#contactForm').serialize());
        postC.done(function() { alert('Your message was successfully submitted'); $('input#contactsubmit').removeAttr('disabled').attr('value', 'Submit'); });
        postC.fail(function() {
            alert('Your message could not be sent. Please email ERICRequests@ed.gov directly if this error persists.');
            $('input#contactsubmit').removeAttr('disabled').attr('value', 'Submit');
        });
    });
    $('#sMore').click(function() {
        $('#divMO').toggle();
    });
    $('#divMO a').click(function(e) {
        e.preventDefault();
        $('#divMO').toggle();
    });
		$(window).scroll(function(){
		if($('FAQNav')) {
			navHeight = $('#sbar').height() + $('hr').outerHeight(true) + 10;
			if ($(this).scrollTop() > navHeight){
			  $('.FAQNav').addClass('fixed');
			} 
			else {
			  $('.FAQNav').removeClass('fixed');
			}
		}
	});	
	
	$('div.toggleBlock h3').click(function() {
		if($(this).parent().hasClass('openBlock')) {
			$(this).parent().removeClass('openBlock');
			if($(this).parent().siblings('.toggleClear').text()=='Close All') {
				$(this).parent().siblings('.toggleClear').text('Open All');
			}
		}
		else { 
			$(this).parent().addClass('openBlock'); 
			if($(this).parent().siblings('.toggleBlock').length==$(this).parent().siblings('.openBlock').length) {
				$(this).parent().siblings('.toggleClear').text("Close All");
			}
		}
	});
	
	$('a.toggleClear').click(function() {
		if($(this).text() == 'Close All'){
			$(this).parent().find('.openBlock').removeClass('openBlock');
			$(this).text("Open All");
		}
		else {
			$(this).parent().find('.toggleBlock').addClass('openBlock');
			$(this).text("Close All");
			
		}
	});
});
