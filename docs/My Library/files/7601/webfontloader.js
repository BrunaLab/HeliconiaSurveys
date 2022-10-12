var WebFontConfig = {
	google: {
		families: [ 'Open+Sans:400,700', 'Roboto+Slab:400,700', 'Fjalla+One', 'Indie+Flower' ]
	},
	timeout: 2000
};

(function(){
	var wf = document.createElement("script");
	wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
		'://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js';
	wf.async = 'true';
	document.head.appendChild(wf);
})();