jQuery(document).ready(function() {
    if(jQuery('#downloadstats_hanken').length) {
        var url = ""+window.location;
        jQuery.getJSON(
                'https://helda.helsinki.fi/simplestats-rest/hanken.php?'+url+'&jsoncallback=?')
//              'https://helda.helsinki.fi/rest/index.php?'+url+'&jsoncallback=?')
        .done(function(data) {
                jQuery('#downloadstats_hanken span').html(data.sum);
        })
        .fail(function() {
                jQuery('#downloadstats_hanken').html('Failure while getting download stats')
        });

    }

});
