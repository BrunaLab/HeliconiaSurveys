!function(){"use strict";function t(t,e){return t(e={exports:{}},e.exports),e.exports}var c=t(function(t){function e(){this.listeners={}}e.prototype={on:function(t,e,n){this.listeners[t]||(this.listeners[t]=[]),this.listeners[t].push({fn:e,scope:n||null})},off:function(t,e){if(!this.listeners[t])return!1;e||(this.listeners[t]=[]);for(var n=this.listeners[t].length;n--;)this.listeners[t][n].fn===e&&this.listeners[t].splice(n,1);return this.listeners[t].length||(this.listeners[t]=null),!0},emit:function(t){for(var e=this.listeners[t]||[],n=[].slice.call(arguments,1),r=0;e[r];++r)e[r].fn.apply(e[r].scope,n)}},t.exports=e}),l=t(function(t){var a,n,s,c,l,u,e=(a=window,n={},s={},c={},l={},u={on:function(t,e,n){for(var r=t.split(/\s+/),i=0;r[i];++i)"complete"===a.document.readyState&&r[i].match(/^load(\.|$)/)?p("load",e,n):f(r[i],e,n)},off:function(t,e){for(var n=t.split(/\s+/),r=0,i=0;n[i];++i)r+=h(n[i],e)?1:0;return r},reset:function(){var t;for(t in c)r(c,t)&&a.removeEventListener(t,l[t],!1);for(t in n)r(n,t)&&n[t]&&a.cancelAnimationFrame(n[t]);s={},n={},c={},l={}},notify:function(t,e){!n[t]&&s[t]&&(n[t]=a.requestAnimationFrame(function(){!function(t,e){for(var n=s[t]||[],r=0;n[r];++r)n[r].fn.call(n[r].scope,e)}(t,e),n[t]=!1}))}},function(){return u});function r(t,e){return Object.prototype.hasOwnProperty.call(t,e)}function d(t){var e=t.split(".");return{ev:e[0],ns:e[1]||null}}function o(t,e){for(var n=[],r=0;t[r];++r)e(t[r])||n.push(t[r]);return n}function f(t,e,n){var r=d(t),i=r.ev,o=r.ns;c[i]||(l[i]=function(t){u.notify(i,t)},a.addEventListener(i,l[i],!1),c[i]=!0),s[i]||(s[i]=[]),s[i].push({fn:e,ns:o,scope:n||null})}function h(t,e){var n=d(t),r=n.ev,i=n.ns;return!!s[r]&&(s[r]=i&&e?o(s[r],function(t){return t.ns===i&&t.fn===e}):i?o(s[r],function(t){return t.ns===i}):e?o(s[r],function(t){return t.fn===e}):[],0<!s[r].length&&(s[r]=null),!0)}function p(t,e,n){a.requestAnimationFrame(function(){e.call(n||null,{type:t})})}t.exports=e}),u=t(function(t){t.exports=function(){return{create:function(d,L,t){function n(t,e){var n,r,i="c-author-popup",o="c-article-orcid",a=function(t){var e=t.querySelector("a.js-orcid"),n="";return e&&(n='<a class="'+o+'" href="'+e.getAttribute("href")+'" target="_blank" rel="noopener"><span class="'+o+'__text">View ORCID ID profile</span></a>'),n},s=e.hash.slice(1),c=e.closest("li"),l=e.cloneNode(!0);(r=(n=l)&&n.querySelector("svg"))&&n.removeChild(r);var u,d,f,h,p,v,m,y,b,g='<div role="region" id="popup-'+s+'" class="'+i+' u-font-family-serif" aria-labelledby="'+s+'"><section>';g+=(u=c,d=l.innerHTML,'<h3 id="author-'+s+'" class="c-author-popup__subheading" tabindex="0">'+d+"</h3>"+a(u)),s.match(/^group/)?g+=function(t){var e=document.getElementById(t);if(e){var n=e.cloneNode(!0),r=n.querySelector("h3"),i=n.querySelector("ul");return i&&i.classList.add("c-article-author-institutional-author__author-list--popup"),r&&r.parentNode.removeChild(r),n.innerHTML.replace(/[\r\n]/g,"")}return""}(s):(g+=(h=c,p=(f=l).getAttribute("data-corresp-id"),v=p?document.getElementById("corresp-"+p):null,m=[],y=[],b=[],Array.prototype.slice.call(h.querySelectorAll("sup > a"),0).forEach(function(t){!function(t){return t&&"true"===t.getAttribute("data-present-affiliation")}(t.nextElementSibling)&&m.push(t.hash)}),m.forEach(function(t){var e=document.querySelector(t);if(e){var n=e.querySelector(".c-article-author-affiliation__address"),r=e.getAttribute("id");if(null!==n&&b.push(n.textContent),null!==r&&-1<r.indexOf("n")){var i=e.querySelector(".js-present-address");i?y.push(i.textContent):y.push(e.textContent)}}}),b=y.concat(b),v&&b.push('<a href="'+v.getAttribute("href")+'" class="c-author-popup__link" rel="nofollow">Contact '+f.innerHTML+"</a>"),'<ul class="c-author-popup__author-list"><li>'+b.join("</li><li>")+"</li></ul>"),g+=function(t){var e=document.getElementById(t);if(e){var n=e.cloneNode(!0),r=n.querySelector(".js-search-name");return r&&r.parentNode.removeChild(r),n.innerHTML}return""}(s)),g+="</section></div>";var _=document.createElement("div");_.innerHTML=g,L.spawn(e,_.firstChild,{setFocusOn:"h3#author-"+s}).toggle(t)}var f,h,p="js-etal",v=p+"-collapsed",r="js-authors-expanded",m="u-js-hide",y="js-mq480-show-inline";(t=t||{}).etal&&function(t,e){function n(t){return t<a&&!(a===t+1&&o[t].classList.contains("c-article-author-institutional-author__author-name"))}function r(){var t=d.closest("div"),e=t?t.querySelector("h3[itemprop]"):null;return e?e.textContent:"this article"}function i(t,e,n){var r=document.createElement("li");r.className=t;var i=document.createElement("a");return i.className=p,i.setAttribute("href","javascript:;"),i.setAttribute("aria-label",e),i.setAttribute("title",e),i.innerHTML=n,r.appendChild(i),r}var o=d.querySelectorAll("li"),a=o.length;f=n(e);var s="";(h=n(t))&&!f&&(s=m+" "+y);var c="c-author-list",l=i(c+"__show-less "+m,"Show fewer authors for "+r(),"-Show fewer authors"),u=i(c+"__show-more "+s,"Show all "+a+" authors for "+r(),"[&hellip;]");(f||h)&&(d.classList.add(v),o[a-2].parentNode.insertBefore(u,o[a-2]),d.appendChild(l),Array.prototype.slice.call(o,2,a-1).forEach(function(t){f&&t.classList.add("js-author-etal"),h&&t.classList.add("js-smaller-author-etal")}))}(t.etalSmallscreen||t.etal,t.etal);d.classList.add("js-no-scroll"),Array.prototype.slice.call(d.querySelectorAll("sup > a"),0).forEach(function(t){t.setAttribute("tabIndex","-1")}),d.addEventListener("click",function(t){var e=t.target.closest("a");e&&e.classList.contains(p)?function(){var t=d.querySelectorAll("li"),e=t.length;d.classList.contains(v)?(d.classList.add(r),d.classList.remove(v),f?(t[e-4].classList.add(m),t[e-1].classList.remove(m)):h&&(t[e-4].classList.remove(y),t[e-1].classList.add(y))):(d.classList.add(v),d.classList.remove(r),f?t[e-4].classList.remove(m):h&&(t[e-4].classList.add(y),t[e-1].classList.remove(y)),t[e-1].classList.add(m)),L&&L.close()}():L&&e&&!function(t){return"sup"===(t.parentNode?t.parentNode.nodeName.toLowerCase():"")}(e)&&(n(t,e),t.preventDefault())})}}}}),d=t(function(t){var e=function(t,f){function n(t,e){return'<a href="javascript:;" class="'+t.join(" ")+'">'+e+"</a>"}function h(t){return t+"px"}function e(e){function t(t){return e.nodeName.toLowerCase()===t}var n,r,i,o,a;e&&(n=e.hasAttribute("tabindex"),r=t("a")&&e.href,i=t("button"),o=t("input"),a=t("textarea"),!e.getAttribute("disabled")&&(n||r||i||o||a)||e.setAttribute("tabindex","-1"),e.focus())}function i(t,e,n,r){this.id=e.id,this.trigger=t,this.content=e,this.group=n,this.focusSelector=r.setFocusOn||"a[href]:not(."+s+")",this.columnSelector=r.mainColSelector||".js-main-column",this.isOpen=!1,this.build()}var r="c-author-popup",p=r+"__arrow",o="u-hide-print",a="js-close",s="js-focus-catcher",v="-above",m="-below",c="click";i.prototype={build:function(){var t=n([s,"u-visually-hidden"],"Return to place in article"),e=n(["c-author-popup__close",a],"Close");this.content.insertAdjacentHTML("afterbegin",t),this.content.insertAdjacentHTML("beforeend",e+'<div class="c-author-popup__arrow c-author-popup__arrow--above"></div>'+t),this.content.classList.contains(o)||this.content.classList.add(o),f.body.appendChild(this.content)},bindEvents:function(){var e=this;e.closeListener=e.close.bind(e),e.escapeListener=e.closeOnEscape.bind(e),e.clickAwayListener=e.closeOnClickAway.bind(e),e.content.querySelector("."+a).addEventListener(c,e.closeListener),e.content.querySelectorAll("."+s).forEach(function(t){t.addEventListener("focus",e.closeListener)}),f.addEventListener("keyup",e.escapeListener),f.addEventListener(c,e.clickAwayListener),t.addEventListener("resize",e.closeListener)},unbindEvents:function(){var e=this;e.content.querySelector("."+a).removeEventListener(c,e.closeListener),e.content.querySelectorAll("."+s).forEach(function(t){t.removeEventListener("focus",e.closeListener)}),f.removeEventListener("keyup",e.escapeListener),f.removeEventListener(c,e.clickAwayListener),t.removeEventListener("resize",e.closeListener)},open:function(){this.group.close(),this.isOpen=!0,this.bindEvents(),this.content.style.display="block",this.content.style.visibility="hidden";var t=this.pos();this.content.style.top=h(t.top),this.content.style.left=h(t.left),this.content.style.right=h(t.right),this.content.style.visibility="visible",this.focus()},close:function(){this.unbindEvents(),this.isOpen=!1,this.content.style.display="none",this.returnFocus()},toggle:function(t){t&&t.stopPropagation(),this.isOpen?this.close():this.open()},closeOnEscape:function(t){27===t.keyCode&&this.close()},closeOnClickAway:function(t){t.target.closest("."+r)||this.close()},pos:function(){var t=f.documentElement,e=t.scrollTop,n=this.trigger.getClientRects()[0],r=n.top+e,i=n.left,o=this.content.querySelector("."+p),a=t.clientWidth,s=Math.min(f.querySelector(this.columnSelector).offsetWidth,a),c=r-this.content.offsetHeight-12,l=r+n.height+12,u=n.left+this.content.offsetWidth-a+20,d=v;return c<e?(d=m,o.classList.remove(p+"-"+v),o.classList.add(p+"-"+m)):(o.classList.remove(p+"-"+m),o.classList.add(p+"-"+v)),o.style.left=h(s<600?i+5:Math.max(Math.round(n.width/2-10)+(0<u?u:0),5)),{left:s<600?5:Math.max(5,i-10),right:5,top:d===v?c:l}},focus:function(){var t=this.content.querySelector(this.focusSelector);t&&e(t)},returnFocus:function(){e(this.trigger)}};function l(){this.cache={}}return l.prototype={spawn:function(t,e,n){var r=e.id;return this.cached(r)||(this.cache[r]=new i(t,e,this,n||{})),this.cache[r]},close:function(){for(var t in this.cache)this.cached(t)&&this.cache[t].isOpen&&this.cache[t].close()},cached:function(t){return Object.prototype.hasOwnProperty.call(this.cache,t)}},function(){return l}}(window,document);t.exports=e}),f=t(function(t){t.exports=function(){var r="data-expandable-label",i="["+r+"]",o="[data-expandable-box]",a="c-article-box--expanded";function s(t){var e=t.querySelector(o),n=t.querySelector(i);e.parentNode.classList.add(a),e.style.height="auto",e.setAttribute("aria-hidden","false"),n.parentNode.setAttribute("aria-expanded","true"),n.textContent="Show less",t.isOpen=!0}function c(t,e){var n=t.querySelector(o),r=t.querySelector(i);n.parentNode.classList.remove(a),n.style.height="95px",n.setAttribute("aria-hidden","true"),r.parentNode.setAttribute("aria-expanded","false"),r.textContent="Show more",e&&n.scrollIntoView(),t.isOpen=!1}return{init:function(t){(t||[]).forEach(function(t){var e=function(t){var e=t.querySelector("figcaption:first-of-type");return e&&e.textContent?e.textContent:"this box"}(t),n=['<div class="c-article-box__controls">','<div class="c-article-box__fade"></div>','<button aria-expanded="false" aria-controls="'+function(t){return t.querySelector(o).id}(t)+'"><span class="c-article-box__button-text" '+r+'></span><span class="u-visually-hidden">from '+e+"</span></button>","</div>"].join("");t.insertAdjacentHTML("beforeend",n),c(t),t.querySelector("button").addEventListener("click",function(){!function(t){t.isOpen?c(t,!0):s(t)}(t)},!1),t.addEventListener("focusin",function(){"button"!==document.activeElement.nodeName.toLowerCase()&&s(t)},!1)}),window.addEventListener("hashchange",function(){var t=location.hash?document.querySelector(location.hash):null,e=t&&t.closest(o);e&&s(e.parentNode)})}}}}),h=t(function(t){var O,B,e=(O=window,B=document,function(){var s="c-reading-companion",c="--active",t=s+"__section-item",o=t+c,v=s+"__sticky",e="rc-sec-",a="rc-",m="rc-",y="data-tab-target",b="data-component",l="aria-selected",u="aria-controls",d="tabindex",f="data-src",h="data-srcset",g=!1,p=!1,_=!1,L=0,S=Number.MAX_VALUE,x=0,E=null,k=null;function A(t,e){return Array.prototype.slice.call(t.querySelectorAll(e))}function i(t){this.html=t.querySelector("a")?function(t){var e=B.createElement("div");return e.innerHTML=t,A(e,"a").forEach(function(t){var e=B.createElement("span");e.innerHTML=t.innerHTML,t.parentNode.replaceChild(e,t)}),e.innerHTML}(t.innerHTML):t.innerHTML,this.text=t.textContent.replace(/[^a-z0-9\s]/gi,""),this.id=t.id}function q(t){var e=t.querySelector(".c-article-supplementary__title a");e?(this.id=t.id,this.caption=e.innerHTML,this.link=e.href,this.images=[this.placeholderFor(e)]):(this.id=(t.querySelector(".c-article-section__figure-caption")||{id:null}).id,this.caption=(t.querySelector("figcaption > b")||{innerHTML:"Figure"}).innerHTML,this.link=(t.querySelector(".c-article__pill-button")||{href:null}).href,this.images=this.findImages(t))}function w(t){var e=t.querySelector(".c-article-references__text");this.id=e.id,this.num=(t.querySelector(".c-article-references__counter")||{textContent:""}).textContent,this.citation=e.innerHTML,this.links=this.findLinks(t)}function n(t){this.href=t.href,this.text=t.textContent}function C(t){return B.getElementById(e+t)}function j(t,e){var n=s+"--highlighted",r="animationend";e&&(N(t),e.setAttribute(d,"-1"),e.focus(),e.classList.add(n),e.addEventListener(r,function t(){e.classList.remove(n),e.removeEventListener(r,t)}),e.scrollIntoView({block:"start"}))}function N(t,e){var n,r,i,o=E.querySelector("."+s+"__"+t),a=E.querySelector("."+s+"__panel"+c);o&&a&&(n=o.querySelector("img["+f+"]"),r=E.querySelector("button["+u+"="+o.id+"]"),n&&function(t){A(t,"picture").forEach(function(t){var e=t.querySelector("source"),n=t.querySelector("img");e.srcset=e.getAttribute(h),e.removeAttribute(h),n.src=n.getAttribute(f),n.removeAttribute(f)})}(o),a&&((i=E.querySelector("button["+u+"="+a.id+"]")).setAttribute(l,"false"),i.setAttribute(d,"-1"),i.classList.remove(s+"__tab"+c),a.classList.remove(s+"__panel"+c),a.removeAttribute(d)),r.setAttribute(l,"true"),r.removeAttribute(d),r.classList.add(s+"__tab"+c),o.classList.add(s+"__panel"+c),o.setAttribute(d,"0"),e&&e.focus&&r.focus(),g=Boolean(E.querySelector("."+s+"__panel"+c+"."+s+"__panel--full-width")),T(_&&g))}function T(t){var e=function(t){for(var e=t.split(/\s*;\s*/),n={},r=0;e[r];++r){var i=e[r].indexOf(":");n[e[r].slice(0,i)]=e[r].slice(i+1)}return n}(E.style.cssText||"");if(t){var n=E.parentNode.getBoundingClientRect().left+"px";e.left!==n&&(E.style.left=n),"10px"!==e.right&&(E.style.right="10px")}else e.left&&(E.style.left=""),e.right&&(E.style.right="")}function H(t,e){var n=k?L+(k.offsetHeight+8):L,l=B.querySelector("div["+b+"=article-container]"),r=E.querySelector("."+s+"__sections-list"),u=E.querySelector(".js-ad"),d=E.querySelector("."+s+"__tabs"),f=E.querySelector(".c-article-buy-box"),h=null,p=A(E,"."+s+"__panel:not(."+s+"__panel--full-width)");if(r){h=E.querySelector("."+s+"__sections-list").parentNode,e.on("nav.section",function(t,e){var n=e&&C(e),r=t&&C(t);n&&n.classList.remove(o),r&&(r.classList.add(o),function(t,e){var n=e.clientHeight,r=e.scrollTop+e.offsetTop,i=r+n,o=n/4,a=t.offsetTop,s=a+t.clientHeight;a<r?e.scrollTop-=r-a+o:i<s&&(e.scrollTop+=s-i+o)}(r,h))}),e.on("nav.figure",function(t){j("figures",function(t){return B.getElementById(a+t)}(t))}),e.on("nav.reference",function(t,e){var n=function(t){return B.getElementById(m+t)}(t);e&&function(t,e){var n=t.querySelector("."+s+"__return");n&&n.parentNode.removeChild(n),(n=B.createElement("a")).href="#"+e.id,n.appendChild(B.createTextNode("Return to ref "+e.textContent+" in article")),n.className=s+"__return",n.addEventListener("click",function(){n.parentNode.removeChild(n)}),t.appendChild(n)}(n,e),j("references",n)});var i=function(){var t=k?L+(k.offsetHeight+8):L,e=_,n=E.parentNode.getBoundingClientRect().top<=t,r=E.offsetHeight,i=l.getBoundingClientRect().bottom-B.documentElement.clientTop-(r+t),o=O.innerHeight,a=u?u.offsetHeight+40:0,s=v+"--stuck",c=E.classList;S=E.parentNode.parentNode.offsetWidth,!(_=c.contains(s))&&n?(c.add(s),_=!0):_&&!n&&(c.remove(s),_=!1),e!==_&&T(_&&g),_&&(h.style.maxHeight=o-(a+t+(d?80:20))+"px"),E.style.top=i<=0?i+t+"px":t+"px",S!==x&&(d&&(d.style.width=S+"px"),f&&(f.style.width=S+"px"),0<p.length&&p.forEach(function(t){t.style.maxWidth=S+"px"}),x=S)};t.on("scroll resize orientationchange",i),O.pageYOffset>n&&i(),d&&(d.addEventListener("keydown",function(t){var e,n=B.activeElement.parentNode;37===t.keyCode?e=n.previousElementSibling||E.querySelector("."+s+"__tabs > li:last-child"):39===t.keyCode&&(e=n.nextElementSibling||E.querySelector("."+s+"__tabs > li:first-child")),e&&N(e.querySelector("["+y+"]").getAttribute(y),{focus:!0})},!1),A(d,"."+s+"__tab").forEach(function(t){t.addEventListener("click",function(t){N(t.target.getAttribute(y),{focus:!0})},!1)}))}}function r(t,e){t.insertAdjacentHTML("beforebegin",e)}function M(){var t=["sections","figures","references"].map(function(t){var e=B.querySelector("."+s+"__"+t),n=function(t,e){var n={sections:function(t){var e=[];return t.forEach(function(t){e.push(new i(t))}),0<e.length?'<ul class="'+s+'__sections-list">'+e.map(function(t){return t.render()}).join("")+"</ul>":""},figures:function(t){var n=[];return t.forEach(function(t){var e=new q(t);e.id&&n.push(e)}),n.length?'<ul class="'+s+'__figures-list">'+n.map(function(t){return t.render()}).join("")+"</ul>":""},references:function(t){var e=[];return t.forEach(function(t){e.push(new w(t))}),e.length?'<ol class="'+s+"__references-list"+(e[0].num?" "+s+"__references-list--numeric":"")+'">'+e.map(function(t){return t.render()}).join("")+"</ol>":""}};return n[t]?n[t](e):""}(t,A(B,".js-"+s+"-"+t+"-item")),r=function(t,e){return'<li role="presentation"><button '+y+'="'+t+'" role="tab" id="tab-'+t+'" '+u+'="tabpanel-'+t+'" '+l+'="false" '+d+'="-1" class="'+s+'__tab">'+e+"</button></li>"}(t,t.charAt(0).toUpperCase()+t.substring(1));return n&&e?(e.setAttribute("aria-labelledby","tab-"+t),function(t,e){t.insertAdjacentHTML("afterbegin",e)}(e,'<div class="'+s+'__scroll-pane">'+n+"</div>")):e&&e.parentNode.removeChild(e),!(!n||!e)&&r}).filter(function(t){return Boolean(t)}),e=E.querySelector("."+s+"__panel"),n=t.length;return 1<n?r(e,function(t){return'<ul class="'+s+'__tabs" role="tablist">'+t.join("")+"</ul>"}(t)):1===n&&r(e,'<h3 class="'+s+'__heading u-font-family-sans">Sections</h3>'),n}return i.prototype.render=function(){return'<li id="'+e+this.id+'" class="'+t+'"><a href="#'+this.id+'" data-track="click" data-track-action="section anchor" data-track-label="link:'+this.text+'">'+this.html+"</a></li>"},q.prototype={findImages:function(t){var e=[],n=this;return A(t,"picture > img").forEach(function(t){e.push(n.placeholderFor(t))}),e},placeholderFor:function(t){var e=t.getAttribute("data-supp-info-image")||t.src,n=t.alt||"",r=-1===e.indexOf("?")?"?":"&";return["<picture>",'<source type="image/webp" '+h+'="'+e+r+'as=webp">',"<img "+f+'="'+e+'" alt="'+n+'">',"</picture>"].join("")},render:function(){return['<li class="'+s+'__figure-item">',"<figure>",'<figcaption><b class="'+s+'__figure-title u-font-family-serif" id="'+a+this.id+'">'+this.caption+"</b></figcaption>",this.images.join(""),this.link?'<p class="'+s+'__figure-links">':"",this.link?'<a href="#'+this.id+'" data-track="click" data-track-action="figure anchor" data-track-label="link">View in article</a>':"",this.link&&p?'<a href="'+this.link+'" class="'+s+'__figure-full-link" data-track="click" data-track-action="view figure" data-track-label="link">Full size image<svg width="16" height="16" class="u-icon"><use href="#global-icon-chevron-right"/></svg></a>':"",this.link?"</p>":"","</figure>","</li>"].join("")}},w.prototype.findLinks=function(t){var e=[];return A(t,".c-article-references__links a").forEach(function(t){e.push(new n(t))}),e},w.prototype.render=function(){return['<li class="'+s+'__reference-item">','<p class="'+s+'__reference-citation u-font-family-serif" id="'+m+this.id+'">'+this.citation+"</p>",0<this.links.length?'<p class="'+s+'__reference-links">'+this.links.map(function(t){return t.render()}).join("")+"</p>":"","</li>"].join("")},n.prototype.render=function(){return'<a href="'+this.href+'" data-track="click" data-track-action="outbound reference" data-track-label="link">'+this.text+"</a>&nbsp;"},{init:function(t,n,r){function e(t){!function(t){if(!i&&!t.matches&&(E=B.querySelector("["+b+"=reading-companion-sticky]"))){k=B.querySelector('[data-component="context-bar"]');var e=M();0!==e&&(H(n,r),1<e&&N("sections"),i=!0)}}(t),r.emit("rc.display",!t.matches&&i)}p=Boolean(t.access),L=t.offset||0;var i=!1,o=O.matchMedia(t.matchMediaQuery||"(max-width: 1023px)");o.addListener(e),e(o)}}});t.exports=e}),p=t(function(t){var d,f,e=(d=window,f=document,function(){var a=null,o=[],t=null,s=0,c=null,l=!1;function r(){function n(t){return t.getBoundingClientRect().top-e}var r=d.innerHeight,e=f.documentElement.clientTop,i=null;o.forEach(function(t){if(n(t)<=s+r/2)if(i){var e=f.getElementById(i);n(e)<=s-e.offsetHeight&&(i=t.id)}else i=t.id}),i!==t&&(a.emit("nav.section",i,t),t=i)}function u(e){function t(t){return e.nodeName.toLowerCase()===t}var n,r,i,o,a;e&&(n=e.hasAttribute("tabindex"),r=t("a")&&e.href,i=t("button"),o=t("input"),a=t("textarea"),!e.getAttribute("disabled")&&(n||r||i||o||a)||e.setAttribute("tabindex","-1"),e.focus())}function i(t){var e=null;if(t.target&&t.target.closest&&(e=t.target.closest("a")),e&&e.hash&&(!c||!e.closest(c))&&e.pathname===d.location.pathname){var n=function(t){var e=t.hash;return!(!e||function(t){return Boolean(t.closest(".c-reading-companion"))}(t))&&e.match(/#(Fig|f|sf)\d+/)}(e),r=!n&&function(t){var e=t.hash;if(!e)return!1;var n=f.querySelector('div[data-container-section="references"]');return n&&Boolean(n.querySelector(e))}(e),i=e.hash.slice(1),o=f.getElementById(i);if(l&&(n||r))return n?a.emit("nav.figure",i,e):r&&a.emit("nav.reference",i,e),void t.preventDefault();a.emit("nav.anchor",i,e),u(o),d.addEventListener("scroll",function t(){d.removeEventListener("scroll",t),d.scrollBy(0,-1*s)},!1)}}return{init:function(t,e,n){o=f.querySelectorAll(".js-section-title"),s=t.offset||0,c=t.exclude||"js-no-scroll",(a=n).on("rc.display",function(t){l=t}),e.on("scroll resize orientationchange",r),f.body.addEventListener("click",i,!1)}}});t.exports=e}),v=t(function(t){t.exports=function(){var r="js-get-share-url",e="js-share-url",t="js-copy-share-url",n="js-share-url-container",i="js-no-share-url-container",o="c-article-share-box",a=o+"__only-read-input--highlighted",s=null,c=null,l=!1,u=function(){return'<div class="'+o+'"><h3 class="c-article__sub-heading">Share this article</h3><p class="c-article-share-box__description">Anyone you share the following link with will be able to read this content:</p><button \t\t\tclass="js-get-share-url c-article-share-box__button" \t\t\tid="get-share-url" \t\t\tdata-track="click" \t\t\tdata-track-label="button" \t\t\tdata-track-action="get shareable link">Get shareable link</button><div class="'+i+' u-display-none" aria-hidden="true"><p class="js-c-article-share-box__no-sharelink-info c-article-share-box__no-sharelink-info">Sorry, a shareable link is not currently available for this article.</p></div><div class="'+n+' u-display-none" aria-hidden="true"><p \t\t\tclass="js-share-url c-article-share-box__only-read-input" \t\t\tid="share-url" \t\t\tdata-track="click" \t\t\tdata-track-label="button" \t\t\tdata-track-action="select share url"> \t\t</p><button \t\t\tclass="js-copy-share-url c-article-share-box__button--link-like" \t\t\tid="copy-share-url" \t\t\tdata-track="click" \t\t\tdata-track-label="button" \t\t\tdata-track-action="copy share url">Copy to clipboard</button></div><p class="js-c-article-share-box__additional-info c-article-share-box__additional-info">Provided by the Springer Nature SharedIt content-sharing initiative</p></div>'},d=function(t){c=document.querySelector("."+e),f(t).then(function(t){t.url?(c.innerHTML=t.url,h(n),p()):h(i)}).catch(function(){h(i)})},f=function(r){return new Promise(function(t,e){var n=new XMLHttpRequest;n.addEventListener("load",function(){n.readyState===n.DONE&&(200===n.status?t(JSON.parse(n.responseText)):e())}),n.open("GET",r),n.send()})},h=function(t){var e=document.querySelector("."+t),n="u-display-none",r="aria-hidden";s.classList.add(n),s.setAttribute(r,!0),e.classList.remove(n),e.classList.add("u-display-inline"),e.setAttribute(r,!1)},p=function(){document.querySelector("."+t).addEventListener("click",function(){v(c),m(),document.execCommand("copy"),setTimeout(m,500)})},v=function(t){var e=window.getSelection();t?e.selectAllChildren(t):e.removeAllRanges()},m=function(){l=l?(c.classList.remove(a),!1):(c.classList.add(a),!0)};return{init:function(t){var e=t&&t.doi?t.doi:"",n=(t&&t.url?t.url:"")+e;""!==n&&function(t){return t&&(t.innerHTML=u()),Boolean(t)}(document.querySelector('[data-component="share-box"]'))&&function(t){(s=document.querySelector("."+r)).addEventListener("click",d.bind(this,t))}(n)}}}}),m=t(function(t){t.exports=function(){return{init:function(t,e,n){(t||[]).forEach(function(t){this.bindEvents(t,e,n)},this)},bindEvents:function(t,e,n){function r(){!function(t){var e="c-table-scroll-wrapper__fade",n=e+"--transparent";0<t.scrollWidth-(t.scrollLeft+t.clientWidth)?(t.classList.add(e),t.classList.remove(n)):t.classList.add(n)}(t)}n.on("load resize",r),t.addEventListener("scroll",e(r,100),!1)}}}});var y={debounce:function(r,i,o){var a;return function(){var t=this,e=arguments,n=o&&!a;clearTimeout(a),a=setTimeout(function(){a=null,o||r.apply(t,e)},i),n&&r.apply(t,e)}}},e=function(){var t,e,n=document.querySelector('[data-component-authors-activator="authors-list"]');!function(){var t={EventEmitter:c,ShareBox:v,InternalNavigation:p,Scheduler:l,PopupGroup:d,ReadingCompanion:h,AuthorList:u,ScrollWrapper:m,Boxes:f};for(var e in Component=Component||{},t)Object.prototype.hasOwnProperty.call(t,e)&&(Component[e]=new t[e])}(),NodeList.prototype.forEach||(NodeList.prototype.forEach=Array.prototype.forEach),t=Component.EventEmitter,e={offset:10,exclude:"js-no-scroll",access:!0},Component.InternalNavigation.init(e,Component.Scheduler,t),Component.ReadingCompanion.init(e,Component.Scheduler,t);var r=$('meta[name="DOI"]').attr("content");if(Component.ShareBox.init({doi:r,url:"/shared-it?doi="}),n){var i=n.getAttribute("data-etal")||null,o=n.getAttribute("data-etal-small")||i,a=new Component.PopupGroup;Component.AuthorList.create(n,a,{etal:i,etalSmallscreen:o})}var s=y.debounce;Component.ScrollWrapper.init(document.querySelectorAll("[data-component-scroll-wrapper]"),s,Component.Scheduler),Component.Boxes.init(document.querySelectorAll("div[data-expandable-box-container]"))};"loading"===document.readyState?document.addEventListener&&document.addEventListener("DOMContentLoaded",function(){e()},!1):e()}();

//# sourceMappingURL=global-article-es5-bundle-bb21cea78d.js.map