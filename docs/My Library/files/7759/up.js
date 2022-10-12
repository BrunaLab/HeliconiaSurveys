function mathjax() {
	if ((window.unsafeWindow == null ? window : unsafeWindow).MathJax == null) {

		var e = $(".tex-math");
		var mml = $(".mathml");
		if (e.length > 0) {

		  	// replace the contents of these elements with a modified version
		  	var patt = /\\\[[\s\S]*\\\]/m
		  	var inline_patt = /\\\([\s\S]*\\\)/m
		  	e.map(function(idx, de) {
		  		var m = de.innerHTML.match(patt);
		  		if(m) {
			  		de.innerHTML = m[0];
		  		}
		  		else {
		  			var m2 = de.innerHTML.match(inline_patt);
		  			if(m2) {
				  		de.innerHTML = m2[0];
		  			}
		  		}
		  	});

		  	var script = document.createElement("script");
            var config = 'MathJax.Hub.Config({' +
                                            'extensions: ["tex2jax.js"],' +
                                            'jax: ["input/TeX","output/HTML-CSS"],' +
                                            '"HTML-CSS": { scale: 100, minScaleAdjust: 100 },' +
                                            'processClass: "tex-math",' +
                                            'menuSettings: { zoom: "Hover" },' +
                                    '});' +
                                    'MathJax.Hub.Startup.onload();';
			if (window.opera) {
				script.innerHTML = config
			}
			else {
				script.text = config
			}
			script.src = "//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTML";
			document.getElementsByTagName("head")[0].appendChild(script);

			// do some selection of the element here
			e.removeClass('hidden');

			// hide mml elements
			elements = document.getElementsByClassName('mathml')
			for (var i = 0; i < elements.length; i ++){
				elements[i].style.display = "none";
			}

		  } else if (mml.length > 0 && e.length < 1) {

            var script = document.createElement("script");
            var config = 'MathJax.Hub.Config({' +
                                            'extensions: ["tex2jax.js"],' +
                                            'jax: ["input/TeX","output/HTML-CSS"],' +
                                            '"HTML-CSS": { scale: 100, minScaleAdjust: 100 },' +
                                            'processClass: "tex-math",' +
                                            'menuSettings: { zoom: "Hover" },' +
                                    '});' +
                                   'MathJax.Hub.Startup.onload();';
			if (window.opera) {
				script.innerHTML = config
			}
			else {
				script.text = config
			}
			script.src = "//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML-full";
			document.getElementsByTagName("head")[0].appendChild(script);

			// do some selection of the element here
			e.removeClass('hidden');
		}
	}
}

function record_pdf_downloads() {
	// records a pdf download event when a link tagged with the 'pdf-download'
	// class is clicked.
    $("a.pdf-download").click(function() {
    	var bits = this.href.split('/');
    	var article_id = bits.slice(-2).join("#");
    	if(article_id != null) {
	    	var res = _gaq.push(['_trackEvent', 'PDF', 'downloads', article_id]);
    	}
        return true;
    });
}

function figure_downloads() {
	var figs = $("div[id^=F]");
	$( figs ).each( function( index, element ){
	    $(this).next('div > .caption').prepend('<p class="fig-download"><i class="fa fa-download">&nbsp;</i><a target="_blank" href="' + $( this ).find('img').attr('src') +'?action=download">Original</a> | <a target="_blank" href="' + $( this ).find('img').attr('src') +'?action=ppt">PPT</a></p>' );
	});
}

function uopen_figure_downloads() {
	var figs = $("div[id^=fg]");
	$( figs ).each( function( index, element ){
	    $(this).next('div > .caption').prepend('<p class="fig-download"><i class="fa fa-download">&nbsp;</i><a target="_blank" href="' + $( this ).find('img').attr('src') +'?action=download">Original</a> | <a target="_blank" href="' + $( this ).find('img').attr('src') +'?action=ppt">PPT</a></p>' );
	});
}

function table_downloads() {
	var tables = $("div[id^=T]");
	console.log(tables);
	$( tables ).each( function( index, element ){
	    $(this).find('.caption').prepend('<p class="fig-download"><i class="fa fa-download">&nbsp;</i><a target="_blank" href="download/table/' + $( this ).attr('id') +'?type=xls">Excel</a> | <a target="_blank" href="download/table/' + $( this ).attr('id') +'?type=csv">CSV</a></p>' );
	});
}

$(document).ready(function() {
    record_pdf_downloads();
    mathjax();
    figure_downloads();
    uopen_figure_downloads();
    table_downloads();
});