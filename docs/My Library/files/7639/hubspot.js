'use strict';

//- <!-- Start of Async HubSpot Analytics Code -->
(function (d, s, i, r) {
  if (d.getElementById(i)) {
    return;
  }
  var n = d.createElement(s),
      e = d.getElementsByTagName(s)[0];
  n.id = i;n.src = '//js.hs-analytics.net/analytics/' + Math.ceil(new Date() / r) * r + '/2613584.js';
  e.parentNode.insertBefore(n, e);
})(document, "script", "hs-analytics", 300000);
//- <!-- End of Async HubSpot Analytics Code -->