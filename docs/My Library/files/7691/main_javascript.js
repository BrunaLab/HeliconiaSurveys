function toggle(button, id) {
	var target = document.getElementById(id);
	var button = document.getElementById(button);
	if (target != null) {
		if (target.style.display == "block") {
			target.style.display = "none";
			button.style.background = 'url(/collection/euclid/images/tree_plus.gif) no-repeat center center';
			button.setAttribute("title", "more info");
		} else {
			target.style.display = "block";
			button.style.background = 'url(/collection/euclid/images/tree_minus.gif) no-repeat center center';
			button.setAttribute("title", "less info");
		}
	}
}

function toggle2(button, id) {
  var target = document.getElementById(id);
  var button = document.getElementById(button);
  if (target != null) {
    if (target.style.display == "none") {
      target.style.display = "block";
      button.style.background = 'url(/collection/euclid/images/tree_minus.gif) no-repeat center center';
      button.setAttribute("title","hide");
    } else {
      target.style.display = "none";
      button.style.background = 'url(/collection/euclid/images/tree_plus.gif) no-repeat center center';
      button.setAttribute("title","show");
    }
  }
}

function show(id) {
  var target = document.getElementById(id);
  if (target != null) {
    target.style.display = "block";
  }
}

function hide(id) {
  var target = document.getElementById(id);
  if (target != null) {
    target.style.display = "none";
  }
}

function checkScript() {
	if (document.primeTrial.inst.value == "") {
		alert("Please enter your Institution name.");
		document.primeTrial.inst.focus();
		return false;
	}
	if (document.primeTrial.addr1.value == "") {
		alert("Please enter your address.");
		document.primeTrial.addr1.focus();
		return false;
	}
	if (document.primeTrial.country_code.value == "") {
		alert("Please select your country.");
		return false;
	}
	if (document.primeTrial.inst_type.value == "") {
		alert("Please select your institution type.");
		return false;
	}
	if (document.primeTrial.user_pop.value == "") {
		alert("Please enter your user population.");
		document.primeTrial.user_pop.focus();
		return false;
	}
	if (document.primeTrial.name.value == "") {
		alert("Please enter your name.");
		document.primeTrial.name.focus();
		return false;
	}
	if (document.primeTrial.phone.value == "") {
		alert("Please enter your phone.");
		document.primeTrial.phone.focus();
		return false;
	}
	if (document.primeTrial.email.value == "") {
		alert("Please enter your email.");
		document.primeTrial.email.focus();
		return false;
	}
	return true;
}
var mathmlCookieName = "MathPlayerInstall";
var mathmlCookieValue = "1";
function getMathmlCookie(name) {
	var dc = document.cookie;
	var prefix = name + "=";
	var begin = dc.indexOf(prefix);
	var end = document.cookie.indexOf(";", begin);
	if (end == -1) {
		end = dc.length;
	}
	return unescape(dc.substring(begin + prefix.length, end));
}
function checkForMathPlayer() {
	if (isIEWindows()) { 
		if (ieVersion() >= 6.0) {
			if (isMPInstalled()) {
				var start = navigator.appVersion.indexOf("MathPlayer");
				if (start != -1) {
				} else {
					if (getMathmlCookie(mathmlCookieName) != "true") {
						window
								.showModelessDialog(
										"/collection/euclid/mathml/updateMP_prompt.html",
										"",
										"dialogWidth:600px;dialogHeight:200px;help:off;status:no");
					}
				}
			} else {
				if (getMathmlCookie(mathmlCookieName) != "true") {
					window
							.showModelessDialog(
									"/collection/euclid/mathml/noMP_prompt.html",
									"",
									"dialogWidth:600px;dialogHeight:200px;help:off;status:no");
				}
			}
		} else {
		}
	} else {
	}
}
function isMPInstalled() {
	try {
		var oMP = new ActiveXObject("MathPlayer.Factory.1");
		return true;
	} catch (e) {
		return false;
	}
}
function isIEWindows() {
	return ((navigator.appName == "Microsoft Internet Explorer") && (navigator.appVersion
			.indexOf("Windows") != -1));
}
function ieVersion() {
	var ieVer = 0;
	var start = navigator.appVersion.indexOf("MSIE ");
	if (start != -1) {
		ieVer = parseFloat(navigator.appVersion.substring(start + 5));
	}
	return ieVer;
}

// Disabled for MathJax
//checkForMathPlayer();


function setMathjaxCookie(cookieTimeout) {
    var mathjaxCookieName  = "MathjaxEnable";
    var value = "false";
    var cv = getMathjaxCookie();
    if (cv == "false") {
        value = "true";
    }
    else if (cv == "true") {
        value = "false";
    }
    var mathjaxCookieValue = value;
    var today             = new Date();
    var expire            = new Date();
    var nDays             = 30;
    expire.setTime(today.getTime() + 3600000*cookieTimeout);
    document.cookie = mathjaxCookieName+"="+escape(value)+";path=/;expires="+expire.toGMTString();
    window.location.reload();
}

function getMathjaxCookie() {
    var name = "MathjaxEnable";
	   var dc = document.cookie;
	   var prefix = name + "=";
	   var begin = dc.indexOf(prefix);
	   var end = document.cookie.indexOf(";", begin);
	   var returnVal;
	   if (end == -1) {
	       end = dc.length;
	   }
	   returnVal = unescape(dc.substring(begin + prefix.length, end))
	
    return returnVal;
}


function convertMath(node) {
	if (node.nodeType == 1) {
		var newnode = document.createElementNS(
				"http://www.w3.org/1998/Math/MathML", node.nodeName
						.toLowerCase());
		for ( var i = 0; i < node.attributes.length; i++)
			newnode.setAttribute(node.attributes[i].nodeName,
					node.attributes[i].nodeValue);
		for ( var i = 0; i < node.childNodes.length; i++) {
			var st = node.childNodes[i].nodeValue;
			if (st == null || st.slice(0, 1) != " " && st.slice(0, 1) != "\n")
				newnode.appendChild(convertMath(node.childNodes[i]));
		}
		return newnode;
	} else
		return node;
}
function convert() {
	var mmlnode = document.getElementsByTagName("math");
	var st, str, node, newnode;
	for ( var i = 0; i < mmlnode.length; i++)
		if (document.createElementNS != null)
			mmlnode[i].parentNode.replaceChild(convertMath(mmlnode[i]),
					mmlnode[i]);
		else {
			str = "";
			node = mmlnode[i];
			while (node.nodeName != "/MATH") {
				st = node.nodeName.toLowerCase();
				if (st == "#text")
					str += node.nodeValue;
				else {
					str += (st.slice(0, 1) == "/" ? "</m:" + st.slice(1)
							: "<m:" + st);
					if (st.slice(0, 1) != "/")
						for ( var j = 0; j < node.attributes.length; j++)
							if (node.attributes[j].nodeValue != "italic"
									&& node.attributes[j].nodeValue != ""
									&& node.attributes[j].nodeValue != "inherit"
									&& node.attributes[j].nodeValue != undefined)
								str += " " + node.attributes[j].nodeName + "="
										+ "\"" + node.attributes[j].nodeValue
										+ "\"";
					str += ">";
				}
				node = node.nextSibling;
				node.parentNode.removeChild(node.previousSibling);
			}
			str += "</m:math>";
			newnode = document.createElement("span");
			node.parentNode.replaceChild(newnode, node);
			newnode.innerHTML = str;
		}
}
