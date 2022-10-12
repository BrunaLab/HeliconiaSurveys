
// Copyright 2012 Google Inc. All rights reserved.
(function(w,g){w[g]=w[g]||{};w[g].e=function(s){return eval(s);};})(window,'google_tag_manager');(function(){

var data = {
"resource": {
  "version":"180",
  
  "macros":[{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){if(document.querySelector){var a=document.querySelector(\".optanon-alert-box-wrapper\");if(a)return\"block\"===window.getComputedStyle(a).getPropertyValue(\"display\")}return!1})();"]
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"page.category.pageType"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){if(document.querySelector){var a=document.querySelector('meta[property\\x3d\"og:type\"]');return a?a.getAttribute(\"content\"):null}})();"]
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",2],8,16],",b=",["escape",["macro",3],8,16],";return a?a:b?b:null})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){return\"string\"===typeof a?a.replace(\/\u0026(?![#a-z0-9]+?;)\/g,\"and\").replace(\"\\x26amp;\",\"and\"):a}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){return\"string\"===typeof a?a.replace(\/^\\s+\/,\"\").replace(\/\\s+$\/,\"\").replace(\/\\s+\/,\" \"):a}})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.category.contentType"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",7],8,16],"||window._pageMetaData[\"WT.cg_s\"]||null})();"]
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",5],8,16],",b=",["escape",["macro",6],8,16],",c=",["escape",["macro",8],8,16],";return b(a(c))})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var b=73;return function(a){a.set(\"dimension\"+b,a.get(\"clientId\"))}})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"OnetrustActiveGroups"
    },{
      "function":"__jsm",
      "convert_true_to":"true",
      "convert_false_to":"false",
      "vtp_javascript":["template","(function(){return-1!==",["escape",["macro",11],8,16],".indexOf(\",4,\")})();"]
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "convert_false_to":"(not set)",
      "vtp_javascript":["template","(function(){return document.querySelectorAll?!!document.querySelectorAll('a[href*\\x3d\"sci-hub\"]').length:null})()();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.deliveryPlatform"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){if(JSON.parse\u0026\u0026document.querySelector){var a=document.querySelector('script[type\\x3d\"application\/ld+json\"]');return a?JSON.parse(a.textContent):null}return null})();"]
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",14],8,16],"||(",["escape",["macro",15],8,16],"?\"aws\":\"(not set)\")})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.journal.title"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",17],8,16],"||window._pageMetaData.citation_journal_title||null})();"]
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",5],8,16],",b=",["escape",["macro",6],8,16],",c=",["escape",["macro",18],8,16],";return b(a(c))})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.article.doi"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",20],8,16],";return a?a:window._pageMetaData.citation_doi\u0026\u0026\"string\"===typeof window._pageMetaData.citation_doi?window._pageMetaData.citation_doi.replace(\/^doi:\/,\"\"):null})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){return\"string\"===typeof a?a.split(\"\/\").join(\"-\"):a}})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.publishedAtString"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",23],8,16],"||window._pageMetaData.citation_date||null})();"]
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",22],8,16],",b=",["escape",["macro",24],8,16],";return a(b)})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.publishedAt"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var b=",["escape",["macro",26],8,16],";if(b)return b;try{var a=(new Date(window._pageMetaData.citation_date)).getTime();return a\u0026\u0026!isNaN(a)?a:null}catch(c){return null}})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.journal.issue"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",28],8,16],"||window._pageMetaData.citation_issue||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.journal.volume"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",30],8,16],"||window._pageMetaData.citation_volume||null})();"]
    },{
      "function":"__v",
      "convert_null_to":"(not set)",
      "convert_true_to":"1",
      "convert_false_to":"0",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.authorization.status"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",32],8,16],"||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"session.authentication.legacy.webtrendsSiteID"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",34],8,16],"||window._pageMetaData.site_id||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"user.profile.profileInfo.profileID"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",36],8,16],"||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.copyright.legacy.webtrendsLicenceType"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",38],8,16],"||\"(not set)\"})();"]
    },{
      "function":"__v",
      "convert_case_to":1,
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.copyright.legacy.webtrendsContentCategory"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",40],8,16],"||\"(not set)\"})();"]
    },{
      "function":"__v",
      "convert_case_to":1,
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.copyright.legacy.webtrendsContentCollection"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",42],8,16],"||\"(not set)\"})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.category.legacy.webtrendsContentGroup"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",44],8,16],"||window._pageMetaData.product_name||window._pageMetaData.citation_journal_title||null})();"]
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",5],8,16],",b=",["escape",["macro",6],8,16],",c=",["escape",["macro",45],8,16],";return b(a(c))})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.category.legacy.webtrendsContentSubGroup"
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",47],8,16],"||window._pageMetaData[\"WT.cg_s\"]||null})();"]
    },{
      "function":"__v",
      "convert_case_to":1,
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.category.legacy.webtrendsPrimaryArticleType"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",49],8,16],"||\"(not set)\"})();"]
    },{
      "function":"__v",
      "convert_case_to":1,
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.category.legacy.webtrendsSubjectTerms"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",51],8,16],"||\"(not set)\"})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.cms"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",53],8,16],"||(",["escape",["macro",15],8,16],"?\"polopoly\":null)})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.authors"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return(",["escape",["macro",55],8,16],"||[]).join(\";\")||window._pageMetaData.citation_authors||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.title"
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",57],8,16],"||window._pageMetaData.citation_title||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"page.attributes.template"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",59],8,16],"||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"version"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",61],8,16],"||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"page.search.keywords"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var b=",["escape",["macro",6],8,16],",a=",["escape",["macro",63],8,16],";return a?b(a):\"(not set)\"})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"user.profile.profileInfo.bpid"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",65],8,16],"||null})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"page.attributes.featureFlags"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){return!!a\u0026\u0026Array===a.constructor}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a,e){var b=",["escape",["macro",68],8,16],",d=[];if(b(a)){b=a.length;for(var c=0;c\u003Cb;++c)d.push(e(a[c]))}return d}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var b=",["escape",["macro",67],8,16],"||[],c=",["escape",["macro",69],8,16],";return c(b,function(a){return\"string\"===typeof a?a+\"\\x3dtrue\":a.name?[a.name,!!a.active].join(\"\\x3d\"):\"\"}).join(\";\")})();"]
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.features"
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var b=",["escape",["macro",69],8,16],",c=",["escape",["macro",71],8,16],"||[];return b(c,function(a){return a.name?[a.name,!!a.present].join(\"\\x3d\"):\"\"}).join(\";\")||null})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var c=",["escape",["macro",60],8,16],",a=",["escape",["macro",19],8,16],",b=",["escape",["macro",48],8,16],";b=\/^editorial$|^world view$|^muse$|^seven days$|^news$|^news q and a$|^news explainer$|^news feature$|^comment$|^books and arts$|^books and arts q and a$|^correspondence$|^obituary$|^news.*views$|^news and views forum$|^futures$|^toolbox$|^career news$|^career feature$|^career q and a$|^career brief$|^career column$|^spotlight$|^career guide$|^technology feature$|^outlook$|^nature index$|^introduction$|^outline$|^correction$|^retraction$|^clarification$|^research highlight$|^research highlights$|^nature podcast$|^innovations in$|^nature careers podcast$|^nature briefing$|^arts review$|^book review$|^essay$|^news round\/.test(b);\na=\/^nature$\/.test(a);return\/magazine\/.test(c)||!0===b\u0026\u0026!0===a?\"magazine\":\"not magazine\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",19],8,16],".concat(",["escape",["macro",73],8,16],");return\/^naturemagazine$\/.test(a)?\"magazine nature\":",["escape",["macro",73],8,16],"})();"]
    },{
      "function":"__v",
      "convert_null_to":"(not set)",
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.collection.id"
    },{
      "function":"__j",
      "vtp_name":"Krux.user"
    },{
      "function":"__j",
      "vtp_name":"Krux.segments"
    },{
      "function":"__u",
      "vtp_component":"QUERY",
      "vtp_queryKey":"mkt-key",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__v",
      "convert_null_to":"(not set)",
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.documentType"
    },{
      "function":"__v",
      "convert_null_to":"(not set)",
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"briefingRedirectSource"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=\"unsupported\";\"connection\"in navigator\u0026\u0026(a=navigator.connection.saveData?\"on\":\"off\");return a})();"]
    },{
      "function":"__v",
      "convert_null_to":"(not set)",
      "convert_undefined_to":"(not set)",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"briefingRedirectEid"
    },{
      "function":"__u",
      "vtp_component":"QUERY",
      "vtp_queryKey":"acdid",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__k",
      "vtp_decodeCookie":false,
      "vtp_name":"idp_marker"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":true,
      "vtp_defaultValue":"(not set)",
      "vtp_name":"user.profile.profileInfo.resolvedBy"
    },{
      "function":"__u",
      "vtp_component":"QUERY",
      "vtp_queryKey":"VSNUO",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__gas",
      "vtp_useDebugVersion":false,
      "vtp_useHashAutoLink":false,
      "vtp_contentGroup":["list",["map","index","2","group",["macro",4]],["map","index","3","group",["macro",9]]],
      "vtp_decorateFormsAutoLink":false,
      "vtp_cookieDomain":"auto",
      "vtp_doubleClick":false,
      "vtp_setTrackerName":true,
      "vtp_fieldsToSet":["list",["map","fieldName","customTask","value",["macro",10]],["map","fieldName","anonymizeIp","value","true"],["map","fieldName","allowAdFeatures","value",["macro",12]]],
      "vtp_trackerName":"",
      "vtp_enableLinkId":true,
      "vtp_dimension":["list",["map","index","3","dimension",["macro",13]],["map","index","4","dimension",["macro",16]],["map","index","5","dimension",["macro",19]],["map","index","6","dimension",["macro",21]],["map","index","8","dimension",["macro",25]],["map","index","9","dimension",["macro",27]],["map","index","10","dimension",["macro",29]],["map","index","11","dimension",["macro",31]],["map","index","12","dimension",["macro",33]],["map","index","13","dimension",["macro",35]],["map","index","14","dimension",["macro",37]],["map","index","16","dimension",["macro",39]],["map","index","17","dimension",["macro",41]],["map","index","18","dimension",["macro",43]],["map","index","19","dimension",["macro",46]],["map","index","20","dimension",["macro",48]],["map","index","21","dimension",["macro",50]],["map","index","22","dimension",["macro",52]],["map","index","23","dimension",["macro",54]],["map","index","25","dimension",["macro",56]],["map","index","26","dimension",["macro",58]],["map","index","27","dimension",["macro",60]],["map","index","28","dimension",["macro",62]],["map","index","30","dimension",["macro",64]],["map","index","60","dimension",["macro",9]],["map","index","61","dimension",["macro",66]],["map","index","63","dimension",["macro",70]],["map","index","72","dimension",["macro",72]],["map","index","74","dimension",["macro",74]],["map","index","65","dimension",["macro",75]],["map","index","1","dimension",["macro",76]],["map","index","2","dimension",["macro",77]],["map","index","75","dimension",["macro",78]],["map","index","78","dimension",["macro",79]],["map","index","80","dimension",["macro",80]],["map","index","79","dimension",["macro",81]],["map","index","81","dimension",["macro",82]],["map","index","82","dimension",["macro",83]],["map","index","84","dimension",["macro",75]],["map","index","86","dimension",["macro",84]],["map","index","90","dimension",["macro",85]],["map","index","91","dimension",["macro",85]],["map","index","92","dimension",["macro",86]]],
      "vtp_enableEcommerce":false,
      "vtp_trackingId":"UA-71668177-1",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false
    },{
      "function":"__u",
      "vtp_component":"PATH",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=Bootstrapper.npg.utils.Consent;return a.allow(a.PERFORMANCE)?!0:!1})();"]
    },{
      "function":"__v",
      "vtp_name":"gtm.elementUrl",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.triggers",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":true,
      "vtp_defaultValue":""
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"nonInteraction"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"eventValue"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"eventCategory"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"eventAction"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"eventLabel"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",2],8,16],",b=",["escape",["macro",3],8,16],";return a?a:b?b:null})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",97],8,16],";return a\u0026\u0026\"journal\"===a?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=Bootstrapper.npg.utils.Consent;return a.allow(a.TARGETING)?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=\/iPad\/.test(navigator.userAgent)?\"t\":\/Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk\/.test(navigator.userAgent)?\"m\":\"d\";return a})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",97],8,16],";return!a||\"article\"!==a\u0026\u0026\"figure\"!==a\u0026\u0026\"issue\"!==a\u0026\u0026\"table\"!==a\u0026\u0026\"metrics\"!==a\u0026\u0026\"compound\"!==a\u0026\u0026\"scheme\"!==a?!1:!0})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",97],8,16],";return!a||\"search_results\"!==a\u0026\u0026\"journal-info\"!==a\u0026\u0026\"collection\"!==a\u0026\u0026\"publisher-level-subject\"!==a\u0026\u0026\"journal-articles\"!==a\u0026\u0026\"advanced_search\"!==a\u0026\u0026\"volume\"!==a\u0026\u0026\"journal-level-subject\"!==a\u0026\u0026\"site-index\"!==a\u0026\u0026\"magazine-index-page\"!==a\u0026\u0026\"volumes\"!==a\u0026\u0026\"contact\"!==a\u0026\u0026\"collection-articles\"!==a\u0026\u0026\"collections\"!==a\u0026\u0026\"subjects-homepage\"!==a\u0026\u0026\"journal-subjects\"!==a\u0026\u0026\"collection-info\"!==a\u0026\u0026\"static\"!==a\u0026\u0026\"issue-page\"!==a\u0026\u0026\"magazine-index-latest-careers\"!==a\u0026\u0026\"magazine-index-latest-news\"!==\na\u0026\u0026\"nature-briefing-unsubscribe-page\"!==a\u0026\u0026\"magazine-index-latest-research-analysis\"!==a\u0026\u0026\"magazine-index-latest-opinion\"!==a\u0026\u0026\"magazine-index-latest-books-culture\"!==a?!1:!0})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return null})();"]
    },{
      "function":"__u",
      "vtp_component":"URL",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__v",
      "vtp_name":"gtm.scrollThreshold",
      "vtp_dataLayerVersion":1
    },{
      "function":"__aev",
      "vtp_setDefaultValue":false,
      "vtp_varType":"ATTRIBUTE",
      "vtp_attribute":"data-track-action"
    },{
      "function":"__u",
      "vtp_component":"HOST",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.journal.pcode"
    },{
      "function":"__u",
      "vtp_component":"PROTOCOL",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=Bootstrapper.npg.utils.Consent;return a.allow(a.FUNCTIONAL)?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",104],8,16],";return a\u0026\u0026(-1\u003Ca.indexOf(\"test-www\")||-1\u003Ca.indexOf(\"local-www\"))?\"\/\/recommended-qa.springernature.app\/latest\/generated\/entry-point.js\":\"\/\/recommended.springernature.com\/latest\/generated\/entry-point.js\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a={journal:1,\"journal-info\":1,Collections:1,\"site-index\":1,advanced_search:1,search_results:1,\"subjects-homepage\":1,\"publisher-level-subject\":1,\"journal-level-subject\":1,\"journal-subjects\":1,\"journal-articles\":1,volumes:1,volume:1,issue:1,\"magazine-index-page\":1,\"magazine-index-latest-careers\":1,\"magazine-index-latest-news\":1,\"magazine-index-latest-research-analysis\":1,\"magazine-index-latest-opinion\":1,\"magazine-index-latest-books-culture\":1,collection:1,\"collection-info\":1,article:1,\nfigure:1,table:1,metrics:1,compound:1,scheme:1,contact:1};return a.hasOwnProperty(",["escape",["macro",2],8,16],")})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(b){if(b){var a=null,c=",["escape",["macro",67],8,16],";c\u0026\u0026(a=c.find(function(a){return a.name===b\u0026\u0026a.active}));return a\u0026\u0026a.active?!0:!1}}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",113],8,16],"(\"ab_test_magazine_institution_survey\")})();"]
    },{
      "function":"__k",
      "vtp_decodeCookie":false,
      "vtp_name":"ab_test_magazine_institution_survey"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",113],8,16],"(\"ab_test_magazine_paywall\")})();"]
    },{
      "function":"__k",
      "vtp_decodeCookie":false,
      "vtp_name":"ab_test_magazine_paywall"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":true,
      "vtp_defaultValue":"(not set)",
      "vtp_name":"backHalfContent"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.copyright.open"
    },{
      "function":"__jsm",
      "convert_case_to":1,
      "convert_null_to":"(not set)",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",5],8,16],",b=",["escape",["macro",6],8,16],",c=",["escape",["macro",8],8,16],";return b(a(c))})();"]
    },{
      "function":"__jsm",
      "convert_null_to":"(not set)",
      "convert_true_to":"granted",
      "convert_false_to":"denied",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",32],8,16],"||null})();"]
    },{
      "function":"__f",
      "vtp_component":"URL"
    },{
      "function":"__v",
      "convert_null_to":"fish",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.attributes.copyright.open"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return window.ga.getAll()[0].get(\"clientId\")})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var b=",["escape",["macro",77],8,16],";b=\/t8x81149p|t8x84p76g|t8x88awao|t8x9alusn\/.test(b);var a=",["escape",["macro",76],8,16],";a=\/[a-z]\/.test(a);return!0===b\u0026\u0026!0===a?\"usabilla survey SciRep ACD\":!0===a?\"usabilla survey\":\"do not include\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(){var a=",["escape",["macro",114],8,16],"?\"ab_test_magazine_institution_survey\":\"ab_test_magazine_paywall\";window.Cookies.set(a,\"submitted\",{expires:31536E3,domain:\".nature.com\"})}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(){function e(c){var a=c.target;a=null!==a.getAttribute(\"href\")||null!==a.getAttribute(\"xlink:href\")||a.parentElement.classList.contains(\"paywall-box__button\");c.preventDefault();a\u0026\u0026(",["escape",["macro",126],8,16],"(),b.removeEventListener(\"click\",d,!1))}var b=document.querySelector(\"#usabilla-paywall-widget-container\");var d=e.bind(this);b\u0026\u0026b.addEventListener(\"click\",d,!1)}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){return\"object\"===typeof a\u0026\u0026null!==a}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a,b){do{if(b(a))return a;a=a.parentNode}while(a)}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(d,b,c){var e=",["escape",["macro",129],8,16],";return e(d,function(a){return a.hasAttribute\u0026\u0026a.hasAttribute(b)\u0026\u0026(\"undefined\"===typeof c||a.getAttribute(b)===c)})}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a,b){var c=",["escape",["macro",68],8,16],";return\"array\"===b\u0026\u0026!0===c(a)||typeof a===b?a:null}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(b,f){var g=",["escape",["macro",130],8,16],",d=function(){var c=g(b,\"data-track-component\");if(c)return c.getAttribute(\"data-track-component\");c=",["escape",["macro",59],8,16],";var a=",["escape",["macro",2],8,16],";return c\u0026\u0026a?c+\":\"+a:c||a||\"\"},a=function(){var a=g(b,\"data-track-component\");return a?a.getAttribute(\"data-track-component\")+\":\"+f:f};a=b.getAttribute(\"data-track-action\")||a();d=b.getAttribute(\"data-track-category\")||d();var e;(e=b.getAttribute(\"data-track-label\"))||(e=b.href\u0026\u0026window.location.hostname!==\nb.hostname?b.href:null);a={action:a,category:d,label:e};return a.label?a:null}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(a){window.dataLayer.push({event:\"interactive-event\",eventAction:a.action,eventCategory:a.category,eventLabel:a.label||void 0,eventValue:a.value||void 0,nonInteraction:a.nonInteraction||!1})}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return function(b,a){var c=",["escape",["macro",130],8,16],",d=",["escape",["macro",132],8,16],",e=",["escape",["macro",133],8,16],";(b=c(b,\"data-track\",a))\u0026\u0026(a=d(b,a))\u0026\u0026e(a)}})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return\"nature\"===",["escape",["macro",108],8,16],"\u0026\u0026\"journal\"===",["escape",["macro",2],8,16],"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return ",["escape",["macro",113],8,16],"(\"ab_use_nature_150_split_header\")})();"]
    },{
      "function":"__c",
      "vtp_value":"5dde6c3893906e530d7270d7"
    },{
      "function":"__c",
      "vtp_value":"5dde7c19658b762edd212ee4"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.contentInfo.author"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"session.authentication.authenticationID"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"content.journal.section"
    },{
      "function":"__gas",
      "vtp_cookieDomain":"auto",
      "vtp_doubleClick":false,
      "vtp_setTrackerName":false,
      "vtp_useDebugVersion":false,
      "vtp_useHashAutoLink":false,
      "vtp_decorateFormsAutoLink":false,
      "vtp_enableLinkId":false,
      "vtp_enableEcommerce":false,
      "vtp_trackingId":"UA-71668177-1",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false
    },{
      "function":"__u",
      "vtp_component":"FRAGMENT",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__u",
      "vtp_component":"QUERY",
      "vtp_queryKey":"productId",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",80],8,16],",b=",["escape",["macro",82],8,16],";return a||b?!0:!1})();"]
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_name":"gtm.element",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementClasses",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementId",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementTarget",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.element",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementClasses",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementId",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementTarget",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementUrl",
      "vtp_dataLayerVersion":1
    },{
      "function":"__aev",
      "vtp_varType":"TEXT"
    },{
      "function":"__v",
      "vtp_name":"gtm.scrollUnits",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.scrollDirection",
      "vtp_dataLayerVersion":1
    }],
  "tags":[{
      "function":"__html",
      "priority":9999,
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003EBootstrapper=window.Bootstrapper||{};Bootstrapper.npg=Bootstrapper.npg||{};Bootstrapper.npg.utils=Bootstrapper.npg.utils||{};\nBootstrapper.npg.utils.Consent=function(){var c=function(){for(var b=document.cookie.split(\/;\\s*\/),a=0;b[a];++a)if(-1!==b[a].indexOf(\"OptanonConsent\\x3d\"))return b[a].split(\"\\x3d\").slice(1).join(\"\\x3d\");return\"\"};c=unescape(c());var d=(\/groups=([^\u0026]+)\/.exec(c)||[\"\",\"\"])[1].split(\",\");return{STRICTLY_NECESSARY:1,PERFORMANCE:2,FUNCTIONAL:3,TARGETING:4,allow:function(b){if(b===this.STRICTLY_NECESSARY)return!0;for(var a=0;d[a];++a)if(d[a]===b+\":0\")return!1;return!0}}}();\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":13
    },{
      "function":"__opt",
      "priority":99,
      "metadata":["map"],
      "once_per_load":true,
      "vtp_overrideGaSettings":false,
      "vtp_optimizeContainerId":"GTM-P8FX28R",
      "vtp_gaSettings":["macro",87],
      "tag_id":58
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":true,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"OneTrust Cookie Consent",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"Banner Display",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":1
    },{
      "function":"__ua",
      "teardown_tags":["list",["tag",55,0]],
      "once_per_event":true,
      "vtp_overrideGaSettings":false,
      "vtp_trackType":"TRACK_PAGEVIEW",
      "vtp_gaSettings":["macro",87],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "tag_id":36
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":true,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Collections Event Exit",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"Exit Click",
      "vtp_eventLabel":["macro",90],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":39
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":["macro",92],
      "vtp_overrideGaSettings":false,
      "vtp_eventValue":["macro",93],
      "vtp_eventCategory":["macro",94],
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":["macro",95],
      "vtp_eventLabel":["macro",96],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":43
    },{
      "function":"__crto",
      "once_per_event":true,
      "vtp_accountId":"60881",
      "vtp_tagType":"HOME_TAG",
      "vtp_siteType":["macro",100],
      "tag_id":48
    },{
      "function":"__crto",
      "once_per_event":true,
      "vtp_accountId":"60881",
      "vtp_productID":["macro",21],
      "vtp_tagType":"PRODUCT_TAG",
      "vtp_siteType":["macro",100],
      "tag_id":49
    },{
      "function":"__crto",
      "once_per_event":true,
      "vtp_accountId":"60881",
      "vtp_tagType":"LISTING_TAG",
      "vtp_listingID":["macro",103],
      "vtp_siteType":["macro",100],
      "tag_id":50
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"reading",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"30-seconds-reading",
      "vtp_eventLabel":["macro",20],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":51
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":true,
      "vtp_eventCategory":"scroll-depth",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"scrolling",
      "vtp_eventLabel":["template",["macro",105],"%"],
      "vtp_enableEcommerce":false,
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":63
    },{
      "function":"__baut",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_tagId":"12000044",
      "vtp_uetqName":"uetq",
      "vtp_eventType":"PAGE_LOAD",
      "tag_id":66
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"magazine test paywall",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"in view",
      "vtp_eventLabel":"paywall box",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":76
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Nature Magazine Institution Survey",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"in view",
      "vtp_eventLabel":"institution survey",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":77
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Article body",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"author link - publication",
      "vtp_eventLabel":"link",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":311
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Article body",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"author link - pubmed",
      "vtp_eventLabel":"link",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":314
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Article body",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",87],
      "vtp_eventAction":"author link - scholar",
      "vtp_eventLabel":"link",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":315
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_77",
      "tag_id":361
    },{
      "function":"__tl",
      "vtp_eventName":"gtm.timer",
      "vtp_interval":"30000",
      "vtp_limit":"1",
      "vtp_uniqueTriggerId":"10482319_145",
      "tag_id":362
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_150",
      "tag_id":363
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_151",
      "tag_id":364
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_152",
      "tag_id":365
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_153",
      "tag_id":366
    },{
      "function":"__sdl",
      "vtp_verticalThresholdUnits":"PERCENT",
      "vtp_verticalThresholdsPercent":"25,50,75,100",
      "vtp_verticalThresholdOn":true,
      "vtp_triggerStartOption":"WINDOW_LOAD",
      "vtp_horizontalThresholdOn":false,
      "vtp_uniqueTriggerId":"10482319_193",
      "vtp_enableTriggerStartOption":true,
      "tag_id":367
    },{
      "function":"__evl",
      "vtp_elementId":"gtm-usabilla-survey-widget",
      "vtp_useOnScreenDuration":false,
      "vtp_useDomChangeListener":true,
      "vtp_firingFrequency":"ONCE",
      "vtp_selectorType":"ID",
      "vtp_onScreenRatio":"100",
      "vtp_uniqueTriggerId":"10482319_289",
      "tag_id":368
    },{
      "function":"__evl",
      "vtp_elementId":"usabilla-paywall-widget-container",
      "vtp_useOnScreenDuration":false,
      "vtp_useDomChangeListener":true,
      "vtp_firingFrequency":"ONCE",
      "vtp_selectorType":"ID",
      "vtp_onScreenRatio":"100",
      "vtp_uniqueTriggerId":"10482319_290",
      "tag_id":369
    },{
      "function":"__sdl",
      "vtp_verticalThresholdUnits":"PERCENT",
      "vtp_verticalThresholdsPercent":"25,50,75,100",
      "vtp_verticalThresholdOn":true,
      "vtp_triggerStartOption":"WINDOW_LOAD",
      "vtp_horizontalThresholdOn":false,
      "vtp_uniqueTriggerId":"10482319_294",
      "vtp_enableTriggerStartOption":true,
      "tag_id":370
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_312",
      "tag_id":371
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_313",
      "tag_id":372
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"10482319_316",
      "tag_id":373
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003Efunction splitKeys(b){var k=[],g=\"\",f=[],l=b.split(\";\");for(b=0;b\u003Cl.length;++b){void 0!==n\u0026\u0026(g=n);var h=l[b].split(\"\\x3d\");var n=h[0];n!==g\u0026\u0026(0\u003Cg.length\u0026\u00260\u003Ck.length\u0026\u0026f.push([g,k]),k=[]);if(2===h.length\u0026\u0026\"\"!==h[0]\u0026\u0026\"\"!==h[1]){var r=h[1].split(\",\");for(h=0;h\u003Cr.length;++h)k.push(r[h])}}0\u003Cn.length\u0026\u00260\u003Ck.length\u0026\u0026f.push([n,k]);return f}\nfunction getScript(b,k){var g=document.createElement(\"script\"),f=document.getElementsByTagName(\"script\")[0];g.async=1;g.onload=g.onreadystatechange=function(l,h){if(h||!g.readyState||\/loaded|complete\/.test(g.readyState))g.onload=g.onreadystatechange=null,g=void 0,h||k\u0026\u0026k()};g.src=b;f.parentNode.insertBefore(g,f)}\nfunction splitSizes(b){var k=[];if(null!==b){var g=-1!==b.indexOf(\"|\")?b.split(\"|\"):b.split(\",\");for(b=0;b\u003Cg.length;++b){var f=g[b].split(\"x\");var l=parseInt(f[0],10);var h=parseInt(f[1],10);2===f.length\u0026\u0026!isNaN(l)\u0026\u0026!isNaN(h)\u0026\u00260\u003C=l\u0026\u00260\u003C=h\u0026\u0026k.push([l,h])}}return k}function hasClass(b,k){var g,f=b.className.split(\/\\s+\/);b=0;for(g=f.length;b\u003Cg;++b)if(f[b]===k)return!0;return!1}\nfunction getAdContainers(){if(\"function\"===typeof document.getElementsByClassName)return document.getElementsByClassName(\"div-gpt-ad\");var b,k=[],g=document.getElementsByTagName(\"div\");for(b=0;g[b];++b)hasClass(g[b],\"div-gpt-ad\")\u0026\u0026k.push(g[b]);return k}function debounce(b,k){var g=null,f=null;return function(){var l=this,h=+new Date,n=arguments;g\u0026\u0026h\u003Cg+k?(clearTimeout(f),f=setTimeout(function(){g=h;b.apply(l,n)},k)):(g=h,b.apply(l,n))}}\nfunction addResizeEvent(b){window.addEventListener?window.addEventListener(\"resize\",b,!1):window.attachEvent(\"resize\",b)}function addScrollEvent(b){window.addEventListener?window.addEventListener(\"scroll\",b,!1):window.attachEvent(\"onscroll\",b)}function removeScrollEvent(b){window.removeEventListener?window.removeEventListener(\"scroll\",b,!1):window.detachEvent(\"scroll\",b)}function serveAdsFor(b){return-1!==b.indexOf(\"\/naturejobs\")?!1:!0}\nfunction initAds(b,k){var g=Bootstrapper.npg.utils,f=[],l,h=null;if(-1===b.location.search.indexOf(\"hide_ads\\x3dtrue\")\u0026\u0026serveAdsFor(b.location.pathname)){var n=function(a){var d=Math.max(k.clientHeight,b.innerHeight||0);return r(a,function(c){if(c.isOutOfPage||c.forceLoadOnInit)return!0;var e=document.getElementById(c.divId),m=e.getBoundingClientRect();m=m.top-300;m=d\u003Em;var p=null!==e.offsetParent;c=c.sizeArray\u0026\u0026c.sizeArray.length\u0026\u0026c.sizeArray[0].length\u0026\u00262===c.sizeArray[0][0];e=e.getAttribute(\"data-ad-type\")?\n-1===e.getAttribute(\"data-ad-type\").indexOf(\"top\"):!1;var u=770\u003Eb.innerWidth;return m\u0026\u0026p\u0026\u0026!1===u||c||m\u0026\u0026p\u0026\u0026u\u0026\u0026e})},r=function(a,d){for(var c=a.length,e=[];c--;)d(a[c],c)\u0026\u0026(e.push(a[c].slot),a.splice(c,1));e.length\u0026\u0026googletag.pubads().refresh(e);return a},t={\"career feature\":!0,\"career news\":!0,\"career q\\x26a\":!0,\"career brief\":!0,\"career column\":!0,spotlight:!0,\"career guide\":!0,\"technology feature\":!0,\"nature careers podcast\":!0},z=function(){var a=b.dataLayer?",["escape",["macro",108],8,16],":null;if(a)return a;\nif(-1!==b.location.hostname.indexOf(\"guide.labanimal\"))return a=b.location.pathname,a=-1!==a.indexOf(\"categ\")?\"products\":-1!==a.indexOf(\"supplier\")?\"suppliers\":\"homepage\",\"laban\/guide.labanimal\/\"+a;a=b.location.pathname.replace(\/^\\\/+\/,\"\").split(\"\/\");var d=b.location.hostname.split(\".\").slice(1).join(\".\");return a.length\u0026\u0026\"\"!==a[0]?a[0]:d},A=function(a){var d=\"\/270604982\";0!==a.indexOf(\"\/\")\u0026\u0026(a=\"\/\"+a);0===a.indexOf(\"\/285\/\")\u0026\u0026(a=a.replace(\/^\\\/285\\\/[^\\\/]+\/,d+\"\/nature\/\"+z()));a=a.replace(\"\/nature\/laban\",\n\"\/laban\");a=a.replace(\"\/nature\/nature.com\/index\",\"\/nature\/nature\/homepage\");a=a.replace(\"\/collections\/collections\",\"\/collections\");a=a.replace(\"\/search\/search_results\",\"\/nature\/search\");a=a.replace(\/\\\/article$\/,\"\/articles\");a=a.replace(\/\\\/nature\\\/authors\\\/.*\/,\"\/nature\/nature\/authors\");-1!==b.location.hostname.indexOf(\"blogs\")\u0026\u0026(a=a.replace(\/\\\/nature\\\/.*\/,\"\/nature\/nature\/blogs\"));-1!==b.location.hostname.indexOf(\"natureindex\")\u0026\u0026(a=a.replace(\/\\\/nature\\\/.*\/,\"\/nature\/nature_index\"),\"\/\"===b.location.pathname\u0026\u0026\n(a+=\"\/homepage\"));window.dataLayer\u0026\u0026t[",["escape",["macro",7],8,16],"]\u0026\u0026(a=a.replace(\/\\\/articles$\/,\"\/naturecareers\"));a:{if(\/^\\\/nature\\\/articles\\\/?$\/.test(window.location.pathname)){var c=(\/^.*?(?:\\?|\u0026)type=([^\u0026]+)\/.exec(b.location.search)||[\"\",\"\"])[1];if(t[c.replace(\/-\/g,\" \").replace(\/ and \/,\"\\x26\")]){c=!0;break a}}c=!1}c\u0026\u0026(a=a.replace(\/\\\/article-list$\/,\"\/naturecareers\"));(c=document.querySelector('meta[name\\x3d\"brandedcontent\"]'))\u0026\u0026\"true\"===c.getAttribute(\"content\")\u0026\u0026(a=d+\"\/nature\/brandedcontent\");return a},\nB=function(a){for(var d={},c=0;a[c];++c){var e=a[c].size;var m=\"2x2\"===a[c].size?window.dataLayer\u0026\u0026\"core media\"===",["escape",["macro",53],8,16],"\u0026\u0026-1!==b.location.pathname.indexOf(\"\/articles\/\")?3:0:0;d[e]={count:m,name:a[c].name}}return d}([{size:\"728x90\",name:\"LB\"},{size:\"300x250\",name:\"MPU\"},{size:\"160x600\",name:\"SKY\"},{size:\"970x250\",name:\"BB\"},{size:\"2x2\",name:\"NATIVE\"},{size:\"300x100\",name:\"REC\"},{size:\"180x150\",name:\"EVENTS\"},{size:\"160x60\",name:\"TILE\"}]),q=function(a,d,c,e){for(var m=!1,p=0;a[p];++p)a[p][0]===\nd\u0026\u0026null!==c\u0026\u0026(a[p][1]=e?a[p][1].concat(c):[c],m=!0);m||null===c||a.push([d,[c]]);return a},v=function(a,d,c){for(var e=0;a[e];++e)a[e][0]===d\u0026\u0026(a[e][0]=c);return a},C=function(a,d){var c=a;var e=-1!==b.location.search.indexOf(\"test\\x3dads\")?\";adtype\\x3dtest\":\"\";c=c.getAttribute(\"data-gpt-targeting\");e\u0026\u0026-1===c.indexOf(e)\u0026\u0026(c+=e);(e=",["escape",["macro",65],8,16],")\u0026\u0026(c+=\";bpid\\x3d\"+e.replace(\/;\/g,\",\"));0===b.location.pathname.indexOf(\"\/collections\/\")\u0026\u0026(e=document.querySelector(\"span.hero-title-inner\"))\u0026\u0026(c+=\n\";sponsored\\x3d\"+e.innerText.replace(\/^\\s+\/,\"\").replace(\/\\s+$\/,\"\").replace(\/\\s+\/g,\"_\").replace(\/\\W+\/g,\"\"));c=v(splitKeys(c),\"artid\",\"articleid\");c=v(c,\"kw\",\"search\");a=a.getAttribute(\"data-gpt-sizes\");a=(a=B[a])?a.name+ ++a.count:null;a=q(c,\"pos\",a);d=q(a,\"tile\",d+1);a=b.location.pathname.split(\"\/\");a=3===a.length\u0026\u0026\"subjects\"===a[1]?a[2]:null;d=q(d,\"subject\",a);d=q(d,\"article\",window.dataLayer\u0026\u0026t[",["escape",["macro",7],8,16],"]?\"naturecareers\":null);a=window.dataLayer?",["escape",["macro",75],8,16],":null;d=q(d,\"collectionID\",\na);return d=q(d,\"type\",window.dataLayer\u0026\u0026\"core media\"===",["escape",["macro",53],8,16],"?\"fronthalf\":null,!0)},w=function(a){for(var d=[],c=0;a[c];++c){var e=a[c];d.push({divId:e.getAttribute(\"id\"),adUnitPath:A(e.getAttribute(\"data-gpt-unitpath\")),sizeArray:splitSizes(e.getAttribute(\"data-gpt-sizes\")),targeting:C(e,c),isOutOfPage:hasClass(e,\"out-of-page\"),forceLoadOnInit:!1,refreshed:!1})}return d},x=function(){googletag.cmd.push(function(){googletag.pubads().setRequestNonPersonalizedAds(g.Consent.allow(g.Consent.TARGETING)?\n0:1);googletag.pubads().disableInitialLoad();googletag.enableServices();var a={};googletag.pubads().addEventListener(\"slotRenderEnded\",function(d){var c=d.slot\u0026\u0026d.slot.getSlotElementId?d.slot.getSlotElementId():null,e;a[c]=!d.isEmpty;(a[\"div-gpt-ad-native-2\"]||a[\"div-gpt-ad-native-1\"])\u0026\u0026(e=document.querySelector(\".c-paid-content\"))\u0026\u0026e.classList.remove(\"hide\");\"div-gpt-ad-billboard-2\"===c\u0026\u0026!1===d.isEmpty\u0026\u0026(e=document.getElementById(c),e.parentNode.parentNode.classList.add(\"pb40\"),e.parentNode.parentNode.classList.remove(\"pb20\"),\ne.parentNode.parentNode.classList.remove(\"hide\"));c\u0026\u0026d.isEmpty\u0026\u0026(e=document.getElementById(c),e.parentNode.parentNode.classList.remove(\"pb20\"),e.parentNode.classList.remove(\"ad-with-label\"))})});googletag.cmd.push(function(){for(var a=0;f[a];++a)try{f[a].slot=f[a].isOutOfPage?googletag.defineOutOfPageSlot(f[a].adUnitPath,f[a].divId).addService(googletag.pubads()):googletag.defineSlot(f[a].adUnitPath,f[a].sizeArray,f[a].divId).addService(googletag.pubads());for(var d=0,c=f[a].targeting.length;d\u003Cc;++d)if(2===\nf[a].targeting[d].length\u0026\u0026\"\"!==f[a].targeting[d][0]\u0026\u0026\"\"!==f[a].targeting[d][1]){if(\"pos\"===f[a].targeting[d][0]\u0026\u00260===f[a].targeting[d][1][0].indexOf(\"BB\")){l=f[a].slot;var e=googletag.sizeMapping().addSize([970,250],[3,3]).addSize([770,100],[4,4]).addSize([0,0],[5,5]).build();l.defineSizeMapping(e);l.setCollapseEmptyDiv(!0,!1)}f[a].slot.setTargeting(f[a].targeting[d][0],f[a].targeting[d][1])}}catch(m){console.log(\"failed to create slot for\",f[a])}});googletag.cmd.push(function(){for(var a=0;f[a];++a)googletag.display(f[a].divId)})},\ny=function(){h\u0026\u0026removeScrollEvent(h);googletag.cmd.push(function(){f=n(f)});h=debounce(function(){googletag.cmd.push(function(){f=n(f);f.length||(removeScrollEvent(h),h=null)})},250);addScrollEvent(h)};getScript(\"\/\/www.googletagservices.com\/tag\/js\/gpt.js\",function(){b.googletag=b.googletag||{};b.googletag.cmd=b.googletag.cmd||[];f=w(getAdContainers());x();y();var a=969\u003Cb.innerWidth,d=769\u003Cb.innerWidth\u0026\u0026!a,c=770\u003Eb.innerWidth,e=debounce(function(){var m=b.innerWidth;970\u003C=m\u0026\u0026!a?(a=!0,c=d=!1,googletag.cmd.push(function(){googletag.pubads().refresh([l])})):\n770\u003Em\u0026\u0026!c?(d=a=!1,c=!0,googletag.cmd.push(function(){googletag.pubads().refresh([l])})):970\u003Em\u0026\u0026769\u003Cm\u0026\u0026!d\u0026\u0026(a=!1,d=!0,c=!1,googletag.cmd.push(function(){googletag.pubads().refresh([l])}))},250);addResizeEvent(e);document.addEventListener(\"refreshads\",function(){googletag.destroySlots();f=w(getAdContainers());x();y()},!1)})}}\n-1===window.location.hostname.indexOf(\"nature.com\")\u0026\u0026(\"complete\"===document.readyState||\"loaded\"===document.readyState||\"interactive\"===document.readyState?initAds(window,document.documentElement):document.addEventListener(\"load\",function(){initAds(window,document.documentElement)}));document.addEventListener(\"permutiveready\",function(){initAds(window,document.documentElement)},!1);\u003C\/script\u003E\n"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":16
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E(function(){var a=document,b=a.getElementsByTagName(\"script\")[0];s=a.createElement(\"script\");s.type=\"text\/javascript\";s.async=!0;s.src=\"\/\/optanon.blob.core.windows.net\/consent\/ce47efd6-7cab-4c50-806d-b2e4fc5cd34d.js\";b.parentNode.insertBefore(s,b)})();function OptanonWrapper(){};\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":23
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar filterMeta=function(b){for(var c=[],a=0;b[a];++a)b[a].name\u0026\u0026c.push(b[a]);return c},translateMeta=function(b){var c={\"WT.cg_n\":\"product_name\",\"WT.site_id\":\"site_id\",\"WT.site_id_name\":\"site_id_name\",\"WT.registrant_id\":\"user_id\"};return c[b]||b},getMeta=function(b){var c=filterMeta(document.getElementsByTagName(\"meta\")||[]),a=document.getElementsByTagName(\"body\")||[],f=function(){for(var a=c.length,d={},e;a--;)if(e=translateMeta(c[a].name))d[e]?(\"string\"===typeof d[e]\u0026\u0026(d[e]=[d[e]]),d[e].push(c[a].content)):\nd[e]=c[a].content||\"\";d.keywords\u0026\u0026(d.keywords=d.keywords.replace(\/,\/g,\";\"));b(d)};a.length?f():c.length\u0026\u0026f()};getMeta(function(b){window._pageMetaData=b});\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":24
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E(function(){var h=function(d,f,g,h){this.get=function(a){a+=\"\\x3d\";for(var b=document.cookie.split(\";\"),c=0,d=b.length;c\u003Cd;c++){for(var e=b[c];\" \"==e.charAt(0);)e=e.substring(1,e.length);if(0==e.indexOf(a))return e.substring(a.length,e.length)}return null};this.set=function(a,b){var c=new Date;c.setTime(c.getTime()+6048E5);c=\"; expires\\x3d\"+c.toGMTString();document.cookie=a+\"\\x3d\"+b+c+\"; path\\x3d\/; \"};this.check=function(){var a=this.get(g);if(a)a=a.split(\":\");else if(100!=d)\"v\"==f\u0026\u0026(d=Math.random()\u003E=\nd\/100?0:100),a=[f,d,0],this.set(g,a.join(\":\"));else return!0;var b=a[1];if(100==b)return!0;switch(a[0]){case \"v\":return!1;case \"r\":return b=a[2]%Math.floor(100\/b),a[2]++,this.set(g,a.join(\":\")),!b}return!0};this.go=function(){if(this.check()){var a=document.createElement(\"script\");a.type=\"text\/javascript\";a.src=h+\"\\x26t\\x3d\"+(new Date).getTime();document.body\u0026\u0026document.body.appendChild(a)}};this.start=function(){var a=this;window.addEventListener?window.addEventListener(\"load\",function(){a.go()},\n!1):window.attachEvent\u0026\u0026window.attachEvent(\"onload\",function(){a.go()})}},f=document.createElement(\"div\");f.setAttribute(\"id\",\"SI_9LEO1QcbH9BEzFb\");document.body.appendChild(f);try{var k=new h(100,\"r\",\"QSI_S_SI_9LEO1QcbH9BEzFb\",\"https:\/\/zn7vxbjk81nhox2qf-springernature.siteintercept.qualtrics.com\/SIE\/?Q_SIID\\x3dSI_9LEO1QcbH9BEzFb\\x26Q_LOC\\x3d\"+encodeURIComponent(window.location.href));k.start()}catch(d){}})();\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":30
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar c_id=\"14617931\",_comscore=window._comscore=_comscore||[];_comscore.push({c1:\"2\",c2:c_id});(function(){var a=document,b=a.getElementsByTagName(\"script\")[0];a=a.createElement(\"script\");a.type=\"text\/javascript\";a.async=!0;var c=\"https:\"==document.location.protocol?\"https:\/\/sb\":\"http:\/\/b\";a.src=c+\".scorecardresearch.com\/beacon.js\";b.parentNode.insertBefore(a,b)})();\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":31
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_load":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003E(function(){var a=document,b=a.getElementsByTagName(\"script\")[0];a=a.createElement(\"script\");a.type=\"text\/javascript\";a.async=!0;a.src=",["escape",["macro",111],8,16],";b.parentNode.insertBefore(a,b)})();\u003C\/script\u003E"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":34
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar s=document.getElementsByTagName(\"script\")[0],p=document.createElement(\"script\");p.async=\"async\";p.src=\"\/\/scripts.webcontentassessor.com\/scripts\/93dabb8d80079a87fec7bb6f67b807fce90e1688f8957ad7ad152bfd58ea01c2\";s.parentNode.insertBefore(p,s);\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":44
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E!function(d,e,f,a,b,c){d.twq||(a=d.twq=function(){a.exe?a.exe.apply(a,arguments):a.queue.push(arguments)},a.version=\"1.1\",a.queue=[],b=e.createElement(f),b.async=!0,b.src=\"\/\/static.ads-twitter.com\/uwt.js\",c=e.getElementsByTagName(f)[0],c.parentNode.insertBefore(b,c))}(window,document,\"script\");twq(\"init\",\"o3xnx\");twq(\"track\",\"PageView\");twq(\"init\",\"o43y9\");twq(\"track\",\"PageView\");\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":45
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003E-1==document.location.href.search(\"appspot.com\")\u0026\u0026-1==document.referrer.search(\"appspot.com\")\u0026\u0026!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version=\"2.0\",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,\"script\",\"https:\/\/connect.facebook.net\/en_US\/fbevents.js\");fbq(\"init\",\"1229240860577415\");\nfbq(\"track\",\"PageView\");var segs=",["escape",["macro",77],8,16],";fbq(\"trackCustom\",\"SciRep_inMarket\",{t4fs93hlz:segs});\u003C\/script\u003E\n\u003Cnoscript\u003E\u003Cimg height=\"1\" width=\"1\" style=\"display:none\" src=\"https:\/\/www.facebook.com\/tr?id=1229240860577415\u0026amp;ev=PageView\u0026amp;noscript=1\"\u003E\u003C\/noscript\u003E"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":46
    },{
      "function":"__html",
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Edocument.querySelector\u0026\u0026function(d){if(d){var g={publisherName:\"SpringerNature\",imprint:\"Nature\",orderBeanReset:\"true\"},h=function(a){for(var b={},e=\/([^\u0026=]+)=?([^\u0026]*)\/g,c=a.substring(1);a=e.exec(c);)b[decodeURIComponent(a[1].replace(\/\\+\/g,\" \"))]=decodeURIComponent(a[2].replace(\/\\+\/g,\" \"));return b}(d.search),k=function(a,b){var e=a.protocol+\"\/\/\"+a.hostname+a.pathname;var c=b;var d=[],f;for(f in c)c.hasOwnProperty(f)\u0026\u0026d.push(f+\"\\x3d\"+encodeURIComponent(c[f]));c=\"?\"+d.join(\"\\x26\");e+=c;a.setAttribute(\"href\",\ne)},b;for(b in g)g.hasOwnProperty(b)\u0026\u0026(h[b]=g[b]);k(d,h)}}(document.querySelector('a[href^\\x3d\"https:\/\/s100.copyright.com\"]'));\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":47
    },{
      "function":"__html",
      "metadata":["map"],
      "teardown_tags":["list",["tag",53,0]],
      "once_per_event":true,
      "vtp_html":"\n\u003Cscript type=\"text\/javascript\"\u003Ewindow.lightningjs||function(c){function g(b,d){d\u0026\u0026(d+=(\/\\?\/.test(d)?\"\\x26\":\"?\")+\"lv\\x3d1\");c[b]||function(){var k=window,h=document,l=b,g=h.location.protocol,n=\"load\",m=0;(function(){function b(){a.P(n);a.w=1;c[l](\"_load\")}c[l]=function(){function p(){p.id=e;return c[l].apply(p,arguments)}var e=++m;var b=this\u0026\u0026this!=k?this.id||0:0;(a.s=a.s||[]).push([e,b,arguments]);p.then=function(b,c,h){var d=a.fh[e]=a.fh[e]||[],l=a.eh[e]=a.eh[e]||[],f=a.ph[e]=a.ph[e]||[];b\u0026\u0026d.push(b);c\u0026\u0026l.push(c);h\u0026\u0026f.push(h);\nreturn p};return p};var a=c[l]._={};a.fh={};a.eh={};a.ph={};a.l=d?d.replace(\/^\\\/\\\/\/,(\"https:\"==g?g:\"http:\")+\"\/\/\"):d;a.p={0:+new Date};a.P=function(b){a.p[b]=new Date-a.p[0]};a.w\u0026\u0026b();k.addEventListener?k.addEventListener(n,b,!1):k.attachEvent(\"on\"+n,b);var t=function(){function b(){return[\"\\x3chead\\x3e\\x3c\/head\\x3e\\x3c\",e,' onload\\x3d\"var d\\x3d',q,\";d.getElementsByTagName('head')[0].\",d,\"(d.\",g,\"('script')).\",k,\"\\x3d'\",a.l,\"'\\\"\\x3e\\x3c\/\",e,\"\\x3e\"].join(\"\")}var e=\"body\",c=h[e];if(!c)return setTimeout(t,\n100);a.P(1);var d=\"appendChild\",g=\"createElement\",k=\"src\",m=h[g](\"div\"),n=m[d](h[g](\"div\")),f=h[g](\"iframe\"),q=\"document\";m.style.display=\"none\";c.insertBefore(m,c.firstChild).id=r+\"-\"+l;f.frameBorder=\"0\";f.id=r+\"-frame-\"+l;\/MSIE[ ]+6\/.test(navigator.userAgent)\u0026\u0026(f[k]=\"javascript:false\");f.allowTransparency=\"true\";n[d](f);try{f.contentWindow[q].open()}catch(w){a.domain=h.domain;var u=\"javascript:var d\\x3d\"+q+\".open();d.domain\\x3d'\"+h.domain+\"';\";f[k]=u+\"void(0);\"}try{var v=f.contentWindow[q];v.write(b());\nv.close()}catch(w){f[k]=u+'d.write(\"'+b().replace(\/\"\/g,String.fromCharCode(92)+'\"')+'\");d.close();'}a.P(2)};a.l\u0026\u0026setTimeout(t,0)})()}();c[b].lv=\"1\";return c[b]}var r=\"lightningjs\",m=window[r]=g(r);m.require=g;m.modules=c}({});window.usabilla_live=lightningjs.require(\"usabilla_live\",\"\/\/w.usabilla.com\/c9624a2fb834.js\");\u003C\/script\u003E\n",
      "vtp_supportDocumentWrite":true,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "vtp_usePostscribe":true,
      "tag_id":59
    },{
      "function":"__html",
      "metadata":["map"],
      "teardown_tags":["list",["tag",53,2]],
      "once_per_event":true,
      "vtp_html":"\n\u003Cscript type=\"text\/javascript\"\u003Ewindow.lightningjs||function(c){function g(b,d){d\u0026\u0026(d+=(\/\\?\/.test(d)?\"\\x26\":\"?\")+\"lv\\x3d1\");c[b]||function(){var k=window,h=document,l=b,g=h.location.protocol,n=\"load\",m=0;(function(){function b(){a.P(n);a.w=1;c[l](\"_load\")}c[l]=function(){function p(){p.id=e;return c[l].apply(p,arguments)}var e=++m;var b=this\u0026\u0026this!=k?this.id||0:0;(a.s=a.s||[]).push([e,b,arguments]);p.then=function(b,c,h){var d=a.fh[e]=a.fh[e]||[],l=a.eh[e]=a.eh[e]||[],f=a.ph[e]=a.ph[e]||[];b\u0026\u0026d.push(b);c\u0026\u0026l.push(c);h\u0026\u0026f.push(h);\nreturn p};return p};var a=c[l]._={};a.fh={};a.eh={};a.ph={};a.l=d?d.replace(\/^\\\/\\\/\/,(\"https:\"==g?g:\"http:\")+\"\/\/\"):d;a.p={0:+new Date};a.P=function(b){a.p[b]=new Date-a.p[0]};a.w\u0026\u0026b();k.addEventListener?k.addEventListener(n,b,!1):k.attachEvent(\"on\"+n,b);var t=function(){function b(){return[\"\\x3chead\\x3e\\x3c\/head\\x3e\\x3c\",e,' onload\\x3d\"var d\\x3d',q,\";d.getElementsByTagName('head')[0].\",d,\"(d.\",g,\"('script')).\",k,\"\\x3d'\",a.l,\"'\\\"\\x3e\\x3c\/\",e,\"\\x3e\"].join(\"\")}var e=\"body\",c=h[e];if(!c)return setTimeout(t,\n100);a.P(1);var d=\"appendChild\",g=\"createElement\",k=\"src\",m=h[g](\"div\"),n=m[d](h[g](\"div\")),f=h[g](\"iframe\"),q=\"document\";m.style.display=\"none\";c.insertBefore(m,c.firstChild).id=r+\"-\"+l;f.frameBorder=\"0\";f.id=r+\"-frame-\"+l;\/MSIE[ ]+6\/.test(navigator.userAgent)\u0026\u0026(f[k]=\"javascript:false\");f.allowTransparency=\"true\";n[d](f);try{f.contentWindow[q].open()}catch(w){a.domain=h.domain;var u=\"javascript:var d\\x3d\"+q+\".open();d.domain\\x3d'\"+h.domain+\"';\";f[k]=u+\"void(0);\"}try{var v=f.contentWindow[q];v.write(b());\nv.close()}catch(w){f[k]=u+'d.write(\"'+b().replace(\/\"\/g,String.fromCharCode(92)+'\"')+'\");d.close();'}a.P(2)};a.l\u0026\u0026setTimeout(t,0)})()}();c[b].lv=\"1\";return c[b]}var r=\"lightningjs\",m=window[r]=g(r);m.require=g;m.modules=c}({});window.usabilla_live=lightningjs.require(\"usabilla_live\",\"\/\/w.usabilla.com\/b91e4719b0f6.js\");\u003C\/script\u003E\n",
      "vtp_supportDocumentWrite":true,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "vtp_usePostscribe":true,
      "tag_id":61
    },{
      "function":"__html",
      "metadata":["map"],
      "setup_tags":["list",["tag",58,0]],
      "teardown_tags":["list",["tag",54,2]],
      "once_per_event":true,
      "vtp_html":"\n\u003Cscript\u003Ewindow.usabilla||function(){var a=window,d=a.document,b={},g=d.createElement(\"div\"),h=!1;a=a.usabilla=function(){(b.a=b.a||[]).push(arguments)};a._=b;b.ids={};g.style.display=\"none\";(function(){if(!d.body)return setTimeout(arguments.callee,100);d.body.insertBefore(g,d.body.firstChild).id=\"usabilla\";h=!0})();a.load=function(a,f,k){if(!b.ids[f]){var e=b.ids={};e.url=\"\/\/\"+a+\"\/\"+f+\".js?s1\";e.config=k;setTimeout(function(){if(!h)return setTimeout(arguments.callee,100);var c=d.createElement(\"iframe\");c.id=\n\"usabilla-\"+f;\/MSIE[ ]+6\/.test(navigator.userAgent)\u0026\u0026(c.src=\"javascript:false\");g.appendChild(c);try{c.contentWindow.document.open()}catch(l){e.domain=d.domain;var a=\"javascript:var d\\x3ddocument.open();d.domain\\x3d'\"+e.domain+\"';\";c.src=a+\"void(0);\"}try{var b=c.contentWindow.document;b.write([\"\\x3c!DOCTYPE html\\x3e\\x3chtml\\x3e\\x3chead\\x3e\\x3c\/head\\x3e\\x3cbody onload\\x3d\\\"var d \\x3d document;d.getElementsByTagName('head')[0].appendChild(d.createElement('script')).src\\x3d'\",e.url,\"'\\\"\\x3e\\x3c\/body\\x3e\\x3c\/html\\x3e\"].join(\"\"));\nb.close()}catch(l){c.src=a+'d.write(\"'+loaderHtml().replace(\/\"\/g,String.fromCharCode(92)+'\"')+'\");d.close();'}c.contentWindow.config=k;c.contentWindow.SCRIPT_ID=f},0)}}}();window.usabilla.load(\"w.usabilla.com\",\"6fa646ed3ab3\");\u003C\/script\u003E\n",
      "vtp_supportDocumentWrite":true,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "vtp_usePostscribe":true,
      "tag_id":71
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar mainArticleBodyContainer=document.querySelector(\"#main-article-body\");mainArticleBodyContainer\u0026\u0026mainArticleBodyContainer.classList.remove(\"js-hide\");\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":75
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003E!function(a,b,c,d,e){if(!b)for(b=b||{},window.permutive=b,b.q=[],b.config=e||{},b.config.projectId=c,b.config.apiKey=d,b.config.environment=b.config.environment||\"production\",a=\"addon identify track trigger query segment segments ready on once user consent\".split(\" \"),c=0;c\u003Ca.length;c++)d=a[c],b[d]=function(a){return function(){var c=Array.prototype.slice.call(arguments,0);b.q.push({functionName:a,arguments:c})}}(d)}(document,window.permutive,\"2e4b93d1-a8ae-4a89-8885-6109135ac0de\",\"7509d50f-8950-4699-a535-f9942eea50bf\",\n{consentRequired:!0});window.googletag=window.googletag||{};window.googletag.cmd=window.googletag.cmd||[];window.googletag.cmd.push(function(){if(0===window.googletag.pubads().getTargeting(\"permutive\").length){var a=window.localStorage.getItem(\"_pdfps\");window.googletag.pubads().setTargeting(\"permutive\",a?JSON.parse(a):[])}});permutive.readyWithTimeout=function(a,b,c){var d=!1,e=function(){d||(a(),d=!0)};(c=c||1\/0)!==1\/0\u0026\u0026window.setTimeout(e,c);permutive.ready(e,b)};\nvar NOT_SET=\"(not set)\",identity=function(a){return a},clean=function(a,b){return(b||identity)(a===NOT_SET||!a\u0026\u0026\"number\"!==typeof a?null:a)},bool=function(a){return a===NOT_SET?!1:!!a},lower=function(a){return\"string\"===typeof a?a.toLowerCase():a},strip=function(a){var b=0,c=0,d;for(d in a)++b,a.hasOwnProperty(d)\u0026\u0026null===a[d]\u0026\u0026(++c,delete a[d]);return b===c?null:a},pathSegments=function(){for(var a={},b=window.location.pathname.slice(1).split(\"\/\"),c=0,d=b.length;c\u003Cd;++c)2\u003Ec?a[\"level\"+(c+1)]=b[c]:\na.level2+=\"\/\"+b[c];return a},clientId=function(){return window.ga\u0026\u0026window.ga.getAll?window.ga.getAll()[0].get(\"clientId\"):null},gaClientId=clientId(),content=strip({article:strip({doi:clean(",["escape",["macro",20],8,16],"),title:clean(",["escape",["macro",57],8,16],"),type:clean(",["escape",["macro",2],8,16],",lower),keywords:clean(",["escape",["macro",51],8,16],",function(a){a=(a||\"\").split(\";\");return 0===a.length||1===a.length\u0026\u0026\"\"===a[0]?null:a})}),category:strip({contentType:clean(",["escape",["macro",7],8,16],",lower)}),path:pathSegments(),backHalf:bool(",["escape",["macro",118],8,16],")}),\npage=strip({pageType:clean(",["escape",["macro",2],8,16],",lower)}),journal=strip({title:clean(",["escape",["macro",17],8,16],",lower)}),user=strip({bpid:clean(",["escape",["macro",65],8,16],"),accessType:clean(",["escape",["macro",85],8,16],",lower),authorizationStatus:bool(",["escape",["macro",32],8,16],")}),model={page:strip({content:content,page:page,journal:journal,user:user})},consent=Bootstrapper.npg.utils.Consent;consent.allow(consent.TARGETING)?permutive.consent({opt_in:!0,token:\"CONSENT_CAPTURED\"}):permutive.consent({opt_in:!1});\ngaClientId\u0026\u0026permutive.identify([{id:gaClientId,tag:\"client-id\"}]);permutive.addon(\"web\",model);permutive.readyWithTimeout(function(){document.dispatchEvent(new CustomEvent(\"permutiveready\"))},\"realtime\",1500);\u003C\/script\u003E\n\u003Cscript async data-gtmsrc=\"https:\/\/cdn.permutive.com\/2e4b93d1-a8ae-4a89-8885-6109135ac0de-web.js\" type=\"text\/gtmscript\"\u003E\u003C\/script\u003E\n"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":307
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E(function(b){var a=b.createElement(\"script\");a.setAttribute(\"async\",\"async\");a.src=\"https:\/\/scholar.google.com\/scholar_js\/casa.js\";b.head.appendChild(a)})(document);\u003C\/script\u003E\n",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":317
    },{
      "function":"__html",
      "metadata":["map"],
      "teardown_tags":["list",["tag",56,0]],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Edocument.addEventListener(\"accessdetailsloaded\",function(a){a=a.detail;var b={event:\"update-access-details\"};if(a){var c=a.institutional_business_partner_ids\u0026\u0026a.institutional_business_partner_ids.join?a.institutional_business_partner_ids.join(\";\"):\"\",d=a.resolved_by\u0026\u0026a.resolved_by.join?a.resolved_by.join(\";\"):\"\";b.user={};b.user.profile={};b.user.profile.profileInfo={resolvedBy:d||null,bpid:c||null};b.session={};b.session.authentication={};b.session.authentication.token=a.token||null;b.session.authentication.legacy=\n{}}window.dataLayer.push(b)},!1);\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":328
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E(function(){var a=document.querySelector(\".optanon-alert-box-wrapper .banner-policy-link\");if(a){var b=a.cloneNode();b.textContent=a.textContent;a.parentNode.replaceChild(b,a)}})();\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":333
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_load":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Ewindow.dataLayer.push({event:\"ga-client-id-pushed-to-datalayer\",gaClientId:null});\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":354
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Econsole.log(\"idp test July 2020\");\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":356
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Econsole.log(\"IDP test 2020\");\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":358
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar event=document.createEvent(\"Event\");event.initEvent(\"OneTrustGroupsUpdated\",!0,!0);document.dispatchEvent(event);\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":360
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_load":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003Evar getClientId=function(){return window.ga\u0026\u0026window.ga.getAll\u0026\u0026window.ga.getAll().length?window.ga.getAll()[0].get(\"clientId\"):null};window.dataLayer.push({event:\"ga-client-id-pushed-to-datalayer\",gaClientId:getClientId()});\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":37
    },{
      "function":"__html",
      "metadata":["map"],
      "teardown_tags":["list",["tag",57,0]],
      "once_per_load":true,
      "vtp_html":["template","\n\u003Cscript type=\"text\/gtmscript\"\u003Ewindow.usabilla_live(\"data\",{custom:{kruxUser:",["escape",["macro",76],8,16],",kruxSegment:",["escape",["macro",77],8,16],",journalTitle:",["escape",["macro",19],8,16],",pageType:",["escape",["macro",4],8,16],",template:",["escape",["macro",59],8,16],",contentType:",["escape",["macro",120],8,16],",doi:",["escape",["macro",20],8,16],",abTestValue:",["escape",["macro",70],8,16],",authorization:",["escape",["macro",121],8,16],",bpid:",["escape",["macro",66],8,16],",primaryArticleType:",["escape",["macro",50],8,16],",referrer:",["escape",["macro",122],8,16],",openAcces:",["escape",["macro",123],8,16],",GAclientId:",["escape",["macro",124],8,16],",usabillaSurvey:",["escape",["macro",125],8,16],"}});\u003C\/script\u003E\n"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":62
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003Evar widgetUsabillaSelector=document.getElementsByClassName(\"gtm-usabilla-in-page\")[0];\nwidgetUsabillaSelector\u0026\u0026(widgetUsabillaSelector.setAttribute(\"ub-in-page-kruxUser\",",["escape",["macro",76],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-kruxSegment\",",["escape",["macro",77],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-journalTitle\",",["escape",["macro",19],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-pageType\",",["escape",["macro",4],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-template\",",["escape",["macro",59],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-contentType\",",["escape",["macro",120],8,16],"),\nwidgetUsabillaSelector.setAttribute(\"ub-in-page-doi\",",["escape",["macro",20],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-abTestValue\",",["escape",["macro",70],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-authorization\",",["escape",["macro",121],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-bpid\",",["escape",["macro",66],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-primaryArticleType\",",["escape",["macro",50],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-referrer\",",["escape",["macro",122],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-openAcces\",\n",["escape",["macro",123],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-GAclientId\",",["escape",["macro",124],8,16],"),widgetUsabillaSelector.setAttribute(\"ub-in-page-usabillaSurvey\",",["escape",["macro",125],8,16],"));",["escape",["macro",114],8,16],"\u0026\u0026window.usabilla(\"setEventCallback\",function(b,a,c,d,e){\"In-Page:Success\"===a\u0026\u0026",["escape",["macro",126],8,16],"()});",["escape",["macro",116],8,16],"\u0026\u0026",["escape",["macro",127],8,16],"();\u003C\/script\u003E"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":72
    },{
      "function":"__html",
      "metadata":["map"],
      "teardown_tags":["list",["tag",52,2]],
      "once_per_load":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003E(function(win,doc,undefined){var isArray=",["escape",["macro",68],8,16],";var isObject=",["escape",["macro",128],8,16],";var map=",["escape",["macro",69],8,16],";var closestByAttribute=",["escape",["macro",130],8,16],";var closest=",["escape",["macro",129],8,16],";var enforceDataType=",["escape",["macro",131],8,16],";var normaliseAnd=",["escape",["macro",5],8,16],";var normaliseWhitespace=",["escape",["macro",6],8,16],";var formatDate=",["escape",["macro",22],8,16],";var createEventPayload=",["escape",["macro",132],8,16],";var sendEvent=",["escape",["macro",133],8,16],";var eventHandler=",["escape",["macro",134],8,16],";var setupTracking=\nfunction(selector,eventName,handlerName){var elements=document.querySelectorAll(selector);if(!elements.length)return;Array.prototype.slice.call(elements).forEach(function(element){element.addEventListener(eventName,function(e){eventHandler(e.target,handlerName||eventName)})})};setupTracking('[data-track\\x3d\"click\"]',\"click\");setupTracking('[data-track\\x3d\"change\"]',\"change\");setupTracking('[data-track\\x3d\"download\"]',\"click\",\"download\");setupTracking('form[data-track\\x3d\"submit\"]',\"submit\");if(window.IntersectionObserver){var inViewElements=\ndocument.querySelectorAll('[data-track\\x3d\"in-view\"]');if(!inViewElements.length)return;var handleIntersect=function(entries,observer){entries.forEach(function(entry){if(entry.intersectionRatio\u003E.25){eventHandler(entry.target,\"in-view\");observer.unobserve(entry.target)}})};var observer=new IntersectionObserver(handleIntersect,{root:null,rootMargin:\"0px\",threshold:[0,.25,.75,1]});Array.prototype.slice.call(inViewElements).forEach(function(element){observer.observe(element)})}var sciHubLinks=document.querySelectorAll('a[href*\\x3d\"sci-hub\"],a[href*\\x3d\"dx.doi.org\"]');\nif(sciHubLinks.length)Array.prototype.slice.call(sciHubLinks).forEach(function(link){link.addEventListener(\"click\",function(){sendEvent({action:\"Click Event\",category:\"External Link\",label:this.href.indexOf(\"sci-hub\")!==-1?\"sci-hub\":\"dx.doi.org\"})})})})(window,document);\u003C\/script\u003E"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":12
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\u003Cscript type=\"text\/gtmscript\"\u003E(function(a){if(\"function\"===typeof window.CustomEvent)return!1;var b=function(b,c){c=c||{};var d=document.createEvent(\"CustomEvent\");d.initCustomEvent(b,c.bubbles||!1,c.cancelable||!1,c.detail||a);return d};b.prototype=window.Event.prototype;window.CustomEvent=b})();var parse=function(a,b){try{return 200===a?JSON.parse(b):null}catch(e){return null}},dispatch=function(a){a=new CustomEvent(\"accessdetailsloaded\",{detail:a});document.dispatchEvent(a)};\nif(-1!==window.location.hostname.indexOf(\".nature.com\")){var transport=new XMLHttpRequest;transport.open(\"GET\",\"https:\/\/idp.nature.com\/exposed-details\",!0);transport.withCredentials=!0;transport.onreadystatechange=function(){4===transport.readyState\u0026\u0026dispatch(parse(transport.status,transport.responseText))};transport.send()}else dispatch(null);\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":329
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_load":true,
      "vtp_html":["template","\n\u003Cscript type=\"text\/gtmscript\"\u003Eif(",["escape",["macro",135],8,16],"){var triggerName=",["escape",["macro",136],8,16],"?\"ab_use_nature_150_split_header\\x3dtrue\":\"ab_use_nature_150_split_header\\x3dfalse\";window.usabilla_live(\"trigger\",triggerName)};\u003C\/script\u003E\n"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":345
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":["template","\u003Cscript type=\"text\/gtmscript\"\u003Evar usabillaId=",["escape",["macro",114],8,16],"?",["escape",["macro",137],8,16],":",["escape",["macro",138],8,16],",containerId=",["escape",["macro",114],8,16],"?\"gtm-usabilla-survey-widget\":\"gtm-usabilla-paywall-widget\",container=document.createElement(\"div\"),parentContainerSelector=\"#gtm-usabilla-container\",parentContainer=document.querySelector(parentContainerSelector);\nparentContainer\u0026\u0026(container.setAttribute(\"id\",containerId),container.setAttribute(\"class\",\"gtm-usabilla-in-page\"),",["escape",["macro",116],8,16],"\u0026\u0026parentContainer.classList.add(\"js-hide\"),container.setAttribute(\"ub-in-page\",usabillaId),parentContainer.insertBefore(container,parentContainer.firstChild));\u003C\/script\u003E"],
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":74
    }],
  "predicates":[{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.load"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"update-access-details"
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^\/briefing.*",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.dom"
    },{
      "function":"_eq",
      "arg0":["macro",89],
      "arg1":"false"
    },{
      "function":"_re",
      "arg0":["macro",1],
      "arg1":".*"
    },{
      "function":"_cn",
      "arg0":["macro",88],
      "arg1":"\/collections\/hgnwmmsqfr\/events"
    },{
      "function":"_re",
      "arg0":["macro",90],
      "arg1":".*aacr.*|.*cell\\-symposia.*|.*csh\\asia.*|.*meetings.*|.*ebi.*training.*|.*embl.*training.*|.*imb.*confer.*|.*asconacir.*|.*ature.*natureconfer.*|.*nyas.*events.*|.*ellcomegenomecam.*",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.linkClick"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_77($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"interactive-event"
    },{
      "function":"_eq",
      "arg0":["macro",98],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",99],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",101],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",102],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.timer"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_145($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",104],
      "arg1":"local-www"
    },{
      "function":"_eq",
      "arg0":["macro",88],
      "arg1":"\/srep"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.js"
    },{
      "function":"_eq",
      "arg0":["macro",88],
      "arg1":"\/srep\/"
    },{
      "function":"_cn",
      "arg0":["macro",88],
      "arg1":"\/articles"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.scrollDepth"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_193($|,)))"
    },{
      "function":"_sw",
      "arg0":["macro",88],
      "arg1":"\/srep"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_294($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.elementVisibility"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_290($|,)))"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_289($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",106],
      "arg1":"author link - publication"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_312($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",106],
      "arg1":"author link - pubmed"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_313($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",106],
      "arg1":"author link - scholar"
    },{
      "function":"_re",
      "arg0":["macro",91],
      "arg1":"(^$|((^|,)10482319_316($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",20],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",59],
      "arg1":"mosaic"
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(local\\.nature\\.com(:[0-9]+)?)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(local-www\\.nature\\.com(:\\d+)?)$",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"guide.labanimal.com"
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(.*?\\.natureasiapacific\\.com)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(.*?\\.natureindex\\.com)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^((test-|staging-)?www\\.palgrave-journals\\.com)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"(?i)blogs.nature.com",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(www\\.labanimal\\.com)$",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"staging-guide.labanimal.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"staging-www.nature.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"test-guide.labanimal.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"test-www.nature.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"www.nature.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"press.nature.com"
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^(\/collections\/?)",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^(www\\.nature\\.com)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",109],
      "arg1":"^(https?)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"^((?!.*(press)).*\\.nature\\.com)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"\"^\/(nature_education|scitable|principles|search|subjects)(\/|$)",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",110],
      "arg1":"false"
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^\\\/(login|my-account|public\\\/n\\\/payment).*",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"(idp|transfer|press)\\..*",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",112],
      "arg1":"true"
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^(\/nature\/journal\/.+?\/(?:(full)|(abs))\/.+?\\.html)",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^(\/news\/.*?1\\.[0-9]+)$",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^\/news\/[0-9]{4}\/[0-9]+\/full\/",
      "ignore_case":true
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"test-www.nature.com|qa-snpaas-www.nature.com"
    },{
      "function":"_re",
      "arg0":["macro",82],
      "arg1":"(idp|transfer|press)\\..*",
      "ignore_case":true
    },{
      "function":"_eq",
      "arg0":["macro",59],
      "arg1":"bav"
    },{
      "function":"_eq",
      "arg0":["macro",59],
      "arg1":"magazine mosaic"
    },{
      "function":"_eq",
      "arg0":["macro",114],
      "arg1":"true"
    },{
      "function":"_cn",
      "arg0":["macro",88],
      "arg1":"\/articles\/"
    },{
      "function":"_eq",
      "arg0":["macro",115],
      "arg1":"undefined"
    },{
      "function":"_eq",
      "arg0":["macro",116],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",117],
      "arg1":"undefined"
    },{
      "function":"_re",
      "arg0":["macro",88],
      "arg1":"^\\\/(login|my-account|public\\\/n\\\/payment).*"
    },{
      "function":"_re",
      "arg0":["macro",107],
      "arg1":"(idp|transfer|press)\\..*"
    },{
      "function":"_cn",
      "arg0":["macro",107],
      "arg1":"natureindex.com"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"ga-client-id-pushed-to-datalayer"
    },{
      "function":"_eq",
      "arg0":["macro",119],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",32],
      "arg1":"0"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"idp.nature.com"
    },{
      "function":"_eq",
      "arg0":["macro",107],
      "arg1":"staging-idp.nature.com"
    },{
      "function":"_re",
      "arg0":["macro",1],
      "arg1":"OneTrustGroupsUpdated"
    }],
  "rules":[
    [["if",0,1],["add",2,47]],
    [["if",2],["add",3]],
    [["if",3,4],["add",3]],
    [["if",7,8,9,10],["add",4]],
    [["if",11],["add",5]],
    [["if",4,12],["add",6]],
    [["if",4,14],["add",7]],
    [["if",4,15],["add",8]],
    [["if",16,17],["add",9]],
    [["if",18,19,20],["add",1]],
    [["if",20,21],["add",1]],
    [["if",22,23,24],["add",10]],
    [["if",23,25,26],["add",10]],
    [["if",4],["add",11]],
    [["if",27,28],["add",12]],
    [["if",27,29],["add",13]],
    [["if",9,30,31],["add",14]],
    [["if",9,32,33],["add",15]],
    [["if",9,34,35],["add",16]],
    [["if",20],["add",17,19,20,21,22,24,25,27,28,29,0,32,46]],
    [["if",20,37],["unless",36],["add",18]],
    [["if",1],["add",23,26,38]],
    [["if",20,38],["add",30]],
    [["if",20,39],["add",30]],
    [["if",20,40],["add",30]],
    [["if",20,41],["add",30]],
    [["if",20,42],["add",30]],
    [["if",20,43],["add",30]],
    [["if",20,44],["add",30]],
    [["if",20,45],["add",30]],
    [["if",20,46],["add",30]],
    [["if",20,47],["add",30]],
    [["if",20,48],["add",30]],
    [["if",20,49],["add",30]],
    [["if",20,50],["add",30]],
    [["if",4,51],["add",31]],
    [["if",4,52,53,54],["add",33]],
    [["if",4,44],["add",34]],
    [["if",4,50],["add",34]],
    [["if",4,55],["unless",56],["add",35]],
    [["if",20],["unless",58,59],["add",36]],
    [["if",1,60],["add",37]],
    [["if",4,61],["add",39]],
    [["if",4,62],["add",39]],
    [["if",4,63],["add",39]],
    [["if",4,64],["unless",58,65],["add",40]],
    [["if",1],["unless",58,59,66],["add",41]],
    [["if",4,67,68,69,70],["add",42]],
    [["if",4,67,69,71,72],["add",42]],
    [["if",4,13,67,69,71,72],["add",43]],
    [["if",76],["unless",73,74,75],["add",44]],
    [["if",20,37,77,78],["unless",36],["add",45]],
    [["if",5,6],["add",48],["block",3,9,10]],
    [["if",4,79],["add",49]],
    [["if",4,80],["add",50]],
    [["if",81],["add",51]],
    [["if",6,13],["block",6,7,8,11,34,37,38,40,41,42]],
    [["if",6,57],["block",35]]]
},
"runtime":[[50,"__crto",[46,"a"],[52,"b",["require","createQueue"]],[52,"c",["require","injectScript"]],[52,"d","https://static.criteo.net/js/ld/ld.js"],[52,"e",["b","criteo_q"]],[41,"f"],[3,"f",[8,"event","viewHome"]],[38,[17,[15,"a"],"tagType"],[46,"LISTING_TAG","PRODUCT_TAG","BASKET_TAG","TRANSACTION_TAG"],[46,[5,[46,[3,"f",[8,"event","viewList","item",[17,[15,"a"],"listingID"]]],[4]]],[5,[46,[3,"f",[8,"event","viewItem","item",[17,[15,"a"],"productID"]]],[4]]],[5,[46,[3,"f",[8,"event","viewBasket","item",[17,[15,"a"],"basketArray"]]],[4]]],[5,[46,[3,"f",[8,"event","trackTransaction","id",[30,[17,[15,"a"],"TransactionID"],""],"item",[17,[15,"a"],"TransactionArray"]]],[4]]]]],["e",[8,"event","setAccount","account",[17,[15,"a"],"accountId"]],[8,"event","setHashedEmail","email",[30,[17,[15,"a"],"hashedEmail"],""]],[8,"event","setSiteType","type",[30,[17,[15,"a"],"siteType"],"d"]],[15,"f"]],["c",[15,"d"],[17,[15,"a"],"gtmOnSuccess"],[17,[15,"a"],"gtmOnFailure"],"criteoStatic"]]]
,"permissions":{"__crto":{"access_globals":{"keys":[{"key":"criteo_q","read":true,"write":true,"execute":false}]},"inject_script":{"urls":["https:\/\/static.criteo.net\/js\/ld\/ld.js"]}}}

,"security_groups":{
"nonGoogleScripts":["__crto"]}

};
/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
var aa,ba="function"==typeof Object.create?Object.create:function(a){var b=function(){};b.prototype=a;return new b},ca;if("function"==typeof Object.setPrototypeOf)ca=Object.setPrototypeOf;else{var ea;a:{var fa={Of:!0},ia={};try{ia.__proto__=fa;ea=ia.Of;break a}catch(a){}ea=!1}ca=ea?function(a,b){a.__proto__=b;if(a.__proto__!==b)throw new TypeError(a+" is not extensible");return a}:null}
var ja=ca,la=function(a,b){a.prototype=ba(b.prototype);a.prototype.constructor=a;if(ja)ja(a,b);else for(var c in b)if("prototype"!=c)if(Object.defineProperties){var d=Object.getOwnPropertyDescriptor(b,c);d&&Object.defineProperty(a,c,d)}else a[c]=b[c]},ma=this||self,na=/^[\w+/_-]+[=]{0,2}$/,oa=null,pa=function(a,b){function c(){}c.prototype=b.prototype;a.prototype=new c;a.prototype.constructor=a},qa=function(a){return a};var ra=function(a,b){this.a=a;this.i=b};var sa=function(a){return"number"===typeof a&&0<=a&&isFinite(a)&&0===a%1||"string"===typeof a&&"-"!==a[0]&&a===""+parseInt(a,10)},ua=function(){this.s={};this.m=!1;this.F={}};ua.prototype.get=function(a){return this.s["dust."+a]};ua.prototype.set=function(a,b){this.m||(a="dust."+a,this.F.hasOwnProperty(a)||(this.s[a]=b))};ua.prototype.has=function(a){return this.s.hasOwnProperty("dust."+a)};var wa=function(a){var b=[],c;for(c in a.s)a.s.hasOwnProperty(c)&&b.push(c.substr(5));return b};var k=function(a){this.i=new ua;this.a=[];a=a||[];for(var b in a)a.hasOwnProperty(b)&&(sa(b)?this.a[Number(b)]=a[Number(b)]:this.i.set(b,a[b]))};aa=k.prototype;aa.toString=function(a){if(a&&0<=a.indexOf(this))return"";for(var b=[],c=0;c<this.a.length;c++){var d=this.a[c];null===d||void 0===d?b.push(""):d instanceof k?(a=a||[],a.push(this),b.push(d.toString(a)),a.pop()):b.push(d.toString())}return b.join(",")};
aa.set=function(a,b){if("length"==a){if(!sa(b))throw Error("RangeError: Length property must be a valid integer.");this.a.length=Number(b)}else sa(a)?this.a[Number(a)]=b:this.i.set(a,b)};aa.get=function(a){return"length"==a?this.length():sa(a)?this.a[Number(a)]:this.i.get(a)};aa.length=function(){return this.a.length};aa.mc=function(){for(var a=wa(this.i),b=0;b<this.a.length;b++)a.push(b+"");return new k(a)};
var xa=function(a,b){if(sa(b))delete a.a[Number(b)];else{var c=a.i,d;d="dust."+b;c.m||c.F.hasOwnProperty(d)||delete c.s[d]}};aa=k.prototype;aa.pop=function(){return this.a.pop()};aa.push=function(a){return this.a.push.apply(this.a,Array.prototype.slice.call(arguments))};aa.shift=function(){return this.a.shift()};aa.splice=function(a,b,c){return new k(this.a.splice.apply(this.a,arguments))};aa.unshift=function(a){return this.a.unshift.apply(this.a,Array.prototype.slice.call(arguments))};
aa.has=function(a){return sa(a)&&this.a.hasOwnProperty(a)||this.i.has(a)};var ya=function(){function a(f,g){if(b[f]){if(b[f].Zb+g>b[f].max)throw Error("Quota exceeded");b[f].Zb+=g}}var b={},c=void 0,d=void 0,e={jh:function(f){c=f},Ce:function(){c&&a(c,1)},lh:function(f){d=f},Fa:function(f){d&&a(d,f)},Kh:function(f,g){b[f]=b[f]||{Zb:0};b[f].max=g},Fg:function(f){return b[f]&&b[f].Zb||0},reset:function(){b={}},mg:a};e.onFnConsume=e.jh;e.consumeFn=e.Ce;e.onStorageConsume=e.lh;e.consumeStorage=e.Fa;e.setMax=e.Kh;e.getConsumed=e.Fg;e.reset=e.reset;e.consume=e.mg;return e};var za=function(a,b){this.F=a;this.N=function(c,d,e){return c.apply(d,e)};this.m=b;this.i=new ua;this.a=this.s=void 0};za.prototype.add=function(a,b){Ba(this,a,b,!1)};var Ba=function(a,b,c,d){if(!a.i.m)if(a.F.Fa(("string"===typeof b?b.length:1)+("string"===typeof c?c.length:1)),d){var e=a.i;e.set(b,c);e.F["dust."+b]=!0}else a.i.set(b,c)};
za.prototype.set=function(a,b){this.i.m||(!this.i.has(a)&&this.m&&this.m.has(a)?this.m.set(a,b):(this.F.Fa(("string"===typeof a?a.length:1)+("string"===typeof b?b.length:1)),this.i.set(a,b)))};za.prototype.get=function(a){return this.i.has(a)?this.i.get(a):this.m?this.m.get(a):void 0};za.prototype.has=function(a){return!!this.i.has(a)||!(!this.m||!this.m.has(a))};var Da=function(a){var b=new za(a.F,a);a.s&&(b.s=a.s);b.N=a.N;b.a=a.a;return b};var Ea=function(){},Fa=function(a){return"function"==typeof a},p=function(a){return"string"==typeof a},Ga=function(a){return"number"==typeof a&&!isNaN(a)},Ha=function(a){return"[object Array]"==Object.prototype.toString.call(Object(a))},Ia=function(a,b){if(Array.prototype.indexOf){var c=a.indexOf(b);return"number"==typeof c?c:-1}for(var d=0;d<a.length;d++)if(a[d]===b)return d;return-1},Ja=function(a,b){if(a&&Ha(a))for(var c=0;c<a.length;c++)if(a[c]&&b(a[c]))return a[c]},Ka=function(a,b){if(!Ga(a)||
!Ga(b)||a>b)a=0,b=2147483647;return Math.floor(Math.random()*(b-a+1)+a)},Ma=function(a,b){for(var c=new La,d=0;d<a.length;d++)c.set(a[d],!0);for(var e=0;e<b.length;e++)if(c.get(b[e]))return!0;return!1},Na=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b(c,a[c])},Oa=function(a){return!!a&&("[object Arguments]"==Object.prototype.toString.call(a)||Object.prototype.hasOwnProperty.call(a,"callee"))},Pa=function(a){return Math.round(Number(a))||0},Qa=function(a){return"false"==
String(a).toLowerCase()?!1:!!a},Ra=function(a){var b=[];if(Ha(a))for(var c=0;c<a.length;c++)b.push(String(a[c]));return b},Sa=function(a){return a?a.replace(/^\s+|\s+$/g,""):""},Ta=function(){return(new Date).getTime()},La=function(){this.prefix="gtm.";this.values={}};La.prototype.set=function(a,b){this.values[this.prefix+a]=b};La.prototype.get=function(a){return this.values[this.prefix+a]};
var Ua=function(a,b,c){return a&&a.hasOwnProperty(b)?a[b]:c},Va=function(a){var b=!1;return function(){if(!b)try{a()}catch(c){}b=!0}},Wa=function(a,b){for(var c in b)b.hasOwnProperty(c)&&(a[c]=b[c])},Xa=function(a){for(var b in a)if(a.hasOwnProperty(b))return!0;return!1},Ya=function(a,b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]),c.push.apply(c,b[a[d]]||[]);return c},Za=function(a){for(var b=B,c=0;c<a.length-1;c++){if(!b.hasOwnProperty(a[c]))return;b=b[a[c]]}return b},$a=function(a,b){for(var c=
{},d=c,e=a.split("."),f=0;f<e.length-1;f++)d=d[e[f]]={};d[e[e.length-1]]=b;return c},ab=function(a){var b=[];Na(a,function(c,d){10>c.length&&d&&b.push(c)});return b.join(",")};var cb=function(a,b){ua.call(this);this.a=a;this.N=b};la(cb,ua);cb.prototype.toString=function(){return this.a};cb.prototype.mc=function(){return new k(wa(this))};cb.prototype.i=function(a,b){a.F.Ce();return this.N.apply(db(this,a),Array.prototype.slice.call(arguments,1))};var db=function(a,b){var c=function(d,e){this.i=d;this.m=e};c.prototype.a=function(d){var e=this.m;return Ha(d)?eb(e,d):d};c.prototype.F=function(d){return fb(this.m,d)};c.prototype.s=function(){return b.F};return new c(a,b)};
cb.prototype.Ja=function(a,b){try{return this.i.apply(this,Array.prototype.slice.call(arguments,0))}catch(c){}};var fb=function(a,b){for(var c,d=0;d<b.length&&!(c=eb(a,b[d]),c instanceof ra);d++);return c},eb=function(a,b){try{var c=a.get(String(b[0]));if(!(c&&c instanceof cb))throw Error("Attempting to execute non-function "+b[0]+".");return c.i.apply(c,[a].concat(b.slice(1)))}catch(e){var d=a.s;d&&d(e,b.context?{id:b[0],line:b.context.line}:null);throw e;}};var gb=function(){ua.call(this)};la(gb,ua);gb.prototype.mc=function(){return new k(wa(this))};/*
 jQuery v1.9.1 (c) 2005, 2012 jQuery Foundation, Inc. jquery.org/license. */
var hb=/\[object (Boolean|Number|String|Function|Array|Date|RegExp)\]/,ib=function(a){if(null==a)return String(a);var b=hb.exec(Object.prototype.toString.call(Object(a)));return b?b[1].toLowerCase():"object"},jb=function(a,b){return Object.prototype.hasOwnProperty.call(Object(a),b)},kb=function(a){if(!a||"object"!=ib(a)||a.nodeType||a==a.window)return!1;try{if(a.constructor&&!jb(a,"constructor")&&!jb(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}for(var b in a);return void 0===
b||jb(a,b)},E=function(a,b){var c=b||("array"==ib(a)?[]:{}),d;for(d in a)if(jb(a,d)){var e=a[d];"array"==ib(e)?("array"!=ib(c[d])&&(c[d]=[]),c[d]=E(e,c[d])):kb(e)?(kb(c[d])||(c[d]={}),c[d]=E(e,c[d])):c[d]=e}return c};var mb=function(a,b,c){var d=[],e=[],f=function(h,l){for(var n=wa(h),m=0;m<n.length;m++)l[n[m]]=g(h.get(n[m]))},g=function(h){var l=Ia(d,h);if(-1<l)return e[l];if(h instanceof k){var n=[];d.push(h);e.push(n);for(var m=h.mc(),r=0;r<m.length();r++)n[m.get(r)]=g(h.get(m.get(r)));return n}if(h instanceof gb){var t={};d.push(h);e.push(t);f(h,t);return t}if(h instanceof cb){var q=function(){for(var u=Array.prototype.slice.call(arguments,0),v=0;v<u.length;v++)u[v]=lb(u[v],b);var w=b?b.F:ya(),y=new za(w);
b&&(y.a=b.a);return g(h.i.apply(h,[y].concat(u)))};d.push(h);e.push(q);f(h,q);return q}switch(typeof h){case "boolean":case "number":case "string":case "undefined":return h;case "object":if(null===h)return null;default:if(c)return c(h,b)}};return g(a)},lb=function(a,b,c){var d=[],e=[],f=function(h,l){for(var n in h)h.hasOwnProperty(n)&&l.set(n,g(h[n]))},g=function(h){var l=Ia(d,h);if(-1<l)return e[l];if(Ha(h)||Oa(h)){var n=new k([]);d.push(h);e.push(n);for(var m in h)h.hasOwnProperty(m)&&n.set(m,
g(h[m]));return n}if(kb(h)){var r=new gb;d.push(h);e.push(r);f(h,r);return r}if("function"===typeof h){var t=new cb("",function(u){for(var v=Array.prototype.slice.call(arguments,0),w=0;w<v.length;w++)v[w]=mb(this.a(v[w]),b);return g((0,this.m.N)(h,h,v))});d.push(h);e.push(t);f(h,t);return t}var q=typeof h;if(null===h||"string"===q||"number"===q||"boolean"===q)return h;if(void 0!==h&&c)return c(h,b)};return g(a)};var nb={control:function(a,b){return new ra(a,this.a(b))},fn:function(a,b,c){var d=this.m,e=this.a(b);if(!(e instanceof k))throw Error("Error: non-List value given for Fn argument names.");var f=Array.prototype.slice.call(arguments,2);this.s().Fa(a.length+f.length);return new cb(a,function(){return function(g){var h=Da(d);void 0===h.a&&(h.a=this.m.a);for(var l=Array.prototype.slice.call(arguments,0),n=0;n<l.length;n++)if(l[n]=this.a(l[n]),l[n]instanceof ra)return l[n];for(var m=e.get("length"),r=
0;r<m;r++)r<l.length?h.add(e.get(r),l[r]):h.add(e.get(r),void 0);h.add("arguments",new k(l));var t=fb(h,f);if(t instanceof ra)return"return"===t.a?t.i:t}}())},list:function(a){var b=this.s();b.Fa(arguments.length);for(var c=new k,d=0;d<arguments.length;d++){var e=this.a(arguments[d]);"string"===typeof e&&b.Fa(e.length?e.length-1:0);c.push(e)}return c},map:function(a){for(var b=this.s(),c=new gb,d=0;d<arguments.length-1;d+=2){var e=this.a(arguments[d])+"",f=this.a(arguments[d+1]),g=e.length;g+="string"===
typeof f?f.length:1;b.Fa(g);c.set(e,f)}return c},undefined:function(){}};var ob=function(){this.m=ya();this.a=new za(this.m)},pb=function(a,b,c){var d=new cb(b,c);d.m=!0;a.a.set(b,d)};ob.prototype.hc=function(a,b){var c=Array.prototype.slice.call(arguments,0);return this.i(c)};ob.prototype.i=function(a){for(var b,c=0;c<arguments.length;c++)b=eb(this.a,arguments[c]);return b};ob.prototype.s=function(a,b){var c=Da(this.a);c.a=a;for(var d,e=1;e<arguments.length;e++)d=d=eb(c,arguments[e]);return d};var rb=function(a){if(a instanceof rb)return a;this.qa=a};rb.prototype.toString=function(){return String(this.qa)};var sb=function(a,b){return mb(a,b,function(c){})},tb=function(a,b){var c=void 0;return lb(a,b,c)};var ub=function(a){for(var b=[],c=0;c<a.length();c++)a.has(c)&&(b[c]=a.get(c));return b};var vb={supportedMethods:"concat every filter forEach hasOwnProperty indexOf join lastIndexOf map pop push reduce reduceRight reverse shift slice some sort splice unshift toString".split(" "),concat:function(a,b){for(var c=[],d=0;d<this.length();d++)c.push(this.get(d));for(var e=1;e<arguments.length;e++)if(arguments[e]instanceof k)for(var f=arguments[e],g=0;g<f.length();g++)c.push(f.get(g));else c.push(arguments[e]);return new k(c)},every:function(a,b){for(var c=this.length(),d=0;d<this.length()&&
d<c;d++)if(this.has(d)&&!b.i(a,this.get(d),d,this))return!1;return!0},filter:function(a,b){for(var c=this.length(),d=[],e=0;e<this.length()&&e<c;e++)this.has(e)&&b.i(a,this.get(e),e,this)&&d.push(this.get(e));return new k(d)},forEach:function(a,b){for(var c=this.length(),d=0;d<this.length()&&d<c;d++)this.has(d)&&b.i(a,this.get(d),d,this)},hasOwnProperty:function(a,b){return this.has(b)},indexOf:function(a,b,c){var d=this.length(),e=void 0===c?0:Number(c);0>e&&(e=Math.max(d+e,0));for(var f=e;f<d;f++)if(this.has(f)&&
this.get(f)===b)return f;return-1},join:function(a,b){for(var c=[],d=0;d<this.length();d++)c.push(this.get(d));return c.join(b)},lastIndexOf:function(a,b,c){var d=this.length(),e=d-1;void 0!==c&&(e=0>c?d+c:Math.min(c,e));for(var f=e;0<=f;f--)if(this.has(f)&&this.get(f)===b)return f;return-1},map:function(a,b){for(var c=this.length(),d=[],e=0;e<this.length()&&e<c;e++)this.has(e)&&(d[e]=b.i(a,this.get(e),e,this));return new k(d)},pop:function(){return this.pop()},push:function(a,b){return this.push.apply(this,
Array.prototype.slice.call(arguments,1))},reduce:function(a,b,c){var d=this.length(),e,f=0;if(void 0!==c)e=c;else{if(0==d)throw Error("TypeError: Reduce on List with no elements.");for(var g=0;g<d;g++)if(this.has(g)){e=this.get(g);f=g+1;break}if(g==d)throw Error("TypeError: Reduce on List with no elements.");}for(var h=f;h<d;h++)this.has(h)&&(e=b.i(a,e,this.get(h),h,this));return e},reduceRight:function(a,b,c){var d=this.length(),e,f=d-1;if(void 0!==c)e=c;else{if(0==d)throw Error("TypeError: ReduceRight on List with no elements.");
for(var g=1;g<=d;g++)if(this.has(d-g)){e=this.get(d-g);f=d-(g+1);break}if(g>d)throw Error("TypeError: ReduceRight on List with no elements.");}for(var h=f;0<=h;h--)this.has(h)&&(e=b.i(a,e,this.get(h),h,this));return e},reverse:function(){for(var a=ub(this),b=a.length-1,c=0;0<=b;b--,c++)a.hasOwnProperty(b)?this.set(c,a[b]):xa(this,c);return this},shift:function(){return this.shift()},slice:function(a,b,c){var d=this.length();void 0===b&&(b=0);b=0>b?Math.max(d+b,0):Math.min(b,d);c=void 0===c?d:0>c?
Math.max(d+c,0):Math.min(c,d);c=Math.max(b,c);for(var e=[],f=b;f<c;f++)e.push(this.get(f));return new k(e)},some:function(a,b){for(var c=this.length(),d=0;d<this.length()&&d<c;d++)if(this.has(d)&&b.i(a,this.get(d),d,this))return!0;return!1},sort:function(a,b){var c=ub(this);void 0===b?c.sort():c.sort(function(e,f){return Number(b.i(a,e,f))});for(var d=0;d<c.length;d++)c.hasOwnProperty(d)?this.set(d,c[d]):xa(this,d)},splice:function(a,b,c,d){return this.splice.apply(this,Array.prototype.splice.call(arguments,
1,arguments.length-1))},toString:function(){return this.toString()},unshift:function(a,b){return this.unshift.apply(this,Array.prototype.slice.call(arguments,1))}};var wb="charAt concat indexOf lastIndexOf match replace search slice split substring toLowerCase toLocaleLowerCase toString toUpperCase toLocaleUpperCase trim".split(" "),xb=new ra("break"),yb=new ra("continue"),zb=function(a,b){return this.a(a)+this.a(b)},Ab=function(a,b){return this.a(a)&&this.a(b)},Db=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);if(!(c instanceof k))throw Error("Error: Non-List argument given to Apply instruction.");if(null===a||void 0===a)throw Error("TypeError: Can't read property "+
b+" of "+a+".");if("boolean"==typeof a||"number"==typeof a){if("toString"==b)return a.toString();throw Error("TypeError: "+a+"."+b+" is not a function.");}if("string"==typeof a){if(0<=Ia(wb,b))return tb(a[b].apply(a,ub(c)),this.m);throw Error("TypeError: "+b+" is not a function");}if(a instanceof k){if(a.has(b)){var d=a.get(b);if(d instanceof cb){var e=ub(c);e.unshift(this.m);return d.i.apply(d,e)}throw Error("TypeError: "+b+" is not a function");}if(0<=Ia(vb.supportedMethods,b)){var f=ub(c);f.unshift(this.m);
return vb[b].apply(a,f)}}if(a instanceof cb||a instanceof gb){if(a.has(b)){var g=a.get(b);if(g instanceof cb){var h=ub(c);h.unshift(this.m);return g.i.apply(g,h)}throw Error("TypeError: "+b+" is not a function");}if("toString"==b)return a instanceof cb?a.a:a.toString();if("hasOwnProperty"==b)return a.has.apply(a,ub(c))}if(a instanceof rb&&"toString"===b)return a.toString();throw Error("TypeError: Object has no '"+b+"' property.");},Eb=function(a,b){a=this.a(a);if("string"!=typeof a)throw Error("Invalid key name given for assignment.");
var c=this.m;if(!c.has(a))throw Error("Attempting to assign to undefined value "+b);var d=this.a(b);c.set(a,d);return d},Fb=function(a){var b=Da(this.m),c=fb(b,Array.prototype.slice.apply(arguments));if(c instanceof ra)return c},Gb=function(){return xb},Hb=function(a){for(var b=this.a(a),c=0;c<b.length;c++){var d=this.a(b[c]);if(d instanceof ra)return d}},Ib=function(a){for(var b=this.m,c=0;c<arguments.length-1;c+=2){var d=arguments[c];if("string"===typeof d){var e=this.a(arguments[c+1]);Ba(b,d,e,
!0)}}},Jb=function(){return yb},Kb=function(a,b,c){var d=new k;b=this.a(b);for(var e=0;e<b.length;e++)d.push(b[e]);var f=[51,a,d].concat(Array.prototype.splice.call(arguments,2,arguments.length-2));this.m.add(a,this.a(f))},Lb=function(a,b){return this.a(a)/this.a(b)},Mb=function(a,b){a=this.a(a);b=this.a(b);var c=a instanceof rb,d=b instanceof rb;return c||d?c&&d?a.qa==b.qa:!1:a==b},Nb=function(a){for(var b,c=0;c<arguments.length;c++)b=this.a(arguments[c]);return b};
function Ob(a,b,c){if("string"==typeof b)for(var d=0;d<b.length;d++){var e=a(d),f=fb(e,c);if(f instanceof ra){if("break"==f.a)break;if("return"==f.a)return f}}else if(b instanceof gb||b instanceof k||b instanceof cb)for(var g=b.mc(),h=g.length(),l=0;l<h;l++){var n=a(g.get(l)),m=fb(n,c);if(m instanceof ra){if("break"==m.a)break;if("return"==m.a)return m}}}
var Pb=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Ob(function(e){d.set(a,e);return d},b,c)},Qb=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Ob(function(e){var f=Da(d);Ba(f,a,e,!0);return f},b,c)},Rb=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Ob(function(e){var f=Da(d);f.add(a,e);return f},b,c)},Sb=function(a){return this.m.get(this.a(a))},Ub=function(a,b){var c;a=this.a(a);b=this.a(b);if(void 0===a||null===a)throw Error("TypeError: cannot access property of "+
a+".");if(a instanceof gb||a instanceof k||a instanceof cb)c=a.get(b);else if("string"==typeof a)"length"==b?c=a.length:sa(b)&&(c=a[b]);else if(a instanceof rb)return;return c},Vb=function(a,b){return this.a(a)>this.a(b)},Wb=function(a,b){return this.a(a)>=this.a(b)},Xb=function(a,b){a=this.a(a);b=this.a(b);a instanceof rb&&(a=a.qa);b instanceof rb&&(b=b.qa);return a===b},Yb=function(a,b){return!Xb.call(this,a,b)},Zb=function(a,b,c){var d=[];this.a(a)?d=this.a(b):c&&(d=this.a(c));var e=this.F(d);
if(e instanceof ra)return e},$b=function(a,b){return this.a(a)<this.a(b)},ac=function(a,b){return this.a(a)<=this.a(b)},bc=function(a,b){return this.a(a)%this.a(b)},cc=function(a,b){return this.a(a)*this.a(b)},dc=function(a){return-this.a(a)},ec=function(a){return!this.a(a)},fc=function(a,b){return!Mb.call(this,a,b)},gc=function(){return null},hc=function(a,b){return this.a(a)||this.a(b)},ic=function(a,b){var c=this.a(a);this.a(b);return c},jc=function(a){return this.a(a)},kc=function(a){return Array.prototype.slice.apply(arguments)},
lc=function(a){return new ra("return",this.a(a))},mc=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);if(null===a||void 0===a)throw Error("TypeError: Can't set property "+b+" of "+a+".");(a instanceof cb||a instanceof k||a instanceof gb)&&a.set(b,c);return c},nc=function(a,b){return this.a(a)-this.a(b)},oc=function(a,b,c){a=this.a(a);var d=this.a(b),e=this.a(c);if(!Ha(d)||!Ha(e))throw Error("Error: Malformed switch instruction.");for(var f,g=!1,h=0;h<d.length;h++)if(g||a===this.a(d[h]))if(f=this.a(e[h]),
f instanceof ra){var l=f.a;if("break"==l)return;if("return"==l||"continue"==l)return f}else g=!0;if(e.length==d.length+1&&(f=this.a(e[e.length-1]),f instanceof ra&&("return"==f.a||"continue"==f.a)))return f},pc=function(a,b,c){return this.a(a)?this.a(b):this.a(c)},qc=function(a){a=this.a(a);return a instanceof cb?"function":typeof a},rc=function(a){for(var b=this.m,c=0;c<arguments.length;c++){var d=arguments[c];"string"!=typeof d||b.add(d,void 0)}},sc=function(a,b,c,d){var e,f=this.a(d);if(this.a(c)&&
(e=this.F(f),e instanceof ra)){if("break"==e.a)return;if("return"==e.a)return e}for(;this.a(a);){e=this.F(f);if(e instanceof ra){if("break"==e.a)break;if("return"==e.a)return e}this.a(b)}},tc=function(a){return~Number(this.a(a))},uc=function(a,b){return Number(this.a(a))<<Number(this.a(b))},vc=function(a,b){return Number(this.a(a))>>Number(this.a(b))},yc=function(a,b){return Number(this.a(a))>>>Number(this.a(b))},zc=function(a,b){return Number(this.a(a))&Number(this.a(b))},Ac=function(a,b){return Number(this.a(a))^
Number(this.a(b))},Bc=function(a,b){return Number(this.a(a))|Number(this.a(b))};var Dc=function(){this.a=new ob;Cc(this)};Dc.prototype.hc=function(a){return Ec(this.a.i(a))};
var Gc=function(a,b){return Ec(Fc.a.s(a,b))},Cc=function(a){var b=function(d,e){var f=a.a,g=String(e);nb.hasOwnProperty(d)&&pb(f,g||d,nb[d])};b("control",49);b("fn",51);b("list",7);b("map",8);b("undefined",44);var c=function(d,e){pb(a.a,String(d),e)};c(0,zb);c(1,Ab);c(2,Db);c(3,Eb);c(53,Fb);c(4,Gb);c(5,Hb);c(52,Ib);c(6,Jb);c(9,Hb);c(50,Kb);c(10,Lb);c(12,Mb);c(13,Nb);c(47,Pb);c(54,Qb);c(55,Rb);c(15,Sb);c(16,Ub);c(17,Ub);c(18,Vb);c(19,Wb);c(20,Xb);c(21,Yb);c(22,Zb);c(23,$b);c(24,ac);c(25,bc);c(26,cc);
c(27,dc);c(28,ec);c(29,fc);c(45,gc);c(30,hc);c(32,ic);c(33,ic);c(34,jc);c(35,jc);c(46,kc);c(36,lc);c(43,mc);c(37,nc);c(38,oc);c(39,pc);c(40,qc);c(41,rc);c(42,sc);c(58,tc);c(57,uc);c(60,vc);c(61,yc);c(56,zc);c(62,Ac);c(59,Bc)},Ic=function(){var a=Fc,b=Hc();pb(a.a,"require",b)},Jc=function(a,b){a.a.a.N=b};function Ec(a){if(a instanceof ra||a instanceof cb||a instanceof k||a instanceof gb||null===a||void 0===a||"string"===typeof a||"number"===typeof a||"boolean"===typeof a)return a};
var Kc=[],Lc={"\x00":"&#0;",'"':"&quot;","&":"&amp;","'":"&#39;","<":"&lt;",">":"&gt;","\t":"&#9;","\n":"&#10;","\x0B":"&#11;","\f":"&#12;","\r":"&#13;"," ":"&#32;","-":"&#45;","/":"&#47;","=":"&#61;","`":"&#96;","\u0085":"&#133;","\u00a0":"&#160;","\u2028":"&#8232;","\u2029":"&#8233;"},Mc=function(a){return Lc[a]},Nc=/[\x00\x22\x26\x27\x3c\x3e]/g;var Rc=/[\x00\x08-\x0d\x22\x26\x27\/\x3c-\x3e\\\x85\u2028\u2029]/g,Sc={"\x00":"\\x00","\b":"\\x08","\t":"\\t","\n":"\\n","\x0B":"\\x0b",
"\f":"\\f","\r":"\\r",'"':"\\x22","&":"\\x26","'":"\\x27","/":"\\/","<":"\\x3c","=":"\\x3d",">":"\\x3e","\\":"\\\\","\u0085":"\\x85","\u2028":"\\u2028","\u2029":"\\u2029",$:"\\x24","(":"\\x28",")":"\\x29","*":"\\x2a","+":"\\x2b",",":"\\x2c","-":"\\x2d",".":"\\x2e",":":"\\x3a","?":"\\x3f","[":"\\x5b","]":"\\x5d","^":"\\x5e","{":"\\x7b","|":"\\x7c","}":"\\x7d"},Tc=function(a){return Sc[a]};
Kc[8]=function(a){if(null==a)return" null ";switch(typeof a){case "boolean":case "number":return" "+a+" ";default:return"'"+String(String(a)).replace(Rc,Tc)+"'"}};var cd=/[\x00- \x22\x27-\x29\x3c\x3e\\\x7b\x7d\x7f\x85\xa0\u2028\u2029\uff01\uff03\uff04\uff06-\uff0c\uff0f\uff1a\uff1b\uff1d\uff1f\uff20\uff3b\uff3d]/g,dd={"\x00":"%00","\u0001":"%01","\u0002":"%02","\u0003":"%03","\u0004":"%04","\u0005":"%05","\u0006":"%06","\u0007":"%07","\b":"%08","\t":"%09","\n":"%0A","\x0B":"%0B","\f":"%0C","\r":"%0D","\u000e":"%0E","\u000f":"%0F","\u0010":"%10",
"\u0011":"%11","\u0012":"%12","\u0013":"%13","\u0014":"%14","\u0015":"%15","\u0016":"%16","\u0017":"%17","\u0018":"%18","\u0019":"%19","\u001a":"%1A","\u001b":"%1B","\u001c":"%1C","\u001d":"%1D","\u001e":"%1E","\u001f":"%1F"," ":"%20",'"':"%22","'":"%27","(":"%28",")":"%29","<":"%3C",">":"%3E","\\":"%5C","{":"%7B","}":"%7D","\u007f":"%7F","\u0085":"%C2%85","\u00a0":"%C2%A0","\u2028":"%E2%80%A8","\u2029":"%E2%80%A9","\uff01":"%EF%BC%81","\uff03":"%EF%BC%83","\uff04":"%EF%BC%84","\uff06":"%EF%BC%86",
"\uff07":"%EF%BC%87","\uff08":"%EF%BC%88","\uff09":"%EF%BC%89","\uff0a":"%EF%BC%8A","\uff0b":"%EF%BC%8B","\uff0c":"%EF%BC%8C","\uff0f":"%EF%BC%8F","\uff1a":"%EF%BC%9A","\uff1b":"%EF%BC%9B","\uff1d":"%EF%BC%9D","\uff1f":"%EF%BC%9F","\uff20":"%EF%BC%A0","\uff3b":"%EF%BC%BB","\uff3d":"%EF%BC%BD"},ed=function(a){return dd[a]};Kc[16]=function(a){return a};var gd;
var hd=[],id=[],jd=[],kd=[],ld=[],md={},nd,od,pd,qd=function(a,b){var c={};c["function"]="__"+a;for(var d in b)b.hasOwnProperty(d)&&(c["vtp_"+d]=b[d]);return c},rd=function(a,b){var c=a["function"];if(!c)throw Error("Error: No function name given for function call.");var d=md[c],e={},f;for(f in a)a.hasOwnProperty(f)&&0===f.indexOf("vtp_")&&(e[void 0!==d?f:f.substr(4)]=a[f]);return void 0!==d?d(e):gd(c,e,b)},td=function(a,b,c){c=c||[];var d={},e;for(e in a)a.hasOwnProperty(e)&&(d[e]=sd(a[e],b,c));
return d},ud=function(a){var b=a["function"];if(!b)throw"Error: No function name given for function call.";var c=md[b];return c?c.priorityOverride||0:0},sd=function(a,b,c){if(Ha(a)){var d;switch(a[0]){case "function_id":return a[1];case "list":d=[];for(var e=1;e<a.length;e++)d.push(sd(a[e],b,c));return d;case "macro":var f=a[1];if(c[f])return;var g=hd[f];if(!g||b.cd(g))return;c[f]=!0;try{var h=td(g,b,c);h.vtp_gtmEventId=b.id;d=rd(h,b);pd&&(d=pd.og(d,h))}catch(y){b.Ve&&b.Ve(y,Number(f)),d=!1}c[f]=
!1;return d;case "map":d={};for(var l=1;l<a.length;l+=2)d[sd(a[l],b,c)]=sd(a[l+1],b,c);return d;case "template":d=[];for(var n=!1,m=1;m<a.length;m++){var r=sd(a[m],b,c);od&&(n=n||r===od.Sb);d.push(r)}return od&&n?od.rg(d):d.join("");case "escape":d=sd(a[1],b,c);if(od&&Ha(a[1])&&"macro"===a[1][0]&&od.Sg(a))return od.rh(d);d=String(d);for(var t=2;t<a.length;t++)Kc[a[t]]&&(d=Kc[a[t]](d));return d;case "tag":var q=a[1];if(!kd[q])throw Error("Unable to resolve tag reference "+q+".");return d={He:a[2],
index:q};case "zb":var u={arg0:a[2],arg1:a[3],ignore_case:a[5]};u["function"]=a[1];var v=vd(u,b,c),w=!!a[4];return w||2!==v?w!==(1===v):null;default:throw Error("Attempting to expand unknown Value type: "+a[0]+".");}}return a},vd=function(a,b,c){try{return nd(td(a,b,c))}catch(d){JSON.stringify(a)}return 2};var wd=function(){var a=function(b){return{toString:function(){return b}}};return{Md:a("convert_case_to"),Nd:a("convert_false_to"),Od:a("convert_null_to"),Pd:a("convert_true_to"),Qd:a("convert_undefined_to"),ci:a("debug_mode_metadata"),Oa:a("function"),wf:a("instance_name"),Af:a("live_only"),Cf:a("malware_disabled"),Df:a("metadata"),ei:a("original_vendor_template_id"),Hf:a("once_per_event"),$d:a("once_per_load"),ie:a("setup_tags"),ke:a("tag_id"),me:a("teardown_tags")}}();var xd=function(a,b,c){var d;d=Error.call(this);this.message=d.message;"stack"in d&&(this.stack=d.stack);this.i=a;this.a=c};la(xd,Error);function yd(a,b){if(Ha(a)){Object.defineProperty(a,"context",{value:{line:b[0]}});for(var c=1;c<a.length;c++)yd(a[c],b[c])}};var zd=function(a,b){var c;c=Error.call(this);this.message=c.message;"stack"in c&&(this.stack=c.stack);this.m=a;this.i=b;this.a=[]};la(zd,Error);var Ad=function(a){var b=a.a.slice();a.i&&(b=a.i(b));return b};var Cd=function(){return function(a,b){a instanceof zd||(a=new zd(a,Bd));b&&a.a.push(b);throw a;}};function Bd(a){if(!a.length)return a;a.push({id:"main",line:0});for(var b=a.length-1;0<b;b--)Ga(a[b].id)&&a.splice(b++,1);for(var c=a.length-1;0<c;c--)a[c].line=a[c-1].line;a.splice(0,1);return a};var Dd=null,Gd=function(a){function b(r){for(var t=0;t<r.length;t++)d[r[t]]=!0}var c=[],d=[];Dd=Ed(a);for(var e=0;e<id.length;e++){var f=id[e],g=Fd(f);if(g){for(var h=f.add||[],l=0;l<h.length;l++)c[h[l]]=!0;b(f.block||[])}else null===g&&b(f.block||[])}for(var n=[],m=0;m<kd.length;m++)c[m]&&!d[m]&&(n[m]=!0);return n},Fd=function(a){for(var b=a["if"]||[],c=0;c<b.length;c++){var d=Dd(b[c]);if(0===d)return!1;if(2===d)return null}for(var e=a.unless||[],f=0;f<e.length;f++){var g=Dd(e[f]);if(2===g)return null;
if(1===g)return!1}return!0},Ed=function(a){var b=[];return function(c){void 0===b[c]&&(b[c]=vd(jd[c],a));return b[c]}};var Hd={og:function(a,b){b[wd.Md]&&"string"===typeof a&&(a=1==b[wd.Md]?a.toLowerCase():a.toUpperCase());b.hasOwnProperty(wd.Od)&&null===a&&(a=b[wd.Od]);b.hasOwnProperty(wd.Qd)&&void 0===a&&(a=b[wd.Qd]);b.hasOwnProperty(wd.Pd)&&!0===a&&(a=b[wd.Pd]);b.hasOwnProperty(wd.Nd)&&!1===a&&(a=b[wd.Nd]);return a}};var Id=function(){this.a={}};function Jd(a,b,c,d){if(a)for(var e=0;e<a.length;e++){var f=void 0,g="A policy function denied the permission request";try{f=a[e].call(void 0,b,c,d),g+="."}catch(h){g="string"===typeof h?g+(": "+h):h instanceof Error?g+(": "+h.message):g+"."}if(!f)throw new xd(c,d,g);}}function Kd(a,b,c){return function(){var d=arguments[0];if(d){var e=a.a[d],f=a.a.all;if(e||f){var g=c.apply(void 0,Array.prototype.slice.call(arguments,0));Jd(e,b,d,g);Jd(f,b,d,g)}}}};var Od=function(a){var b=Ld.C,c=this;this.i=new Id;this.a={};var d={},e=Kd(this.i,b,function(){var f=arguments[0];return f&&d[f]?d[f].apply(void 0,Array.prototype.slice.call(arguments,0)):{}});Na(a,function(f,g){var h={};Na(g,function(l,n){var m=Md(l,n);h[l]=m.assert;d[l]||(d[l]=m.J)});c.a[f]=function(l,n){var m=h[l];if(!m)throw Nd(l,{},"The requested permission "+l+" is not configured.");var r=Array.prototype.slice.call(arguments,0);m.apply(void 0,r);e.apply(void 0,r)}})},Qd=function(a){return Pd.a[a]||
function(){}};function Md(a,b){var c=qd(a,b);c.vtp_permissionName=a;c.vtp_createPermissionError=Nd;try{return rd(c)}catch(d){return{assert:function(e){throw new xd(e,{},"Permission "+e+" is unknown.");},J:function(){for(var e={},f=0;f<arguments.length;++f)e["arg"+(f+1)]=arguments[f];return e}}}}function Nd(a,b,c){return new xd(a,b,c)};var Rd=!1;var Sd={};Sd.Th=Qa('');Sd.yg=Qa('');var Td=Rd,Ud=Sd.yg,Vd=Sd.Th;
var le=function(a,b){return a.length&&b.length&&a.lastIndexOf(b)===a.length-b.length},me=function(a,b){var c="*"===b.charAt(b.length-1)||"/"===b||"/*"===b;le(b,"/*")&&(b=b.slice(0,-2));le(b,"?")&&(b=b.slice(0,-1));var d=b.split("*");if(!c&&1===d.length)return a===d[0];for(var e=-1,f=0;f<d.length;f++){var g=d[f];if(g){e=a.indexOf(g,e);if(-1===e||0===f&&0!==e)return!1;e+=g.length}}if(c||e===a.length)return!0;var h=d[d.length-1];return a.lastIndexOf(h)===a.length-h.length},ne=/^[a-z0-9-]+$/i,oe=/^https:\/\/(\*\.|)((?:[a-z0-9-]+\.)+[a-z0-9-]+)\/(.*)$/i,
qe=function(a,b){var c;if(!(c=!pe(a))){var d;a:{var e=a.hostname.split(".");if(2>e.length)d=!1;else{for(var f=0;f<e.length;f++)if(!ne.exec(e[f])){d=!1;break a}d=!0}}c=!d}if(c)return!1;for(var g=0;g<b.length;g++){var h;var l=a,n=b[g];if(!oe.exec(n))throw Error("Invalid Wildcard");var m=n.slice(8),r=m.slice(0,m.indexOf("/")),t;var q=l.hostname,u=r;if(0!==u.indexOf("*."))t=q.toLowerCase()===u.toLowerCase();else{u=u.slice(2);var v=q.toLowerCase().indexOf(u.toLowerCase());t=-1===v?!1:q.length===u.length?
!0:q.length!==u.length+v?!1:"."===q[v-1]}if(t){var w=m.slice(m.indexOf("/"));h=me(l.pathname+l.search,w)?!0:!1}else h=!1;if(h)return!0}return!1},pe=function(a){return"https:"===a.protocol&&(!a.port||"443"===a.port)};/*
 Copyright (c) 2014 Derek Brans, MIT license https://github.com/krux/postscribe/blob/master/LICENSE. Portions derived from simplehtmlparser, which is licensed under the Apache License, Version 2.0 */

var re,se=function(){};(function(){function a(h,l){h=h||"";l=l||{};for(var n in b)b.hasOwnProperty(n)&&(l.bg&&(l["fix_"+n]=!0),l.Je=l.Je||l["fix_"+n]);var m={comment:/^\x3c!--/,endTag:/^<\//,atomicTag:/^<\s*(script|style|noscript|iframe|textarea)[\s\/>]/i,startTag:/^</,chars:/^[^<]/},r={comment:function(){var q=h.indexOf("--\x3e");if(0<=q)return{content:h.substr(4,q),length:q+3}},endTag:function(){var q=h.match(d);if(q)return{tagName:q[1],length:q[0].length}},atomicTag:function(){var q=r.startTag();
if(q){var u=h.slice(q.length);if(u.match(new RegExp("</\\s*"+q.tagName+"\\s*>","i"))){var v=u.match(new RegExp("([\\s\\S]*?)</\\s*"+q.tagName+"\\s*>","i"));if(v)return{tagName:q.tagName,U:q.U,content:v[1],length:v[0].length+q.length}}}},startTag:function(){var q=h.match(c);if(q){var u={};q[2].replace(e,function(v,w,y,x,A){var C=y||x||A||f.test(w)&&w||null,z=document.createElement("div");z.innerHTML=C;u[w]=z.textContent||z.innerText||C});return{tagName:q[1],U:u,Lb:!!q[3],length:q[0].length}}},chars:function(){var q=
h.indexOf("<");return{length:0<=q?q:h.length}}},t=function(){for(var q in m)if(m[q].test(h)){var u=r[q]();return u?(u.type=u.type||q,u.text=h.substr(0,u.length),h=h.slice(u.length),u):null}};l.Je&&function(){var q=/^(AREA|BASE|BASEFONT|BR|COL|FRAME|HR|IMG|INPUT|ISINDEX|LINK|META|PARAM|EMBED)$/i,u=/^(COLGROUP|DD|DT|LI|OPTIONS|P|TD|TFOOT|TH|THEAD|TR)$/i,v=[];v.Se=function(){return this[this.length-1]};v.ed=function(z){var D=this.Se();return D&&D.tagName&&D.tagName.toUpperCase()===z.toUpperCase()};v.ng=
function(z){for(var D=0,G;G=this[D];D++)if(G.tagName===z)return!0;return!1};var w=function(z){z&&"startTag"===z.type&&(z.Lb=q.test(z.tagName)||z.Lb);return z},y=t,x=function(){h="</"+v.pop().tagName+">"+h},A={startTag:function(z){var D=z.tagName;"TR"===D.toUpperCase()&&v.ed("TABLE")?(h="<TBODY>"+h,C()):l.oi&&u.test(D)&&v.ng(D)?v.ed(D)?x():(h="</"+z.tagName+">"+h,C()):z.Lb||v.push(z)},endTag:function(z){v.Se()?l.Ag&&!v.ed(z.tagName)?x():v.pop():l.Ag&&(y(),C())}},C=function(){var z=h,D=w(y());h=z;if(D&&
A[D.type])A[D.type](D)};t=function(){C();return w(y())}}();return{append:function(q){h+=q},zh:t,wi:function(q){for(var u;(u=t())&&(!q[u.type]||!1!==q[u.type](u)););},clear:function(){var q=h;h="";return q},xi:function(){return h},stack:[]}}var b=function(){var h={},l=this.document.createElement("div");l.innerHTML="<P><I></P></I>";h.zi="<P><I></P></I>"!==l.innerHTML;l.innerHTML="<P><i><P></P></i></P>";h.yi=2===l.childNodes.length;return h}(),c=/^<([\-A-Za-z0-9_]+)((?:\s+[\w\-]+(?:\s*=?\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/,
d=/^<\/([\-A-Za-z0-9_]+)[^>]*>/,e=/([\-A-Za-z0-9_]+)(?:\s*=\s*(?:(?:"((?:\\.|[^"])*)")|(?:'((?:\\.|[^'])*)')|([^>\s]+)))?/g,f=/^(checked|compact|declare|defer|disabled|ismap|multiple|nohref|noresize|noshade|nowrap|readonly|selected)$/i;a.m=b;a.s=function(h){var l={comment:function(n){return"<--"+n.content+"--\x3e"},endTag:function(n){return"</"+n.tagName+">"},atomicTag:function(n){return l.startTag(n)+n.content+l.endTag(n)},startTag:function(n){var m="<"+n.tagName,r;for(r in n.U){var t=n.U[r];m+=
" "+r+'="'+(t?t.replace(/(^|[^\\])"/g,'$1\\"'):"")+'"'}return m+(n.Lb?"/>":">")},chars:function(n){return n.text}};return l[h.type](h)};a.i=function(h){var l={},n;for(n in h){var m=h[n];l[n]=m&&m.replace(/(^|[^\\])"/g,'$1\\"')}return l};for(var g in b)a.a=a.a||!b[g]&&g;re=a})();(function(){function a(){}function b(r){return void 0!==r&&null!==r}function c(r,t,q){var u,v=r&&r.length||0;for(u=0;u<v;u++)t.call(q,r[u],u)}function d(r,t,q){for(var u in r)r.hasOwnProperty(u)&&t.call(q,u,r[u])}function e(r,
t){d(t,function(q,u){r[q]=u});return r}function f(r,t){r=r||{};d(t,function(q,u){b(r[q])||(r[q]=u)});return r}function g(r){try{return n.call(r)}catch(q){var t=[];c(r,function(u){t.push(u)});return t}}var h={Sf:a,Tf:a,Uf:a,Vf:a,cg:a,dg:function(r){return r},done:a,error:function(r){throw r;},Ch:!1},l=this;if(!l.postscribe){var n=Array.prototype.slice,m=function(){function r(q,u,v){var w="data-ps-"+u;if(2===arguments.length){var y=q.getAttribute(w);return b(y)?String(y):y}b(v)&&""!==v?q.setAttribute(w,
v):q.removeAttribute(w)}function t(q,u){var v=q.ownerDocument;e(this,{root:q,options:u,Mb:v.defaultView||v.parentWindow,Wa:v,yc:re("",{bg:!0}),Rc:[q],qd:"",rd:v.createElement(q.nodeName),Ib:[],Ma:[]});r(this.rd,"proxyof",0)}t.prototype.write=function(){[].push.apply(this.Ma,arguments);for(var q;!this.bc&&this.Ma.length;)q=this.Ma.shift(),"function"===typeof q?this.ig(q):this.Fd(q)};t.prototype.ig=function(q){var u={type:"function",value:q.name||q.toString()};this.md(u);q.call(this.Mb,this.Wa);this.We(u)};
t.prototype.Fd=function(q){this.yc.append(q);for(var u,v=[],w,y;(u=this.yc.zh())&&!(w=u&&"tagName"in u?!!~u.tagName.toLowerCase().indexOf("script"):!1)&&!(y=u&&"tagName"in u?!!~u.tagName.toLowerCase().indexOf("style"):!1);)v.push(u);this.Yh(v);w&&this.Lg(u);y&&this.Mg(u)};t.prototype.Yh=function(q){var u=this.fg(q);u.ye&&(u.ad=this.qd+u.ye,this.qd+=u.vh,this.rd.innerHTML=u.ad,this.Vh())};t.prototype.fg=function(q){var u=this.Rc.length,v=[],w=[],y=[];c(q,function(x){v.push(x.text);if(x.U){if(!/^noscript$/i.test(x.tagName)){var A=
u++;w.push(x.text.replace(/(\/?>)/," data-ps-id="+A+" $1"));"ps-script"!==x.U.id&&"ps-style"!==x.U.id&&y.push("atomicTag"===x.type?"":"<"+x.tagName+" data-ps-proxyof="+A+(x.Lb?" />":">"))}}else w.push(x.text),y.push("endTag"===x.type?x.text:"")});return{Ai:q,raw:v.join(""),ye:w.join(""),vh:y.join("")}};t.prototype.Vh=function(){for(var q,u=[this.rd];b(q=u.shift());){var v=1===q.nodeType;if(!v||!r(q,"proxyof")){v&&(this.Rc[r(q,"id")]=q,r(q,"id",null));var w=q.parentNode&&r(q.parentNode,"proxyof");
w&&this.Rc[w].appendChild(q)}u.unshift.apply(u,g(q.childNodes))}};t.prototype.Lg=function(q){var u=this.yc.clear();u&&this.Ma.unshift(u);q.src=q.U.src||q.U.hi;q.src&&this.Ib.length?this.bc=q:this.md(q);var v=this;this.Xh(q,function(){v.We(q)})};t.prototype.Mg=function(q){var u=this.yc.clear();u&&this.Ma.unshift(u);q.type=q.U.type||q.U.TYPE||"text/css";this.Zh(q);u&&this.write()};t.prototype.Zh=function(q){var u=this.hg(q);this.Pg(u);q.content&&(u.styleSheet&&!u.sheet?u.styleSheet.cssText=q.content:
u.appendChild(this.Wa.createTextNode(q.content)))};t.prototype.hg=function(q){var u=this.Wa.createElement(q.tagName);u.setAttribute("type",q.type);d(q.U,function(v,w){u.setAttribute(v,w)});return u};t.prototype.Pg=function(q){this.Fd('<span id="ps-style"/>');var u=this.Wa.getElementById("ps-style");u.parentNode.replaceChild(q,u)};t.prototype.md=function(q){q.mh=this.Ma;this.Ma=[];this.Ib.unshift(q)};t.prototype.We=function(q){q!==this.Ib[0]?this.options.error({message:"Bad script nesting or script finished twice"}):
(this.Ib.shift(),this.write.apply(this,q.mh),!this.Ib.length&&this.bc&&(this.md(this.bc),this.bc=null))};t.prototype.Xh=function(q,u){var v=this.gg(q),w=this.Mh(v),y=this.options.Sf;q.src&&(v.src=q.src,this.Hh(v,w?y:function(){u();y()}));try{this.Og(v),q.src&&!w||u()}catch(x){this.options.error(x),u()}};t.prototype.gg=function(q){var u=this.Wa.createElement(q.tagName);d(q.U,function(v,w){u.setAttribute(v,w)});q.content&&(u.text=q.content);return u};t.prototype.Og=function(q){this.Fd('<span id="ps-script"/>');
var u=this.Wa.getElementById("ps-script");u.parentNode.replaceChild(q,u)};t.prototype.Hh=function(q,u){function v(){q=q.onload=q.onreadystatechange=q.onerror=null}var w=this.options.error;e(q,{onload:function(){v();u()},onreadystatechange:function(){/^(loaded|complete)$/.test(q.readyState)&&(v(),u())},onerror:function(){var y={message:"remote script failed "+q.src};v();w(y);u()}})};t.prototype.Mh=function(q){return!/^script$/i.test(q.nodeName)||!!(this.options.Ch&&q.src&&q.hasAttribute("async"))};
return t}();l.postscribe=function(){function r(){var w=u.shift(),y;w&&(y=w[w.length-1],y.Tf(),w.stream=t.apply(null,w),y.Uf())}function t(w,y,x){function A(G){G=x.dg(G);v.write(G);x.Vf(G)}v=new m(w,x);v.id=q++;v.name=x.name||v.id;var C=w.ownerDocument,z={close:C.close,open:C.open,write:C.write,writeln:C.writeln};e(C,{close:a,open:a,write:function(){return A(g(arguments).join(""))},writeln:function(){return A(g(arguments).join("")+"\n")}});var D=v.Mb.onerror||a;v.Mb.onerror=function(G,L,Q){x.error({ui:G+
" - "+L+":"+Q});D.apply(v.Mb,arguments)};v.write(y,function(){e(C,z);v.Mb.onerror=D;x.done();v=null;r()});return v}var q=0,u=[],v=null;return e(function(w,y,x){"function"===typeof x&&(x={done:x});x=f(x,h);w=/^#/.test(w)?l.document.getElementById(w.substr(1)):w.si?w[0]:w;var A=[w,y,x];w.qh={cancel:function(){A.stream?A.stream.abort():A[1]=a}};x.cg(A);u.push(A);v||r();return w.qh},{streams:{},vi:u,ji:m})}();se=l.postscribe}})();var te=/^([a-z][a-z0-9]*):(!|\?)(\*|string|boolean|number|Fn|DustMap|List|OpaqueValue)$/i,ue={Fn:"function",DustMap:"Object",List:"Array"},F=function(a,b,c){for(var d=0;d<b.length;d++){var e=te.exec(b[d]);if(!e)throw Error("Internal Error in "+a);var f=e[1],g="!"===e[2],h=e[3],l=c[d],n=typeof l;if(null===l||"undefined"===n){if(g)throw Error("Error in "+a+". Required argument "+f+" not supplied.");}else if("*"!==h){var m=typeof l;l instanceof cb?m="Fn":l instanceof k?m="List":l instanceof gb?m="DustMap":
l instanceof rb&&(m="OpaqueValue");if(m!=h)throw Error("Error in "+a+". Argument "+f+" has type "+m+", which does not match required type "+(ue[h]||h)+".");}}};function ve(a){return""+a}
function we(a,b){var c=[];return c};var xe=function(a,b){var c=new cb(a,function(){for(var d=Array.prototype.slice.call(arguments,0),e=0;e<d.length;e++)d[e]=this.a(d[e]);return b.apply(this,d)});c.m=!0;return c},ye=function(a,b){var c=new gb,d;for(d in b)if(b.hasOwnProperty(d)){var e=b[d];Fa(e)?c.set(d,xe(a+"_"+d,e)):(Ga(e)||p(e)||"boolean"==typeof e)&&c.set(d,e)}c.m=!0;return c};var ze=function(a,b){F(this.i.a,["apiName:!string","message:?string"],arguments);var c={},d=new gb;return d=ye("AssertApiSubject",c)};var Ae=function(a,b){F(this.i.a,["actual:?*","message:?string"],arguments);var c={},d=new gb;return d=ye("AssertThatSubject",c)};function Be(a){return function(){for(var b=[],c=this.m,d=0;d<arguments.length;++d)b.push(sb(arguments[d],c));return tb(a.apply(null,b))}}var De=function(){for(var a=Math,b=Ce,c={},d=0;d<b.length;d++){var e=b[d];a.hasOwnProperty(e)&&(c[e]=Be(a[e].bind(a)))}return c};var Ee=function(a){var b;return b};var Fe=function(a){var b;return b};var Ge=function(a){F(this.i.a,["uri:!string"],arguments);return encodeURI(a)};var He=function(a){F(this.i.a,["uri:!string"],arguments);return encodeURIComponent(a)};var Ie=function(a){F(this.i.a,["message:?string"],arguments);};var Je=function(a,b){F(this.i.a,["min:!number","max:!number"],arguments);return Ka(a,b)};var Ke=function(a,b,c){var d=a.m.a;if(!d)throw Error("Missing program state.");d.ag.apply(null,Array.prototype.slice.call(arguments,1))};var Le=function(){Ke(this,"read_container_data");var a=new gb;a.set("containerId",'GTM-NWDMT9Q');a.set("version",'180');a.set("environmentName",'');a.set("debugMode",Td);a.set("previewMode",Vd);a.set("environmentMode",Ud);a.m=!0;return a};var Me=function(){return(new Date).getTime()};var Ne=function(a){if(null===a)return"null";if(a instanceof k)return"array";if(a instanceof cb)return"function";if(a instanceof rb){a=a.qa;if(void 0===a.constructor||void 0===a.constructor.name){var b=String(a);return b.substring(8,b.length-1)}return String(a.constructor.name)}return typeof a};var Oe=function(a){function b(c){return function(d){try{return c(d)}catch(e){(Td||Vd)&&a.call(this,e.message)}}}return{parse:b(function(c){return tb(JSON.parse(c))}),stringify:b(function(c){return JSON.stringify(sb(c))})}};var Pe=function(a){return Pa(sb(a,this.m))};var Qe=function(a){return Number(sb(a,this.m))};var Re=function(a){return null===a?"null":void 0===a?"undefined":a.toString()};var Se=function(a,b,c){var d=null,e=!1;return e?d:null};var Ce="floor ceil round max min abs pow sqrt".split(" ");var Te=function(){var a={};return{Gg:function(b){return a.hasOwnProperty(b)?a[b]:void 0},Lh:function(b,c){a[b]=c},reset:function(){a={}}}},Ue=function(a,b){F(this.i.a,["apiName:!string","mock:?*"],arguments);};var Ve=function(){this.a={};this.i={}};Ve.prototype.get=function(a,b){var c=this.a.hasOwnProperty(a)?this.a[a]:void 0;return c};
Ve.prototype.add=function(a,b,c){if(this.a.hasOwnProperty(a))throw"Attempting to add a function which already exists: "+a+".";if(this.i.hasOwnProperty(a))throw"Attempting to add an API with an existing private API name: "+a+".";this.a[a]=c?void 0:Fa(b)?xe(a,b):ye(a,b)};
var Xe=function(a){var b=We;if(a.i.hasOwnProperty("getUserAgent"))throw"Attempting to add a private function which already exists: getUserAgent.";if(a.a.hasOwnProperty("getUserAgent"))throw"Attempting to add a private function with an existing API name: getUserAgent.";a.i.getUserAgent=Fa(b)?xe("getUserAgent",b):ye("getUserAgent",b)};function Ye(){var a={};return a};var H={hb:"_ee",Pc:"_syn",ii:"_uei",fi:"_pci",Lc:"event_callback",Rb:"event_timeout",ka:"gtag.config",la:"allow_ad_personalization_signals",Mc:"restricted_data_processing",fb:"allow_google_signals",ma:"cookie_expires",Qb:"cookie_update",gb:"session_duration",oa:"user_properties",Ba:"transport_url",R:"ads_data_redaction",o:"ad_storage",L:"analytics_storage",lf:"region",nf:"wait_for_update"};
H.Ge=[H.la,H.fb,H.Qb];H.Me=[H.ma,H.Rb,H.gb];var Ze={},$e=function(a,b){Ze[a]=Ze[a]||[];Ze[a][b]=!0},af=function(a){for(var b=[],c=Ze[a]||[],d=0;d<c.length;d++)c[d]&&(b[Math.floor(d/6)]^=1<<d%6);for(var e=0;e<b.length;e++)b[e]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(b[e]||0);return b.join("")};var I=function(a){$e("GTM",a)};var bf=function(a){if(Error.captureStackTrace)Error.captureStackTrace(this,bf);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))};pa(bf,Error);bf.prototype.name="CustomError";var cf=function(a,b){for(var c=a.split("%s"),d="",e=c.length-1,f=0;f<e;f++)d+=c[f]+(f<b.length?b[f]:"%s");bf.call(this,d+c[e])};pa(cf,bf);cf.prototype.name="AssertionError";var df=function(a,b){throw new cf("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));};var ef=function(a,b){var c=function(){};c.prototype=a.prototype;var d=new c;a.apply(d,Array.prototype.slice.call(arguments,1));return d};var ff;var gf=/^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i;var hf;a:{var jf=ma.navigator;if(jf){var kf=jf.userAgent;if(kf){hf=kf;break a}}hf=""}var lf=function(a){return-1!=hf.indexOf(a)};var nf=function(){this.a="";this.i=mf};nf.prototype.toString=function(){return"SafeHtml{"+this.a+"}"};var of=function(a){if(a instanceof nf&&a.constructor===nf&&a.i===mf)return a.a;var b=typeof a;df("expected object of type SafeHtml, got '"+a+"' of type "+("object"!=b?b:a?Array.isArray(a)?"array":b:"null"));return"type_error:SafeHtml"},mf={},pf=new nf;pf.a=ma.trustedTypes&&ma.trustedTypes.emptyHTML?ma.trustedTypes.emptyHTML:"";var qf={MATH:!0,SCRIPT:!0,STYLE:!0,SVG:!0,TEMPLATE:!0},rf=function(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}}(function(){if("undefined"===typeof document)return!1;var a=document.createElement("div"),b=document.createElement("div");b.appendChild(document.createElement("div"));a.appendChild(b);if(!a.firstChild)return!1;var c=a.firstChild.firstChild;a.innerHTML=of(pf);return!c.parentElement}),sf=function(a,b){if(qf[a.tagName.toUpperCase()])throw Error("goog.dom.safe.setInnerHtml cannot be used to set content of "+
a.tagName+".");if(rf())for(;a.lastChild;)a.removeChild(a.lastChild);a.innerHTML=of(b)};var tf=function(a){var b=new nf,c;if(void 0===ff){var d=null,e=ma.trustedTypes;if(e&&e.createPolicy){try{d=e.createPolicy("goog#html",{createHTML:qa,createScript:qa,createScriptURL:qa})}catch(f){ma.console&&ma.console.error(f.message)}ff=d}else ff=d}c=ff;b.a=c?c.createHTML(a):a;return b};var B=window,K=document,uf=navigator,vf=K.currentScript&&K.currentScript.src,wf=function(a,b){var c=B[a];B[a]=void 0===c?b:c;return B[a]},xf=function(a,b){b&&(a.addEventListener?a.onload=b:a.onreadystatechange=function(){a.readyState in{loaded:1,complete:1}&&(a.onreadystatechange=null,b())})},yf=function(a,b,c){var d=K.createElement("script");d.type="text/javascript";d.async=!0;d.src=a;xf(d,b);c&&(d.onerror=c);var e;if(null===oa)b:{var f=ma.document,g=f.querySelector&&f.querySelector("script[nonce]");
if(g){var h=g.nonce||g.getAttribute("nonce");if(h&&na.test(h)){oa=h;break b}}oa=""}e=oa;e&&d.setAttribute("nonce",e);var l=K.getElementsByTagName("script")[0]||K.body||K.head;l.parentNode.insertBefore(d,l);return d},zf=function(){if(vf){var a=vf.toLowerCase();if(0===a.indexOf("https://"))return 2;if(0===a.indexOf("http://"))return 3}return 1},Af=function(a,b){var c=K.createElement("iframe");c.height="0";c.width="0";c.style.display="none";c.style.visibility="hidden";var d=K.body&&K.body.lastChild||
K.body||K.head;d.parentNode.insertBefore(c,d);xf(c,b);void 0!==a&&(c.src=a);return c},Bf=function(a,b,c){var d=new Image(1,1);d.onload=function(){d.onload=null;b&&b()};d.onerror=function(){d.onerror=null;c&&c()};d.src=a;return d},Cf=function(a,b,c,d){a.addEventListener?a.addEventListener(b,c,!!d):a.attachEvent&&a.attachEvent("on"+b,c)},Df=function(a,b,c){a.removeEventListener?a.removeEventListener(b,c,!1):a.detachEvent&&a.detachEvent("on"+b,c)},N=function(a){B.setTimeout(a,0)},Ef=function(a,b){return a&&
b&&a.attributes&&a.attributes[b]?a.attributes[b].value:null},Ff=function(a){var b=a.innerText||a.textContent||"";b&&" "!=b&&(b=b.replace(/^[\s\xa0]+|[\s\xa0]+$/g,""));b&&(b=b.replace(/(\xa0+|\s{2,}|\n|\r\t)/g," "));return b},Gf=function(a){var b=K.createElement("div");sf(b,tf("A<div>"+a+"</div>"));b=b.lastChild;for(var c=[];b.firstChild;)c.push(b.removeChild(b.firstChild));return c},Hf=function(a,b,c){c=c||100;for(var d={},e=0;e<b.length;e++)d[b[e]]=!0;for(var f=a,g=0;f&&g<=c;g++){if(d[String(f.tagName).toLowerCase()])return f;
f=f.parentElement}return null},If=function(a){uf.sendBeacon&&uf.sendBeacon(a)||Bf(a)},Jf=function(a,b){var c=a[b];c&&"string"===typeof c.animVal&&(c=c.animVal);return c};var Kf={},Lf=function(a){return void 0==Kf[a]?!1:Kf[a]};var Mf=[];function Nf(){var a=wf("google_tag_data",{});a.ics||(a.ics={entries:{},set:Of,update:Pf,addListener:Qf,notifyListeners:Rf,active:!1});return a.ics}
function Of(a,b,c,d,e,f){var g=Nf();g.active=!0;if(void 0!=b){var h=g.entries,l=h[a]||{},n=l.region,m=c&&p(c)?c.toUpperCase():void 0;d=d.toUpperCase();e=e.toUpperCase();if(m===e||(m===d?n!==e:!m&&!n)){var r=!!(f&&0<f&&void 0===l.update),t={region:m,initial:"granted"===b,update:l.update,quiet:r};h[a]=t;r&&B.setTimeout(function(){h[a]===t&&t.quiet&&(t.quiet=!1,Sf(a),Rf(),$e("TAGGING",2))},f)}}}
function Pf(a,b){var c=Nf();c.active=!0;if(void 0!=b){var d=Tf(a),e=c.entries,f=e[a]=e[a]||{};f.update="granted"===b;var g=Tf(a);f.quiet?(f.quiet=!1,Sf(a)):g!==d&&Sf(a)}}function Qf(a,b){Mf.push({Be:a,Bg:b})}function Sf(a){for(var b=0;b<Mf.length;++b){var c=Mf[b];Ha(c.Be)&&-1!==c.Be.indexOf(a)&&(c.Ze=!0)}}function Rf(){for(var a=0;a<Mf.length;++a){var b=Mf[a];if(b.Ze){b.Ze=!1;try{b.Bg.call()}catch(c){}}}}
var Tf=function(a){var b=Nf().entries[a]||{};return void 0!==b.update?b.update:void 0!==b.initial?b.initial:void 0},Uf=function(a){return!(Nf().entries[a]||{}).quiet},Vf=function(){return Lf("gtag_cs_api")?Nf().active:!1},Wf=function(a,b){Nf().addListener(a,b)},Xf=function(a,b){function c(){for(var e=0;e<b.length;e++)if(!Uf(b[e]))return!0;return!1}if(c()){var d=!1;Wf(b,function(){d||c()||(d=!0,a())})}else a()},Yf=function(a,b){if(!1===Tf(b)){var c=!1;Wf([b],function(){!c&&Tf(b)&&(a(),c=!0)})}};var Zf=[H.o,H.L],$f=function(a){var b=a[H.lf];b&&I(40);var c=a[H.nf];c&&I(41);for(var d=Ha(b)?b:[b],e=0;e<d.length;++e)for(var f=0;f<Zf.length;f++){var g=Zf[f],h=a[Zf[f]],l=d[e];Nf().set(g,h,l,"US","US-FL",c)}},ag=function(a){for(var b=0;b<Zf.length;b++){var c=Zf[b],d=a[Zf[b]];Nf().update(c,d)}Nf().notifyListeners()},bg=function(a){var b=Tf(a);return void 0!=b?b:!0},cg=function(){for(var a=[],b=0;b<Zf.length;b++){var c=Tf(Zf[b]);a[b]=!0===c?"1":!1===c?"0":"-"}return"G1"+a.join("")},
dg=function(a,b){Xf(a,b)};var fg=function(a){return eg?K.querySelectorAll(a):null},gg=function(a,b){if(!eg)return null;if(Element.prototype.closest)try{return a.closest(b)}catch(e){return null}var c=Element.prototype.matches||Element.prototype.webkitMatchesSelector||Element.prototype.mozMatchesSelector||Element.prototype.msMatchesSelector||Element.prototype.oMatchesSelector,d=a;if(!K.documentElement.contains(d))return null;do{try{if(c.call(d,b))return d}catch(e){break}d=d.parentElement||d.parentNode}while(null!==d&&1===d.nodeType);
return null},hg=!1;if(K.querySelectorAll)try{var ig=K.querySelectorAll(":root");ig&&1==ig.length&&ig[0]==K.documentElement&&(hg=!0)}catch(a){}var eg=hg;var Ld={},O=null,wg=Math.random();Ld.C="GTM-NWDMT9Q";Ld.Wb="8c0";Ld.di="";var xg={__cl:!0,__ecl:!0,__ehl:!0,__evl:!0,__fal:!0,__fil:!0,__fsl:!0,__hl:!0,__jel:!0,__lcl:!0,__sdl:!0,__tl:!0,__ytl:!0,__paused:!0,__tg:!0},yg="www.googletagmanager.com/gtm.js";
var zg=yg,Ag=null,Bg=null,Cg="//www.googletagmanager.com/a?id="+Ld.C+"&cv=180",Dg={},Eg={},Fg=function(){var a=O.sequence||1;O.sequence=a+1;return a};
var Gg=function(){return"&tc="+kd.filter(function(a){return a}).length},Jg=function(){Hg||(Hg=B.setTimeout(Ig,500))},Ig=function(){Hg&&(B.clearTimeout(Hg),Hg=void 0);void 0===Kg||Lg[Kg]&&!Mg&&!Ng||(Og[Kg]||Pg.Ug()||0>=Qg--?(I(1),Og[Kg]=!0):(Pg.Ah(),Bf(Rg()),Lg[Kg]=!0,Sg=Tg=Ng=Mg=""))},Rg=function(){var a=Kg;if(void 0===a)return"";var b=af("GTM"),c=af("TAGGING");return[Ug,Lg[a]?"":"&es=1",Vg[a],b?"&u="+b:"",c?"&ut="+c:"",Gg(),Mg,Ng,Tg,Sg,"&z=0"].join("")},Wg=function(){return[Cg,"&v=3&t=t","&pid="+
Ka(),"&rv="+Ld.Wb].join("")},Xg="0.005000">Math.random(),Ug=Wg(),Yg=function(){Ug=Wg()},Lg={},Mg="",Ng="",Sg="",Tg="",Kg=void 0,Vg={},Og={},Hg=void 0,Pg=function(a,b){var c=0,d=0;return{Ug:function(){if(c<a)return!1;Ta()-d>=b&&(c=0);return c>=a},Ah:function(){Ta()-d>=b&&(c=0);c++;d=Ta()}}}(2,1E3),Qg=1E3,Zg=function(a,b){if(Xg&&!Og[a]&&Kg!==a){Ig();Kg=a;Sg=Mg="";var c;c=0===b.indexOf("gtm.")?encodeURIComponent(b):"*";Vg[a]="&e="+c+"&eid="+a;Jg()}},$g=function(a,b,c){if(Xg&&!Og[a]&&
b){a!==Kg&&(Ig(),Kg=a);var d,e=String(b[wd.Oa]||"").replace(/_/g,"");0===e.indexOf("cvt")&&(e="cvt");d=e;var f=c+d;Mg=Mg?Mg+"."+f:"&tr="+f;var g=b["function"];if(!g)throw Error("Error: No function name given for function call.");var h=(md[g]?"1":"2")+d;Sg=Sg?Sg+"."+h:"&ti="+h;Jg();2022<=Rg().length&&Ig()}},ah=function(a,b,c){if(Xg&&!Og[a]){a!==Kg&&(Ig(),Kg=a);var d=c+b;Ng=Ng?Ng+
"."+d:"&epr="+d;Jg();2022<=Rg().length&&Ig()}};var bh={},ch=new La,dh={},eh={},hh={name:"dataLayer",set:function(a,b){E($a(a,b),dh);fh()},get:function(a){return gh(a,2)},reset:function(){ch=new La;dh={};fh()}},gh=function(a,b){if(2!=b){var c=ch.get(a);Xg&&c!==ih(a.split("."))&&I(5);return c}return ih(a.split("."))},ih=function(a){for(var b=dh,c=0;c<a.length;c++){if(null===b)return!1;if(void 0===b)break;b=b[a[c]]}return b},jh=function(a,b){eh.hasOwnProperty(a)||(ch.set(a,b),E($a(a,b),dh),fh())},fh=function(a){Na(eh,function(b,c){ch.set(b,c);
E($a(b,void 0),dh);E($a(b,c),dh);a&&delete eh[b]})},kh=function(a,b,c){bh[a]=bh[a]||{};var d=1!==c?ih(b.split(".")):ch.get(b);"array"===ib(d)||"object"===ib(d)?bh[a][b]=E(d):bh[a][b]=d},lh=function(a,b){if(bh[a])return bh[a][b]},mh=function(a,b){bh[a]&&delete bh[a][b]};var ph=/:[0-9]+$/,qh=function(a,b,c,d){for(var e=[],f=a.split("&"),g=0;g<f.length;g++){var h=f[g].split("=");if(decodeURIComponent(h[0]).replace(/\+/g," ")===b){var l=h.slice(1).join("=");if(!c)return d?l:decodeURIComponent(l).replace(/\+/g," ");e.push(d?l:decodeURIComponent(l).replace(/\+/g," "))}}return c?e:void 0},th=function(a,b,c,d,e){b&&(b=String(b).toLowerCase());if("protocol"===b||"port"===b)a.protocol=rh(a.protocol)||rh(B.location.protocol);"port"===b?a.port=String(Number(a.hostname?a.port:
B.location.port)||("http"==a.protocol?80:"https"==a.protocol?443:"")):"host"===b&&(a.hostname=(a.hostname||B.location.hostname).replace(ph,"").toLowerCase());return sh(a,b,c,d,e)},sh=function(a,b,c,d,e){var f,g=rh(a.protocol);b&&(b=String(b).toLowerCase());switch(b){case "url_no_fragment":f=uh(a);break;case "protocol":f=g;break;case "host":f=a.hostname.replace(ph,"").toLowerCase();if(c){var h=/^www\d*\./.exec(f);h&&h[0]&&(f=f.substr(h[0].length))}break;case "port":f=String(Number(a.port)||("http"==
g?80:"https"==g?443:""));break;case "path":a.pathname||a.hostname||$e("TAGGING",1);f="/"==a.pathname.substr(0,1)?a.pathname:"/"+a.pathname;var l=f.split("/");0<=Ia(d||[],l[l.length-1])&&(l[l.length-1]="");f=l.join("/");break;case "query":f=a.search.replace("?","");e&&(f=qh(f,e,!1,void 0));break;case "extension":var n=a.pathname.split(".");f=1<n.length?n[n.length-1]:"";f=f.split("/")[0];break;case "fragment":f=a.hash.replace("#","");break;default:f=a&&a.href}return f},rh=function(a){return a?a.replace(":",
"").toLowerCase():""},uh=function(a){var b="";if(a&&a.href){var c=a.href.indexOf("#");b=0>c?a.href:a.href.substr(0,c)}return b},vh=function(a){var b=K.createElement("a");a&&(b.href=a);var c=b.pathname;"/"!==c[0]&&(a||$e("TAGGING",1),c="/"+c);var d=b.hostname.replace(ph,"");return{href:b.href,protocol:b.protocol,host:b.host,hostname:d,pathname:c,search:b.search,hash:b.hash,port:b.port}},wh=function(a){function b(n){var m=n.split("=")[0];return 0>d.indexOf(m)?n:m+"=0"}function c(n){return n.split("&").map(b).filter(function(m){return void 0!=
m}).join("&")}var d="gclid dclid gclaw gcldc gclgp gclha gclgf _gl".split(" "),e=vh(a),f=a.split(/[?#]/)[0],g=e.search,h=e.hash;"?"===g[0]&&(g=g.substring(1));"#"===h[0]&&(h=h.substring(1));g=c(g);h=c(h);""!==g&&(g="?"+g);""!==h&&(h="#"+h);var l=""+f+g+h;"/"===l[l.length-1]&&(l=l.substring(0,l.length-1));return l};function xh(a,b,c){for(var d=[],e=b.split(";"),f=0;f<e.length;f++){var g=e[f].split("="),h=g[0].replace(/^\s*|\s*$/g,"");if(h&&h==a){var l=g.slice(1).join("=").replace(/^\s*|\s*$/g,"");l&&c&&(l=decodeURIComponent(l));d.push(l)}}return d};var zh=function(a,b,c,d){return yh(d)?xh(a,String(b||document.cookie),c):[]},Dh=function(a,b,c,d,e){if(yh(e)){var f=Bh(a,d,e);if(1===f.length)return f[0].id;if(0!==f.length){f=Ch(f,function(g){return g.cc},b);if(1===f.length)return f[0].id;f=Ch(f,function(g){return g.Gb},c);return f[0]?f[0].id:void 0}}};function Eh(a,b,c,d){var e=document.cookie;document.cookie=a;var f=document.cookie;return e!=f||void 0!=c&&0<=zh(b,f,!1,d).indexOf(c)}
var Ih=function(a,b,c,d){function e(w,y,x){if(null==x)return delete h[y],w;h[y]=x;return w+"; "+y+"="+x}function f(w,y){if(null==y)return delete h[y],w;h[y]=!0;return w+"; "+y}if(!yh(c.Ia))return 2;var g;void 0==b?g=a+"=deleted; expires="+(new Date(0)).toUTCString():(c.encode&&(b=encodeURIComponent(b)),b=Fh(b),g=a+"="+b);var h={};g=e(g,"path",c.path);var l;c.expires instanceof Date?l=c.expires.toUTCString():null!=c.expires&&(l=""+c.expires);g=e(g,"expires",l);g=e(g,"max-age",c.dh);g=e(g,"samesite",
c.Eh);c.Ih&&(g=f(g,"secure"));var n=c.domain;if("auto"===n){for(var m=Gh(),r=void 0,t=!1,q=0;q<m.length;++q){var u="none"!==m[q]?m[q]:void 0,v=e(g,"domain",u);v=f(v,c.flags);try{d&&d(a,h)}catch(w){r=w;continue}t=!0;if(!Hh(u,c.path)&&Eh(v,a,b,c.Ia))return 0}if(r&&!t)throw r;return 1}n&&"none"!==n&&(g=e(g,"domain",n));g=f(g,c.flags);d&&d(a,h);return Hh(n,c.path)?1:Eh(g,a,b,c.Ia)?0:1},Jh=function(a,b,c){null==c.path&&(c.path="/");c.domain||(c.domain="auto");return Ih(a,b,c)};
function Ch(a,b,c){for(var d=[],e=[],f,g=0;g<a.length;g++){var h=a[g],l=b(h);l===c?d.push(h):void 0===f||l<f?(e=[h],f=l):l===f&&e.push(h)}return 0<d.length?d:e}function Bh(a,b,c){for(var d=[],e=zh(a,void 0,void 0,c),f=0;f<e.length;f++){var g=e[f].split("."),h=g.shift();if(!b||-1!==b.indexOf(h)){var l=g.shift();l&&(l=l.split("-"),d.push({id:g.join("."),cc:1*l[0]||1,Gb:1*l[1]||1}))}}return d}
var Fh=function(a){a&&1200<a.length&&(a=a.substring(0,1200));return a},Kh=/^(www\.)?google(\.com?)?(\.[a-z]{2})?$/,Lh=/(^|\.)doubleclick\.net$/i,Hh=function(a,b){return Lh.test(document.location.hostname)||"/"===b&&Kh.test(a)},Gh=function(){var a=[],b=document.location.hostname.split(".");if(4===b.length){var c=b[b.length-1];if(parseInt(c,10).toString()===c)return["none"]}for(var d=b.length-2;0<=d;d--)a.push(b.slice(d).join("."));var e=document.location.hostname;Lh.test(e)||Kh.test(e)||a.push("none");
return a},yh=function(a){if(!Lf("gtag_cs_api")||!a||!Vf())return!0;if(!Uf(a))return!1;var b=Tf(a);return null==b?!0:!!b};var Mh=function(){for(var a=uf.userAgent+(K.cookie||"")+(K.referrer||""),b=a.length,c=B.history.length;0<c;)a+=c--^b++;var d=1,e,f,g;if(a)for(d=0,f=a.length-1;0<=f;f--)g=a.charCodeAt(f),d=(d<<6&268435455)+g+(g<<14),e=d&266338304,d=0!=e?d^e>>21:d;return[Math.round(2147483647*Math.random())^d&2147483647,Math.round(Ta()/1E3)].join(".")},Ph=function(a,b,c,d,e){var f=Nh(b);return Dh(a,f,Oh(c),d,e)},Qh=function(a,b,c,d){var e=""+Nh(c),f=Oh(d);1<f&&(e+="-"+f);return[b,e,a].join(".")},Nh=function(a){if(!a)return 1;
a=0===a.indexOf(".")?a.substr(1):a;return a.split(".").length},Oh=function(a){if(!a||"/"===a)return 1;"/"!==a[0]&&(a="/"+a);"/"!==a[a.length-1]&&(a+="/");return a.split("/").length-1};function Rh(a,b,c){var d,e=a.Eb;null==e&&(e=7776E3);0!==e&&(d=new Date((b||Ta())+1E3*e));return{path:a.path,domain:a.domain,flags:a.flags,encode:!!c,expires:d}};var Sh=["1"],Th={},Xh=function(a){var b=Uh(a.prefix);Th[b]||Vh(b,a.path,a.domain)||(Wh(b,Mh(),a),Vh(b,a.path,a.domain))};function Wh(a,b,c){var d=Qh(b,"1",c.domain,c.path),e=Rh(c);e.Ia="ad_storage";Jh(a,d,e)}function Vh(a,b,c){var d=Ph(a,b,c,Sh,"ad_storage");d&&(Th[a]=d);return d}function Uh(a){return(a||"_gcl")+"_au"};function Yh(){for(var a=Zh,b={},c=0;c<a.length;++c)b[a[c]]=c;return b}function $h(){var a="ABCDEFGHIJKLMNOPQRSTUVWXYZ";a+=a.toLowerCase()+"0123456789-_";return a+"."}var Zh,ai;function bi(a){Zh=Zh||$h();ai=ai||Yh();for(var b=[],c=0;c<a.length;c+=3){var d=c+1<a.length,e=c+2<a.length,f=a.charCodeAt(c),g=d?a.charCodeAt(c+1):0,h=e?a.charCodeAt(c+2):0,l=f>>2,n=(f&3)<<4|g>>4,m=(g&15)<<2|h>>6,r=h&63;e||(r=64,d||(m=64));b.push(Zh[l],Zh[n],Zh[m],Zh[r])}return b.join("")}
function ci(a){function b(l){for(;d<a.length;){var n=a.charAt(d++),m=ai[n];if(null!=m)return m;if(!/^[\s\xa0]*$/.test(n))throw Error("Unknown base64 encoding at char: "+n);}return l}Zh=Zh||$h();ai=ai||Yh();for(var c="",d=0;;){var e=b(-1),f=b(0),g=b(64),h=b(64);if(64===h&&-1===e)return c;c+=String.fromCharCode(e<<2|f>>4);64!=g&&(c+=String.fromCharCode(f<<4&240|g>>2),64!=h&&(c+=String.fromCharCode(g<<6&192|h)))}};var di;var hi=function(){var a=ei,b=fi,c=gi(),d=function(g){a(g.target||g.srcElement||{})},e=function(g){b(g.target||g.srcElement||{})};if(!c.init){Cf(K,"mousedown",d);Cf(K,"keyup",d);Cf(K,"submit",e);var f=HTMLFormElement.prototype.submit;HTMLFormElement.prototype.submit=function(){b(this);f.call(this)};c.init=!0}},ii=function(a,b,c,d,e){var f={callback:a,domains:b,fragment:2===c,placement:c,forms:d,sameHost:e};gi().decorators.push(f)},ji=function(a,b,c){for(var d=gi().decorators,e={},f=0;f<d.length;++f){var g=
d[f],h;if(h=!c||g.forms)a:{var l=g.domains,n=a,m=!!g.sameHost;if(l&&(m||n!==K.location.hostname))for(var r=0;r<l.length;r++)if(l[r]instanceof RegExp){if(l[r].test(n)){h=!0;break a}}else if(0<=n.indexOf(l[r])||m&&0<=l[r].indexOf(n)){h=!0;break a}h=!1}if(h){var t=g.placement;void 0==t&&(t=g.fragment?2:1);t===b&&Wa(e,g.callback())}}return e},gi=function(){var a=wf("google_tag_data",{}),b=a.gl;b&&b.decorators||(b={decorators:[]},a.gl=b);return b};var ki=/(.*?)\*(.*?)\*(.*)/,li=/^https?:\/\/([^\/]*?)\.?cdn\.ampproject\.org\/?(.*)/,mi=/^(?:www\.|m\.|amp\.)+/,ni=/([^?#]+)(\?[^#]*)?(#.*)?/;function oi(a){return new RegExp("(.*?)(^|&)"+a+"=([^&]*)&?(.*)")}
var qi=function(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];void 0!==d&&d===d&&null!==d&&"[object Object]"!==d.toString()&&(b.push(c),b.push(bi(String(d))))}var e=b.join("*");return["1",pi(e),e].join("*")},pi=function(a,b){var c=[window.navigator.userAgent,(new Date).getTimezoneOffset(),window.navigator.userLanguage||window.navigator.language,Math.floor((new Date).getTime()/60/1E3)-(void 0===b?0:b),a].join("*"),d;if(!(d=di)){for(var e=Array(256),f=0;256>f;f++){for(var g=f,h=0;8>h;h++)g=
g&1?g>>>1^3988292384:g>>>1;e[f]=g}d=e}di=d;for(var l=4294967295,n=0;n<c.length;n++)l=l>>>8^di[(l^c.charCodeAt(n))&255];return((l^-1)>>>0).toString(36)},si=function(){return function(a){var b=vh(B.location.href),c=b.search.replace("?",""),d=qh(c,"_gl",!1,!0)||"";a.query=ri(d)||{};var e=th(b,"fragment").match(oi("_gl"));a.fragment=ri(e&&e[3]||"")||{}}},ti=function(a){var b=si(),c=gi();c.data||(c.data={query:{},fragment:{}},b(c.data));var d={},e=c.data;e&&(Wa(d,e.query),a&&Wa(d,e.fragment));return d},
ri=function(a){var b;b=void 0===b?3:b;try{if(a){var c;a:{for(var d=a,e=0;3>e;++e){var f=ki.exec(d);if(f){c=f;break a}d=decodeURIComponent(d)}c=void 0}var g=c;if(g&&"1"===g[1]){var h=g[3],l;a:{for(var n=g[2],m=0;m<b;++m)if(n===pi(h,m)){l=!0;break a}l=!1}if(l){for(var r={},t=h?h.split("*"):[],q=0;q<t.length;q+=2)r[t[q]]=ci(t[q+1]);return r}}}}catch(u){}};
function ui(a,b,c,d){function e(m){var r=m,t=oi(a).exec(r),q=r;if(t){var u=t[2],v=t[4];q=t[1];v&&(q=q+u+v)}m=q;var w=m.charAt(m.length-1);m&&"&"!==w&&(m+="&");return m+n}d=void 0===d?!1:d;var f=ni.exec(c);if(!f)return"";var g=f[1],h=f[2]||"",l=f[3]||"",n=a+"="+b;d?l="#"+e(l.substring(1)):h="?"+e(h.substring(1));return""+g+h+l}
function vi(a,b){var c="FORM"===(a.tagName||"").toUpperCase(),d=ji(b,1,c),e=ji(b,2,c),f=ji(b,3,c);if(Xa(d)){var g=qi(d);c?wi("_gl",g,a):xi("_gl",g,a,!1)}if(!c&&Xa(e)){var h=qi(e);xi("_gl",h,a,!0)}for(var l in f)if(f.hasOwnProperty(l))a:{var n=l,m=f[l],r=a;if(r.tagName){if("a"===r.tagName.toLowerCase()){xi(n,m,r,void 0);break a}if("form"===r.tagName.toLowerCase()){wi(n,m,r);break a}}"string"==typeof r&&ui(n,m,r,void 0)}}
function xi(a,b,c,d){if(c.href){var e=ui(a,b,c.href,void 0===d?!1:d);gf.test(e)&&(c.href=e)}}
function wi(a,b,c){if(c&&c.action){var d=(c.method||"").toLowerCase();if("get"===d){for(var e=c.childNodes||[],f=!1,g=0;g<e.length;g++){var h=e[g];if(h.name===a){h.setAttribute("value",b);f=!0;break}}if(!f){var l=K.createElement("input");l.setAttribute("type","hidden");l.setAttribute("name",a);l.setAttribute("value",b);c.appendChild(l)}}else if("post"===d){var n=ui(a,b,c.action);gf.test(n)&&(c.action=n)}}}
var ei=function(a){try{var b;a:{for(var c=a,d=100;c&&0<d;){if(c.href&&c.nodeName.match(/^a(?:rea)?$/i)){b=c;break a}c=c.parentNode;d--}b=null}var e=b;if(e){var f=e.protocol;"http:"!==f&&"https:"!==f||vi(e,e.hostname)}}catch(g){}},fi=function(a){try{if(a.action){var b=th(vh(a.action),"host");vi(a,b)}}catch(c){}},yi=function(a,b,c,d){hi();ii(a,b,"fragment"===c?2:1,!!d,!1)},zi=function(a,b){hi();ii(a,[sh(B.location,"host",!0)],b,!0,!0)},Ai=function(){var a=K.location.hostname,b=li.exec(K.referrer);if(!b)return!1;
var c=b[2],d=b[1],e="";if(c){var f=c.split("/"),g=f[1];e="s"===g?decodeURIComponent(f[2]):decodeURIComponent(g)}else if(d){if(0===d.indexOf("xn--"))return!1;e=d.replace(/-/g,".").replace(/\.\./g,"-")}var h=a.replace(mi,""),l=e.replace(mi,""),n;if(!(n=h===l)){var m="."+l;n=h.substring(h.length-m.length,h.length)===m}return n},Bi=function(a,b){return!1===a?!1:a||b||Ai()};var Ci=/^\w+$/,Di=/^[\w-]+$/,Ei=/^~?[\w-]+$/,Fi={aw:"_aw",dc:"_dc",gf:"_gf",ha:"_ha",gp:"_gp"},Gi=function(){if(!Lf("gtag_cs_api")||!Vf())return!0;var a=Tf("ad_storage");return null==a?!0:!!a},Hi=function(a,b){Uf("ad_storage")?Gi()?a():Yf(a,"ad_storage"):b?$e("TAGGING",3):Xf(function(){Hi(a,!0)},["ad_storage"])},Ki=function(a){var b=[];if(!K.cookie)return b;var c=zh(a,K.cookie,void 0,"ad_storage");if(!c||0==c.length)return b;for(var d=0;d<c.length;d++){var e=Ii(c[d]);e&&-1===Ia(b,e)&&b.push(e)}return Ji(b)};
function Li(a){return a&&"string"==typeof a&&a.match(Ci)?a:"_gcl"}
var Ni=function(){var a=vh(B.location.href),b=th(a,"query",!1,void 0,"gclid"),c=th(a,"query",!1,void 0,"gclsrc"),d=th(a,"query",!1,void 0,"dclid");if(!b||!c){var e=a.hash.replace("#","");b=b||qh(e,"gclid",!1,void 0);c=c||qh(e,"gclsrc",!1,void 0)}return Mi(b,c,d)},Mi=function(a,b,c){var d={},e=function(f,g){d[g]||(d[g]=[]);d[g].push(f)};d.gclid=a;d.gclsrc=b;d.dclid=c;if(void 0!==a&&a.match(Di))switch(b){case void 0:e(a,"aw");break;case "aw.ds":e(a,"aw");e(a,"dc");break;case "ds":e(a,"dc");break;case "3p.ds":Lf("gtm_3pds")&&
e(a,"dc");break;case "gf":e(a,"gf");break;case "ha":e(a,"ha");break;case "gp":e(a,"gp")}c&&e(c,"dc");return d},Pi=function(a){var b=Ni();Hi(function(){return Oi(b,a)})};
function Oi(a,b,c){function d(n,m){var r=Qi(n,e);r&&(Jh(r,m,f),g=!0)}b=b||{};var e=Li(b.prefix);c=c||Ta();var f=Rh(b,c,!0);f.Ia="ad_storage";var g=!1,h=Math.round(c/1E3),l=function(n){return["GCL",h,n].join(".")};a.aw&&(!0===b.Bi?d("aw",l("~"+a.aw[0])):d("aw",l(a.aw[0])));a.dc&&d("dc",l(a.dc[0]));a.gf&&d("gf",l(a.gf[0]));a.ha&&d("ha",l(a.ha[0]));a.gp&&d("gp",l(a.gp[0]));return g}
var Si=function(a,b){var c=ti(!0);Hi(function(){for(var d=Li(b.prefix),e=0;e<a.length;++e){var f=a[e];if(void 0!==Fi[f]){var g=Qi(f,d),h=c[g];if(h){var l=Math.min(Ri(h),Ta()),n;b:{for(var m=l,r=zh(g,K.cookie,void 0,"ad_storage"),t=0;t<r.length;++t)if(Ri(r[t])>m){n=!0;break b}n=!1}if(!n){var q=Rh(b,l,!0);q.Ia="ad_storage";Jh(g,h,q)}}}}Oi(Mi(c.gclid,c.gclsrc),b)})},Qi=function(a,b){var c=Fi[a];if(void 0!==c)return b+c},Ri=function(a){var b=a.split(".");return 3!==b.length||"GCL"!==b[0]?0:1E3*(Number(b[1])||
0)};function Ii(a){var b=a.split(".");if(3==b.length&&"GCL"==b[0]&&b[1])return b[2]}
var Ti=function(a,b,c,d,e){if(Ha(b)){var f=Li(e),g=function(){for(var h={},l=0;l<a.length;++l){var n=Qi(a[l],f);if(n){var m=zh(n,K.cookie,void 0,"ad_storage");m.length&&(h[n]=m.sort()[m.length-1])}}return h};Hi(function(){yi(g,b,c,d)})}},Ji=function(a){return a.filter(function(b){return Ei.test(b)})},Ui=function(a,b){for(var c=Li(b.prefix),d={},e=0;e<a.length;e++)Fi[a[e]]&&(d[a[e]]=Fi[a[e]]);Hi(function(){Na(d,function(f,g){var h=zh(c+g,K.cookie,void 0,"ad_storage");if(h.length){var l=h[0],n=Ri(l),
m={};m[f]=[Ii(l)];Oi(m,b,n)}})})};function Vi(a,b){for(var c=0;c<b.length;++c)if(a[b[c]])return!0;return!1}
var Wi=function(){function a(e,f,g){g&&(e[f]=g)}var b=["aw","dc"];if(Vf()){var c=Ni();if(Vi(c,b)){var d={};a(d,"gclid",c.gclid);a(d,"dclid",c.dclid);a(d,"gclsrc",c.gclsrc);zi(function(){return d},3);zi(function(){var e={};return e._up="1",e},1)}}},Xi=function(){var a;if(Gi()){for(var b=[],c=K.cookie.split(";"),d=/^\s*_gac_(UA-\d+-\d+)=\s*(.+?)\s*$/,e=0;e<c.length;e++){var f=c[e].match(d);f&&b.push({Ad:f[1],value:f[2]})}var g={};if(b&&b.length)for(var h=0;h<b.length;h++){var l=b[h].value.split(".");
"1"==l[0]&&3==l.length&&l[1]&&(g[b[h].Ad]||(g[b[h].Ad]=[]),g[b[h].Ad].push({timestamp:l[1],Dg:l[2]}))}a=g}else a={};return a};var Yi=/^\d+\.fls\.doubleclick\.net$/;function Zi(a,b){Uf(H.o)?bg(H.o)?a():Yf(a,H.o):b?I(42):dg(function(){Zi(a,!0)},[H.o])}function $i(a){var b=vh(B.location.href),c=th(b,"host",!1);if(c&&c.match(Yi)){var d=th(b,"path").split(a+"=");if(1<d.length)return d[1].split(";")[0].split("?")[0]}}
function aj(a,b,c){if("aw"==a||"dc"==a){var d=$i("gcl"+a);if(d)return d.split(".")}var e=Li(b);if("_gcl"==e){c=void 0===c?!0:c;var f=!bg(H.o)&&c,g;g=Ni()[a]||[];if(0<g.length)return f?["0"]:g}var h=Qi(a,e);return h?Ki(h):[]}
var bj=function(a){var b=$i("gac");if(b)return!bg(H.o)&&a?"0":decodeURIComponent(b);var c=Xi(),d=[];Na(c,function(e,f){for(var g=[],h=0;h<f.length;h++)g.push(f[h].Dg);g=Ji(g);g.length&&d.push(e+":"+g.join(","))});return d.join(";")},cj=function(a,b){var c=Ni().dc||[];Zi(function(){Xh(b);var d=Th[Uh(b.prefix)],e=!1;if(d&&0<c.length){var f=O.joined_au=O.joined_au||{},g=b.prefix||"_gcl";if(!f[g])for(var h=0;h<c.length;h++){var l="https://adservice.google.com/ddm/regclk";l=l+"?gclid="+c[h]+"&auiddc="+d;If(l);e=f[g]=
!0}}null==a&&(a=e);if(a&&d){var n=Uh(b.prefix),m=Th[n];m&&Wh(n,m,b)}})};var dj=/[A-Z]+/,ej=/\s/,fj=function(a){if(p(a)&&(a=Sa(a),!ej.test(a))){var b=a.indexOf("-");if(!(0>b)){var c=a.substring(0,b);if(dj.test(c)){for(var d=a.substring(b+1).split("/"),e=0;e<d.length;e++)if(!d[e])return;return{id:a,prefix:c,containerId:c+"-"+d[0],D:d}}}}},hj=function(a){for(var b={},c=0;c<a.length;++c){var d=fj(a[c]);d&&(b[d.id]=d)}gj(b);var e=[];Na(b,function(f,g){e.push(g)});return e};
function gj(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];"AW"===d.prefix&&d.D[1]&&b.push(d.containerId)}for(var e=0;e<b.length;++e)delete a[b[e]]};var ij=function(){var a=!1;return a};var kj=function(a,b,c,d){return(2===jj()||d||"http:"!=B.location.protocol?a:b)+c},jj=function(){var a=zf(),b;if(1===a)a:{var c=zg;c=c.toLowerCase();for(var d="https://"+c,e="http://"+c,f=1,g=K.getElementsByTagName("script"),h=0;h<g.length&&100>h;h++){var l=g[h].src;if(l){l=l.toLowerCase();if(0===l.indexOf(e)){b=3;break a}1===f&&0===l.indexOf(d)&&(f=2)}}b=f}else b=a;return b};
var yj=function(a){return bg(H.o)?a:a.replace(/&url=([^&#]+)/,function(b,c){var d=wh(decodeURIComponent(c));return"&url="+encodeURIComponent(d)})};var zj=new RegExp(/^(.*\.)?(google|youtube|blogger|withgoogle)(\.com?)?(\.[a-z]{2})?\.?$/),Aj={cl:["ecl"],customPixels:["nonGooglePixels"],ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],customScripts:["html","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],nonGooglePixels:[],nonGoogleScripts:["nonGooglePixels"],nonGoogleIframes:["nonGooglePixels"]},Bj={cl:["ecl"],customPixels:["customScripts","html"],
ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts"],customScripts:["html"],nonGooglePixels:["customPixels","customScripts","html","nonGoogleScripts","nonGoogleIframes"],nonGoogleScripts:["customScripts","html"],nonGoogleIframes:["customScripts","html","nonGoogleScripts"]},Cj="google customPixels customScripts html nonGooglePixels nonGoogleScripts nonGoogleIframes".split(" ");
var Ej=function(a){var b;b||(b=gh("gtm.whitelist"));b&&I(9);
var c=b&&Ya(Ra(b),Aj),d;d||(d=gh("gtm.blacklist"));d||(d=gh("tagTypeBlacklist"))&&I(3);d?I(8):d=[];Dj()&&(d=Ra(d),d.push("nonGooglePixels","nonGoogleScripts","sandboxedScripts"));0<=Ia(Ra(d),"google")&&I(2);var e=d&&Ya(Ra(d),Bj),f={};return function(g){var h=
g&&g[wd.Oa];if(!h||"string"!=typeof h)return!0;h=h.replace(/^_*/,"");if(void 0!==f[h])return f[h];var l=Eg[h]||[],n=a(h,l);if(b){var m;if(m=n)a:{if(0>Ia(c,h))if(l&&0<l.length)for(var r=0;r<l.length;r++){if(0>Ia(c,l[r])){I(11);m=!1;break a}}else{m=!1;break a}m=!0}n=m}var t=!1;if(d){var q=0<=Ia(e,h);if(q)t=q;else{var u=Ma(e,l||[]);u&&I(10);t=u}}var v=!n||t;v||!(0<=Ia(l,"sandboxedScripts"))||c&&-1!==Ia(c,"sandboxedScripts")||(v=Ma(e,Cj));return f[h]=v}},Dj=function(){return zj.test(B.location&&B.location.hostname)};var Fj={active:!0,isAllowed:function(){return!0}},Gj=function(a){var b=O.zones;!b&&a&&(b=O.zones=a());return b};var Hj=function(){};var Ij=!1,Jj=0,Kj=[];function Lj(a){if(!Ij){var b=K.createEventObject,c="complete"==K.readyState,d="interactive"==K.readyState;if(!a||"readystatechange"!=a.type||c||!b&&d){Ij=!0;for(var e=0;e<Kj.length;e++)N(Kj[e])}Kj.push=function(){for(var f=0;f<arguments.length;f++)N(arguments[f]);return 0}}}function Mj(){if(!Ij&&140>Jj){Jj++;try{K.documentElement.doScroll("left"),Lj()}catch(a){B.setTimeout(Mj,50)}}}var Nj=function(a){Ij?a():Kj.push(a)};var Oj={},Pj={},Qj=function(a,b,c,d){if(!Pj[a]||xg[b]||"__zone"===b)return-1;var e={};kb(d)&&(e=E(d,e));e.id=c;e.status="timeout";return Pj[a].tags.push(e)-1},Rj=function(a,b,c,d){if(Pj[a]){var e=Pj[a].tags[b];e&&(e.status=c,e.executionTime=d)}};function Sj(a){for(var b=Oj[a]||[],c=0;c<b.length;c++)b[c]();Oj[a]={push:function(d){d(Ld.C,Pj[a])}}}
var Vj=function(a,b,c){Pj[a]={tags:[]};Fa(b)&&Tj(a,b);c&&B.setTimeout(function(){return Sj(a)},Number(c));return Uj(a)},Tj=function(a,b){Oj[a]=Oj[a]||[];Oj[a].push(Va(function(){return N(function(){b(Ld.C,Pj[a])})}))};function Uj(a){var b=0,c=0,d=!1;return{add:function(){c++;return Va(function(){b++;d&&b>=c&&Sj(a)})},$f:function(){d=!0;b>=c&&Sj(a)}}};var Wj=function(){function a(d){return!Ga(d)||0>d?0:d}if(!O._li&&B.performance&&B.performance.timing){var b=B.performance.timing.navigationStart,c=Ga(hh.get("gtm.start"))?hh.get("gtm.start"):0;O._li={cst:a(c-b),cbt:a(Bg-b)}}};var ak={},bk=function(){return B.GoogleAnalyticsObject&&B[B.GoogleAnalyticsObject]},ck=!1;
var dk=function(a){B.GoogleAnalyticsObject||(B.GoogleAnalyticsObject=a||"ga");var b=B.GoogleAnalyticsObject;if(B[b])B.hasOwnProperty(b)||I(12);else{var c=function(){c.q=c.q||[];c.q.push(arguments)};c.l=Number(new Date);B[b]=c}Wj();return B[b]},ek=function(a,b,c,d){b=String(b).replace(/\s+/g,"").split(",");var e=bk();e(a+"require","linker");e(a+"linker:autoLink",b,c,d)};
var gk=function(a){},fk=function(){return B.GoogleAnalyticsObject||"ga"};
var hk=function(a,b){return function(){var c=bk(),d=c&&c.getByName&&c.getByName(a);if(d){var e=d.get("sendHitTask");d.set("sendHitTask",function(f){var g=f.get("hitPayload"),h=f.get("hitCallback"),l=0>g.indexOf("&tid="+b);l&&(f.set("hitPayload",g.replace(/&tid=UA-[0-9]+-[0-9]+/,"&tid="+b),!0),f.set("hitCallback",void 0,!0));e(f);l&&(f.set("hitPayload",g,!0),f.set("hitCallback",h,!0),f.set("_x_19",void 0,!0),e(f))})}}};var mk=function(){return!1},nk=function(){var a={};return function(b,c,d){}};function ok(a,b,c,d){var e=kd[a],f=pk(a,b,c,d);if(!f)return null;var g=sd(e[wd.ie],c,[]);if(g&&g.length){var h=g[0];f=ok(h.index,{I:f,H:1===h.He?b.terminate:f,terminate:b.terminate},c,d)}return f}
function pk(a,b,c,d){function e(){if(f[wd.Cf])h();else{var w=td(f,c,[]),y=Qj(c.id,String(f[wd.Oa]),Number(f[wd.ke]),w[wd.Df]),x=!1;w.vtp_gtmOnSuccess=function(){if(!x){x=!0;var z=Ta()-C;$g(c.id,kd[a],"5");Rj(c.id,y,"success",z);g()}};w.vtp_gtmOnFailure=function(){if(!x){x=!0;var z=Ta()-C;$g(c.id,kd[a],"6");Rj(c.id,y,"failure",z);h()}};w.vtp_gtmTagId=f.tag_id;
w.vtp_gtmEventId=c.id;$g(c.id,f,"1");var A=function(){var z=Ta()-C;$g(c.id,f,"7");Rj(c.id,y,"exception",z);x||(x=!0,h())};var C=Ta();try{rd(w,c)}catch(z){A(z)}}}var f=kd[a],g=b.I,h=b.H,l=b.terminate;if(c.cd(f))return null;var n=sd(f[wd.me],c,[]);if(n&&n.length){var m=n[0],r=ok(m.index,{I:g,H:h,terminate:l},c,d);if(!r)return null;g=r;h=2===m.He?l:r}if(f[wd.$d]||f[wd.Hf]){var t=f[wd.$d]?ld:c.Nh,q=g,u=h;if(!t[a]){e=Va(e);var v=qk(a,t,e);g=v.I;h=v.H}return function(){t[a](q,u)}}return e}
function qk(a,b,c){var d=[],e=[];b[a]=rk(d,e,c);return{I:function(){b[a]=sk;for(var f=0;f<d.length;f++)d[f]()},H:function(){b[a]=tk;for(var f=0;f<e.length;f++)e[f]()}}}function rk(a,b,c){return function(d,e){a.push(d);b.push(e);c()}}function sk(a){a()}function tk(a,b){b()};var wk=function(a,b){for(var c=[],d=0;d<kd.length;d++)if(a.Fb[d]){var e=kd[d];var f=b.add();try{var g=ok(d,{I:f,H:f,terminate:f},a,d);g?c.push({ef:d,$e:ud(e),hc:g}):(uk(d,a),f())}catch(l){f()}}b.$f();c.sort(vk);for(var h=0;h<c.length;h++)c[h].hc();return 0<c.length};function vk(a,b){var c,d=b.$e,e=a.$e;c=d>e?1:d<e?-1:0;var f;if(0!==c)f=c;else{var g=a.ef,h=b.ef;f=g>h?1:g<h?-1:0}return f}
function uk(a,b){if(!Xg)return;var c=function(d){var e=b.cd(kd[d])?"3":"4",f=sd(kd[d][wd.ie],b,[]);f&&f.length&&c(f[0].index);$g(b.id,kd[d],e);var g=sd(kd[d][wd.me],b,[]);g&&g.length&&c(g[0].index)};c(a);}
var xk=!1,yk=function(a,b,c,d,e){if("gtm.js"==b){if(xk)return!1;xk=!0}Zg(a,b);var f=Vj(a,d,e);kh(a,"event",1);kh(a,"ecommerce",1);kh(a,"gtm");var g={id:a,name:b,cd:Ej(c),Fb:[],Nh:[],Ve:function(){I(6)}};g.Fb=Gd(g);
var h=wk(g,f);"gtm.js"!==b&&"gtm.sync"!==b||gk(Ld.C);if(!h)return h;for(var l=0;l<g.Fb.length;l++)if(g.Fb[l]){var n=kd[l];if(n&&!xg[String(n[wd.Oa])])return!0}return!1};function zk(a,b){if(a){var c=""+a;0!==c.indexOf("http://")&&0!==c.indexOf("https://")&&(c="https://"+c);"/"===c[c.length-1]&&(c=c.substring(0,c.length-1));return vh(""+c+b).href}}function Ak(a,b){return Bk()?zk(a,b):void 0}
function Bk(){var a=!1;return a};var Ck=function(){this.eventModel={};this.targetConfig={};this.containerConfig={};this.a={};this.globalConfig={};this.I=function(){};this.H=function(){};this.eventId=void 0},Dk=function(a){var b=new Ck;b.eventModel=a;return b},Ek=function(a,b){a.targetConfig=b;return a},Fk=function(a,b){a.containerConfig=b;return a},Gk=function(a,b){a.a=b;return a},Hk=function(a,b){a.globalConfig=b;return a},Ik=function(a,b){a.I=b;return a},Jk=function(a,b){a.H=b;return a};
Ck.prototype.getWithConfig=function(a){if(void 0!==this.eventModel[a])return this.eventModel[a];if(void 0!==this.targetConfig[a])return this.targetConfig[a];if(void 0!==this.containerConfig[a])return this.containerConfig[a];if(void 0!==this.a[a])return this.a[a];if(void 0!==this.globalConfig[a])return this.globalConfig[a]};
var Kk=function(a){function b(e){Na(e,function(f){c[f]=null})}var c={};b(a.eventModel);b(a.targetConfig);b(a.containerConfig);b(a.globalConfig);var d=[];Na(c,function(e){d.push(e)});return d};var Lk;if(3===Ld.Wb.length)Lk="g";else{var Mk="G";Lk=Mk}
var Nk={"":"n",UA:"u",AW:"a",DC:"d",G:"e",GF:"f",HA:"h",GTM:Lk,OPT:"o"},Ok=function(a){var b=Ld.C.split("-"),c=b[0].toUpperCase(),d=Nk[c]||"i",e=a&&"GTM"===c?b[1]:"OPT"===c?b[1]:"",f;if(3===Ld.Wb.length){var g="w";f="2"+g}else f="";return f+d+Ld.Wb+e};var Pk=function(a,b){a.addEventListener&&a.addEventListener("message",b,!1)};var Qk=function(){return lf("iPhone")&&!lf("iPod")&&!lf("iPad")};lf("Opera");lf("Trident")||lf("MSIE");lf("Edge");!lf("Gecko")||-1!=hf.toLowerCase().indexOf("webkit")&&!lf("Edge")||lf("Trident")||lf("MSIE")||lf("Edge");-1!=hf.toLowerCase().indexOf("webkit")&&!lf("Edge")&&lf("Mobile");lf("Macintosh");lf("Windows");lf("Linux")||lf("CrOS");var Rk=ma.navigator||null;Rk&&(Rk.appVersion||"").indexOf("X11");lf("Android");Qk();lf("iPad");lf("iPod");Qk()||lf("iPad")||lf("iPod");hf.toLowerCase().indexOf("kaios");var Sk=function(a,b){for(var c=a,d=0;50>d;++d){var e;try{e=!(!c.frames||!c.frames[b])}catch(h){e=!1}if(e)return c;var f;a:{try{var g=c.parent;if(g&&g!=c){f=g;break a}}catch(h){}f=null}if(!(c=f))break}return null};var Tk=function(){};var Uk=function(a){return void 0!==a.tcString&&"string"!==typeof a.tcString||void 0!==a.gdprApplies&&"boolean"!==typeof a.gdprApplies||void 0!==a.listenerId&&"number"!==typeof a.listenerId||void 0!==a.addtlConsent&&"string"!==typeof a.addtlConsent?2:a.cmpStatus&&"error"!==a.cmpStatus?0:3},Vk=function(a,b){this.i=a;this.a=null;this.s={};this.F=0;this.N=void 0===b?500:b;this.m=null};la(Vk,Tk);
var Xk=function(a){return"function"===typeof a.i.__tcfapi||null!=Wk(a)},$k=function(a,b){var c=setTimeout(function(){c=0;b({tcString:"tcunavailable",internalErrorState:1})},a.N);Yk(a,"addEventListener",function(d){d&&Zk(d)&&(d.internalErrorState=Uk(d),0!=d.internalErrorState&&(d.tcString="tcunavailable"),Yk(a,"removeEventListener",null,d.listenerId),c&&(clearTimeout(c),c=0,b(d)))})};
Vk.prototype.addEventListener=function(a){Yk(this,"addEventListener",function(b,c){var d=c?b:{};d.internalErrorState=Uk(d);0!==d.internalErrorState&&(d.tcString="tcunavailable");a(d)})};Vk.prototype.removeEventListener=function(a){a&&a.listenerId&&Yk(this,"removeEventListener",null,a.listenerId)};
var bl=function(a,b){if(!a.purpose||!a.vendor)return!1;var c=al(a.vendor.consents,"755");return c&&"1"===b&&a.purposeOneTreatment&&"DE"===a.publisherCC?!0:c&&al(a.purpose.consents,b)},al=function(a,b){return!(!a||!a[b])},Yk=function(a,b,c,d){c||(c=function(){});if("function"===typeof a.i.__tcfapi){var e=a.i.__tcfapi;e(b,2,c,d)}else if(Wk(a)){cl(a);var f=++a.F;a.s[f]=c;if(a.a){var g={};a.a.postMessage((g.__tcfapiCall={command:b,version:2,callId:f,parameter:d},g),"*")}}else c({},!1)},Wk=function(a){if(a.a)return a.a;
a.a=Sk(a.i,"__tcfapiLocator");return a.a},cl=function(a){a.m||(a.m=function(b){try{var c,d;"string"===typeof b.data?d=JSON.parse(b.data):d=b.data;c=d.__tcfapiReturn;a.s[c.callId](c.returnValue,c.success)}catch(e){}},Pk(a.i,a.m))},Zk=function(a){return!1===a.gdprApplies||"error"===a.cmpStatus||"loaded"===a.cmpStatus&&("tcloaded"===a.eventStatus||"useractioncomplete"===a.eventStatus)?!0:!1};var dl={1:1,3:1,7:3,9:3,10:3};function el(a,b){if(""===a)return b;var c=Number(a);return isNaN(c)?b:c}var fl=el("",550),gl=el("",500);function hl(){var a=O.tcf||{};return O.tcf=a}
var il=function(){var a=hl();if(!a.active){a.active=!0;var b=new Vk(B,3E3),c="x";"function"===typeof B.__tcfapi?c="s":Xk(b)?c="i":"function"===typeof B.__cmp?c="c":Sk(B,"__cmpLocator")&&(c="d");a.Ue=Ta();try{var d=!1;$k(b,function(){d=!0;a.gd=Ta()});d&&(a.gd=a.Ue)}catch(e){c="e"}a.type=c}},ol=function(){if(jl()?!0===B.gtag_enable_tcf_support:!1!==B.gtag_enable_tcf_support){var a=hl();if(!a.active||!a.Ha){var b=new Vk(B,3E3);if("function"===typeof B.__tcfapi||Xk(b)){a.active=!0;a.type="p";a.Ha={};
kl();var c=setTimeout(function(){ll(a);ml(a);c=null},gl);try{b.addEventListener(function(d){c&&(clearTimeout(c),c=null);if(0!==d.internalErrorState)ll(a),ml(a);else{var e;if(!1===d.gdprApplies)e=nl(),b.removeEventListener(d);else if("tcloaded"===d.eventStatus||"useractioncomplete"===d.eventStatus||"cmpuishown"===d.eventStatus){var f={},g;for(g in dl)if(dl.hasOwnProperty(g))if("1"===g)f["1"]=Zk(d)?!1===d.gdprApplies||"tcunavailable"===d.tcString?!0:bl(d,"1"):!1;else{var h=d.purpose&&d.vendor?al(d.purpose.legitimateInterests,
g)&&al(d.vendor.legitimateInterests,"755"):!1,l=bl(d,g),n=dl[g];1===n?f[g]=l:2===n?f[g]=h:3===n&&(f[g]=l||h)}e=f}e&&(a.tcString=d.tcString||"tcempty",a.Ha=e,ml(a))}})}catch(d){c&&(clearTimeout(c),c=null),ll(a),ml(a)}}}}};function ll(a){a.type="e";a.tcString="tcunavailable";a.Ha=nl()}function kl(){var a={};$f((a.ad_storage="denied",a.wait_for_update=fl,a))}var jl=function(){var a=!1;a=!0;return a};
function nl(){var a={},b;for(b in dl)dl.hasOwnProperty(b)&&(a[b]=!0);return a}function ml(a){var b={};ag((b.ad_storage=a.Ha["1"]?"granted":"denied",b))}var pl=function(){var a=hl();if(a.active&&void 0!==a.gd)return Number(a.gd-a.Ue)},ql=function(){var a=hl();return a.active&&a.Ha?a.tcString||"":""},rl=function(a){if(!dl.hasOwnProperty(String(a)))return!0;var b=hl();return b.active&&b.Ha?!!b.Ha[String(a)]:!0};function sl(a,b,c){function d(r){var t;O.reported_gclid||(O.reported_gclid={});t=O.reported_gclid;var q=f+(r?"gcu":"gcs");if(!t[q]){t[q]=!0;var u=[],v=function(C,z){z&&u.push(C+"="+encodeURIComponent(z))},w="https://www.google.com";if(Vf()){var y=bg(H.o);v("gcs",cg());r&&v("gcu","1");v("rnd",m);if((!f||g&&"aw.ds"!==g)&&bg(H.o)){var x=Ki("_gcl_aw");v("gclaw",x.join("."))}v("url",String(B.location).split(/[?#]/)[0]);v("dclid",tl(b,h));!y&&b&&(w="https://pagead2.googlesyndication.com")}
v("gdpr_consent",ql());"1"===ti(!1)._up&&v("gtm_up","1");v("gclid",tl(b,f));v("gclsrc",g);v("gtm",Ok(!c));var A=w+"/pagead/landing?"+u.join("&");If(A)}}var e=Ni(),f=e.gclid||"",g=e.gclsrc,h=e.dclid||"",l=!a&&(!f||g&&"aw.ds"!==g?!1:!0),n=Vf();if(l||n){var m=""+Mh();n?dg(function(){d();bg(H.o)||Yf(function(){return d(!0)},H.o)},[H.o]):d()}}function tl(a,b){var c=a&&!bg(H.o);return b&&c?"0":b}var gm=function(){var a=!0;rl(7)&&rl(9)&&rl(10)||(a=!1);var b=!0;b&&!rl(3)&&(a=!1);return a},hm=function(){var a=!0;rl(3)||(a=!1);return a};function Bm(){var a=O;return a.gcq=a.gcq||new Cm}
var Dm=function(a,b,c){Bm().register(a,b,c)},Em=function(a,b,c,d){Bm().push("event",[b,a],c,d)},Fm=function(a,b){Bm().push("config",[a],b)},Gm={},Hm=function(){this.status=1;this.containerConfig={};this.targetConfig={};this.i={};this.m=null;this.a=!1},Im=function(a,b,c,d,e){this.type=a;this.m=b;this.da=c||"";this.a=d;this.i=e},Cm=function(){this.m={};this.i={};this.a=[]},Jm=function(a,b){var c=fj(b);return a.m[c.containerId]=a.m[c.containerId]||new Hm},Km=function(a,b,c){if(b){var d=fj(b);if(d&&1===
Jm(a,b).status){Jm(a,b).status=2;var e={};Xg&&(e.timeoutId=B.setTimeout(function(){I(38);Jg()},3E3));a.push("require",[e],d.containerId);Gm[d.containerId]=Ta();if(ij()){
}else{var g="/gtag/js?id="+encodeURIComponent(d.containerId)+"&l=dataLayer&cx=c",h=("http:"!=B.location.protocol?"https:":"http:")+("//www.googletagmanager.com"+g),l=Ak(c,g)||h;yf(l)}}}},Lm=function(a,b,c,d){if(d.da){var e=Jm(a,d.da),f=e.m;if(f){var g=E(c),h=E(e.targetConfig[d.da]),l=E(e.containerConfig),n=E(e.i),m=E(a.i),r=gh("gtm.uniqueEventId"),t=fj(d.da).prefix,q=Jk(Ik(Hk(Gk(Fk(Ek(Dk(g),h),l),n),m),function(){
ah(r,t,"2");}),function(){ah(r,t,"3");});try{ah(r,t,"1");f(d.da,b,d.m,q)}catch(u){ah(r,t,"4");}}}};
Cm.prototype.register=function(a,b,c){if(3!==Jm(this,a).status){Jm(this,a).m=b;Jm(this,a).status=3;c&&(Jm(this,a).i=c);var d=fj(a),e=Gm[d.containerId];if(void 0!==e){var f=O[d.containerId].bootstrap,g=d.prefix.toUpperCase();O[d.containerId]._spx&&(g=g.toLowerCase());var h=gh("gtm.uniqueEventId"),l=g,n=Ta()-f;if(Xg&&!Og[h]){h!==Kg&&(Ig(),Kg=h);var m=l+"."+Math.floor(f-e)+"."+Math.floor(n);Tg=Tg?Tg+","+m:"&cl="+m}delete Gm[d.containerId]}this.flush()}};
Cm.prototype.push=function(a,b,c,d){var e=Math.floor(Ta()/1E3);Km(this,c,b[0][H.Ba]||this.i[H.Ba]);this.a.push(new Im(a,e,c,b,d));d||this.flush()};
Cm.prototype.flush=function(a){for(var b=this;this.a.length;){var c=this.a[0];if(c.i)c.i=!1,this.a.push(c);else switch(c.type){case "require":if(3!==Jm(this,c.da).status&&!a)return;Xg&&B.clearTimeout(c.a[0].timeoutId);break;case "set":Na(c.a[0],function(l,n){E($a(l,n),b.i)});break;case "config":var d=c.a[0],e=!!d[H.wc];delete d[H.wc];var f=Jm(this,c.da),g=fj(c.da),h=g.containerId===g.id;e||(h?f.containerConfig={}:f.targetConfig[c.da]={});f.a&&e||Lm(this,H.ka,d,c);f.a=!0;delete d[H.hb];h?E(d,f.containerConfig):
E(d,f.targetConfig[c.da]);break;case "event":Lm(this,c.a[1],c.a[0],c)}this.a.shift()}};var Mm=function(a,b,c,d){};var Nm=function(a){};var Om=function(a,b,c){};var Pm=function(a,b){return!0};var Qm=function(a,b){var c;return c};var Rm=function(a){};var Sm=function(a,b){var c;var d=tb(c,this.m);void 0===d&&void 0!==c&&I(45);return d};var Tm=function(a){var b;var h=tb(b,this.m);void 0===h&&void 0!==b&&I(45);return h};var Um=function(a,b){var c=null;return tb(c,this.m)};var Vm=function(a){var b;F(this.i.a,["path:!string"],arguments);Ke(this,"access_globals","readwrite",a);var c=a.split("."),d=Za(c),e=c[c.length-1];if(void 0===d)throw Error("Path "+a+" does not exist.");var f=d[e];void 0===f&&(f=[],d[e]=f);b=function(){if(!Fa(f.push))throw Error("Object at "+a+" in window is not an array.");f.push.apply(f,Array.prototype.slice.call(arguments,0))};return tb(b,this.m)};var Wm=function(a){var b;return b};var Xm=function(a,b){b=void 0===b?!0:b;var c;return c};var Ym=function(a,b){var c;return c};var Zm=function(a,b){var c;return c};var $m=function(a){var b="";return b};var an=function(a){var b="";return b};var We=function(){Ke(this,"get_user_agent");return B.navigator.userAgent};var bn=function(a,b){};var cn={},dn=function(a,b,c,d){F(this.i.a,["url:!string","onSuccess:?Fn","onFailure:?Fn","cacheToken:?string"],arguments);Ke(this,"inject_script",a);var e=this.m,f=function(){b instanceof cb&&b.Ja(e)},g=function(){c instanceof cb&&c.Ja(e)};if(!d){yf(a,f,g);return}var h=d;cn[h]?(cn[h].onSuccess.push(f),cn[h].onFailure.push(g)):(cn[h]={onSuccess:[f],onFailure:[g]},f=function(){for(var l=cn[h].onSuccess,n=0;n<l.length;n++)N(l[n]);l.push=function(m){N(m);
return 0}},g=function(){for(var l=cn[h].onFailure,n=0;n<l.length;n++)N(l[n]);cn[h]=null},yf(a,f,g));};var en=function(){return!1},fn={getItem:function(a){var b=null;return b},setItem:function(a,
b){return!1},removeItem:function(a){}};var gn=function(){};var hn=function(a,b){var c=!1;return c};var jn=function(){var a="";return a};var kn=function(){var a="";return a};var ln=function(a,b,c){};var mn=function(a,b,c,d){var e=this;d=void 0===d?!0:d;var f=!1;return f};var nn=function(a,b,c){return!1};var on=function(a){for(var b=[],c=0,d=0;d<a.length;d++){var e=a.charCodeAt(d);128>e?b[c++]=e:(2048>e?b[c++]=e>>6|192:(55296==(e&64512)&&d+1<a.length&&56320==(a.charCodeAt(d+1)&64512)?(e=65536+((e&1023)<<10)+(a.charCodeAt(++d)&1023),b[c++]=e>>18|240,b[c++]=e>>12&63|128):b[c++]=e>>12|224,b[c++]=e>>6&63|128),b[c++]=e&63|128)}return b};var pn=function(a,b,c){var d=this;};var qn={},rn={};qn.getItem=function(a){var b=null;return b};
qn.setItem=function(a,b){};
qn.removeItem=function(a){};qn.clear=function(){};var sn=function(a){var b;return b};var Hc=function(){var a=new Ve;ij()?(a.add("injectHiddenIframe",Ea),a.add("injectScript",Ea)):(a.add("injectHiddenIframe",bn),a.add("injectScript",dn));var b=ln;a.add("Math",De());a.add("TestHelper",Ye());a.add("addEventCallback",Nm);a.add("aliasInWindow",Pm);a.add("assertApi",ze);a.add("assertThat",Ae);a.add("callInWindow",
Qm);a.add("callLater",Rm);a.add("copyFromDataLayer",Sm);a.add("copyFromWindow",Tm);a.add("createArgumentsQueue",Um);a.add("createQueue",Vm);a.add("decodeUri",Ee);a.add("decodeUriComponent",Fe);a.add("encodeUri",Ge);a.add("encodeUriComponent",He);a.add("fail",Ie);a.add("fromBase64",Wm,!("atob"in B));a.add("generateRandom",Je);a.add("getContainerVersion",Le);a.add("getCookieValues",Xm);a.add("getQueryParameters",Ym);a.add("getReferrerQueryParameters",Zm);a.add("getReferrerUrl",$m);a.add("getTimestamp",
Me);a.add("getTimestampMillis",Me);a.add("getType",Ne);a.add("getUrl",an);a.add("localStorage",fn,!en());a.add("logToConsole",gn);a.add("makeInteger",Pe);a.add("makeNumber",Qe);a.add("makeString",Re);a.add("makeTableMap",Se);a.add("mock",Ue);a.add("queryPermission",hn);a.add("readCharacterSet",jn);a.add("readTitle",kn);a.add("sendPixel",b);a.add("setCookie",mn);a.add("setInWindow",nn);a.add("sha256",pn);a.add("templateStorage",qn);a.add("toBase64",sn,!("btoa"in B));a.add("JSON",Oe(function(c){var d=this.m.a;d&&d.log.call(this,"error",c)}));return function(c){var d;if(a.a.hasOwnProperty(c))d=a.get(c,this);else{var e;if(e=a.i.hasOwnProperty(c))b:{var f=this.m.a;if(f){var g=f.Ab();if(g&&0!==g.indexOf("__cvt_")){e=!0;break b}}e=
!1}if(e)d=a.i.hasOwnProperty(c)?a.i[c]:void 0;else throw Error(c+" is not a valid API name.");}return d}};var Fc,Pd;
function tn(){var a=data.runtime||[],b=data.runtime_lines;Fc=new Dc;un();gd=function(e,f,g){vn(f);var h=new gb;Na(f,function(q,u){var v=tb(u);void 0===v&&void 0!==u&&I(44);h.set(q,v)});Fc.a.a.s=Cd();var l={ag:Qd(e),eventId:void 0!==g?g.id:void 0,Ab:function(){return e},log:function(){}};if(mk()){var n=nk(),m=void 0,r=void 0;l.fa={i:{},a:function(q,u,v){1===u&&(m=q);7===u&&(r=v);n(q,u,v)},m:Te()};l.log=function(q,u){if(m){var v=Array.prototype.slice.call(arguments,1);n(m,4,{level:q,source:r,message:v})}}}var t=
Gc(l,[e,h]);Fc.a.a.s=void 0;t instanceof ra&&"return"===t.a&&(t=t.i);return sb(t)};Ic();for(var c=0;c<a.length;c++){var d=a[c];if(!Ha(d)||3>d.length){if(0===d.length)continue;break}b&&b[c]&&b[c].length&&yd(d,b[c]);Fc.hc(d)}}function vn(a){var b=a.gtmOnSuccess,c=a.gtmOnFailure;Fa(b)&&(a.gtmOnSuccess=function(){N(b)});Fa(c)&&(a.gtmOnFailure=function(){N(c)})}
function un(){var a=Fc;O.SANDBOXED_JS_SEMAPHORE=O.SANDBOXED_JS_SEMAPHORE||0;Jc(a,function(b,c,d){O.SANDBOXED_JS_SEMAPHORE++;try{return b.apply(c,d)}finally{O.SANDBOXED_JS_SEMAPHORE--}})}function wn(a){void 0!==a&&Na(a,function(b,c){for(var d=0;d<c.length;d++){var e=c[d].replace(/^_*/,"");Eg[e]=Eg[e]||[];Eg[e].push(b)}})};var xn="HA GF GP G UA AW DC".split(" "),yn=!1,zn={},An=!1;function Bn(a,b){var c={event:a};b&&(c.eventModel=E(b),b[H.Lc]&&(c.eventCallback=b[H.Lc]),b[H.Rb]&&(c.eventTimeout=b[H.Rb]));return c}var Dn=function(){return yn};
var Fn={config:function(a){},event:function(a){var b=a[1];if(p(b)&&!(3<a.length)){var c;if(2<a.length){if(!kb(a[2])&&
void 0!=a[2])return;c=a[2]}var d=Bn(b,c);return d}},js:function(a){if(2==a.length&&a[1].getTime)return An=!0,Dn(),{event:"gtm.js","gtm.start":a[1].getTime()}},policy:function(a){if(3===a.length){var b=a[1],c=a[2],d=Pd.i;d.a[b]?d.a[b].push(c):d.a[b]=[c]}},set:function(a){var b;2==a.length&&kb(a[1])?b=E(a[1]):3==a.length&&p(a[1])&&(b={},kb(a[2])||Ha(a[2])?b[a[1]]=E(a[2]):b[a[1]]=a[2]);if(b){b._clear=!0;return b}},consent:function(a){if(3===a.length){var b=function(){Dn()&&E(a[2],{subcommand:a[1]})};I(39);var c=a[1];"default"===c?(b(),$f(a[2])):"update"===c&&(b(),ag(a[2]))}}};var Gn={policy:!0};var Hn=function(a,b){var c=a.hide;if(c&&void 0!==c[b]&&c.end){c[b]=!1;var d=!0,e;for(e in c)if(c.hasOwnProperty(e)&&!0===c[e]){d=!1;break}d&&(c.end(),c.end=null)}},Jn=function(a){var b=In(),c=b&&b.hide;c&&c.end&&(c[a]=!0)};var Kn=!1,Ln=[];function Mn(){if(!Kn){Kn=!0;for(var a=0;a<Ln.length;a++)N(Ln[a])}}var Nn=function(a){Kn?N(a):Ln.push(a)};var eo=function(a){if(co(a))return a;this.a=a};eo.prototype.Kg=function(){return this.a};var co=function(a){return!a||"object"!==ib(a)||kb(a)?!1:"getUntrustedUpdateValue"in a};eo.prototype.getUntrustedUpdateValue=eo.prototype.Kg;var fo=[],go=!1,ho=function(a){return B["dataLayer"].push(a)},io=function(a){var b=O["dataLayer"],c=b?b.subscribers:1,d=0;return function(){++d===c&&a()}};
function jo(a){var b=a._clear;Na(a,function(f,g){"_clear"!==f&&(b&&jh(f,void 0),jh(f,g))});Ag||(Ag=a["gtm.start"]);var c=a.event,d=a["gtm.uniqueEventId"];if(!c)return!1;d||(d=Fg(),a["gtm.uniqueEventId"]=d,jh("gtm.uniqueEventId",d));var e=ko(a);switch(c){case "gtm.init":I(19),e&&I(20)}return e}
function ko(a){var b=a.event,c=a["gtm.uniqueEventId"],d,e=O.zones;d=e?e.checkState(Ld.C,c):Fj;return d.active?yk(c,b,d.isAllowed,a.eventCallback,a.eventTimeout)?!0:!1:!1}
function lo(){for(var a=!1;!go&&0<fo.length;){go=!0;delete dh.eventModel;fh();var b=fo.shift();if(null!=b){var c=co(b);if(c){var d=b;b=co(d)?d.getUntrustedUpdateValue():void 0;for(var e=["gtm.allowlist","gtm.blocklist","gtm.whitelist","gtm.blacklist","tagTypeBlacklist"],f=0;f<e.length;f++){var g=e[f],h=gh(g,1);if(Ha(h)||kb(h))h=E(h);eh[g]=h}}try{if(Fa(b))try{b.call(hh)}catch(v){}else if(Ha(b)){var l=
b;if(p(l[0])){var n=l[0].split("."),m=n.pop(),r=l.slice(1),t=gh(n.join("."),2);if(void 0!==t&&null!==t)try{t[m].apply(t,r)}catch(v){}}}else{if(Oa(b)){a:{var q=b;if(q.length&&p(q[0])){var u=Fn[q[0]];if(u&&(!c||!Gn[q[0]])){b=u(q);break a}}b=void 0}if(!b){go=!1;continue}}a=jo(b)||a}}finally{c&&fh(!0)}}go=!1}return!a}
function mo(){var a=lo();try{Hn(B["dataLayer"],Ld.C)}catch(b){}return a}
var oo=function(){var a=wf("dataLayer",[]),b=wf("google_tag_manager",{});b=b["dataLayer"]=b["dataLayer"]||{};Nj(function(){b.gtmDom||(b.gtmDom=!0,a.push({event:"gtm.dom"}))});Nn(function(){b.gtmLoad||(b.gtmLoad=!0,a.push({event:"gtm.load"}))});b.subscribers=(b.subscribers||0)+1;var c=a.push;a.push=function(){var e;if(0<O.SANDBOXED_JS_SEMAPHORE){e=[];for(var f=0;f<arguments.length;f++)e[f]=new eo(arguments[f])}else e=[].slice.call(arguments,0);var g=c.apply(a,e);fo.push.apply(fo,e);if(300<
this.length)for(I(4);300<this.length;)this.shift();var h="boolean"!==typeof g||g;return lo()&&h};var d=a.slice(0);fo.push.apply(fo,d);no()&&N(mo)},no=function(){var a=!0;return a};var po={};po.Sb=new String("undefined");
var qo=function(a){this.a=function(b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]===po.Sb?b:a[d]);return c.join("")}};qo.prototype.toString=function(){return this.a("undefined")};qo.prototype.valueOf=qo.prototype.toString;po.Nf=qo;po.Oc={};po.rg=function(a){return new qo(a)};var ro={};po.Bh=function(a,b){var c=Fg();ro[c]=[a,b];return c};po.De=function(a){var b=a?0:1;return function(c){var d=ro[c];if(d&&"function"===typeof d[b])d[b]();ro[c]=void 0}};po.Sg=function(a){for(var b=!1,c=!1,d=2;d<a.length;d++)b=
b||8===a[d],c=c||16===a[d];return b&&c};po.rh=function(a){if(a===po.Sb)return a;var b=Fg();po.Oc[b]=a;return'google_tag_manager["'+Ld.C+'"].macro('+b+")"};po.eh=function(a,b,c){a instanceof po.Nf&&(a=a.a(po.Bh(b,c)),b=Ea);return{ad:a,I:b}};var so=function(a,b,c){function d(f,g){var h=f[g];return h}var e={event:b,"gtm.element":a,"gtm.elementClasses":d(a,"className"),"gtm.elementId":a["for"]||Ef(a,"id")||"","gtm.elementTarget":a.formTarget||d(a,"target")||""};c&&(e["gtm.triggers"]=c.join(","));e["gtm.elementUrl"]=(a.attributes&&a.attributes.formaction?a.formAction:"")||a.action||d(a,"href")||a.src||a.code||a.codebase||
"";return e},to=function(a){O.hasOwnProperty("autoEventsSettings")||(O.autoEventsSettings={});var b=O.autoEventsSettings;b.hasOwnProperty(a)||(b[a]={});return b[a]},uo=function(a,b,c){to(a)[b]=c},vo=function(a,b,c,d){var e=to(a),f=Ua(e,b,d);e[b]=c(f)},wo=function(a,b,c){var d=to(a);return Ua(d,b,c)};var xo=["input","select","textarea"],yo=["button","hidden","image","reset","submit"],zo=function(a){var b=a.tagName.toLowerCase();return!Ja(xo,function(c){return c===b})||"input"===b&&Ja(yo,function(c){return c===a.type.toLowerCase()})?!1:!0},Ao=function(a){return a.form?a.form.tagName?a.form:K.getElementById(a.form):Hf(a,["form"],100)},Bo=function(a,b,c){if(!a.elements)return 0;for(var d=b.getAttribute(c),e=0,f=1;e<a.elements.length;e++){var g=a.elements[e];if(zo(g)){if(g.getAttribute(c)===d)return f;
f++}}return 0};var Co=!!B.MutationObserver,Do=void 0,Eo=function(a){if(!Do){var b=function(){var c=K.body;if(c)if(Co)(new MutationObserver(function(){for(var e=0;e<Do.length;e++)N(Do[e])})).observe(c,{childList:!0,subtree:!0});else{var d=!1;Cf(c,"DOMNodeInserted",function(){d||(d=!0,N(function(){d=!1;for(var e=0;e<Do.length;e++)N(Do[e])}))})}};Do=[];K.body?b():N(b)}Do.push(a)};
var Po=function(){var a=K.body,b=K.documentElement||a&&a.parentElement,c,d;if(K.compatMode&&"BackCompat"!==K.compatMode)c=b?b.clientHeight:0,d=b?b.clientWidth:0;else{var e=function(f,g){return f&&g?Math.min(f,g):Math.max(f,g)};I(7);c=e(b?b.clientHeight:0,a?a.clientHeight:0);d=e(b?b.clientWidth:0,a?a.clientWidth:0)}return{width:d,height:c}},Qo=function(a){var b=Po(),c=b.height,d=b.width,e=a.getBoundingClientRect(),f=e.bottom-e.top,g=e.right-e.left;return f&&g?(1-Math.min((Math.max(0-e.left,0)+Math.max(e.right-
d,0))/g,1))*(1-Math.min((Math.max(0-e.top,0)+Math.max(e.bottom-c,0))/f,1)):0},Ro=function(a){if(K.hidden)return!0;var b=a.getBoundingClientRect();if(b.top==b.bottom||b.left==b.right||!B.getComputedStyle)return!0;var c=B.getComputedStyle(a,null);if("hidden"===c.visibility)return!0;for(var d=a,e=c;d;){if("none"===e.display)return!0;var f=e.opacity,g=e.filter;if(g){var h=g.indexOf("opacity(");0<=h&&(g=g.substring(h+8,g.indexOf(")",h)),"%"==g.charAt(g.length-1)&&(g=g.substring(0,g.length-1)),f=Math.min(g,
f))}if(void 0!==f&&0>=f)return!0;(d=d.parentElement)&&(e=B.getComputedStyle(d,null))}return!1};var So=[],To=!(!B.IntersectionObserver||!B.IntersectionObserverEntry),Uo=function(a,b,c){for(var d=new B.IntersectionObserver(a,{threshold:c}),e=0;e<b.length;e++)d.observe(b[e]);for(var f=0;f<So.length;f++)if(!So[f])return So[f]=d,f;return So.push(d)-1},Vo=function(a,b,c){function d(h,l){var n={top:0,bottom:0,right:0,left:0,width:0,height:0},m={boundingClientRect:h.getBoundingClientRect(),
intersectionRatio:l,intersectionRect:n,isIntersecting:0<l,rootBounds:n,target:h,time:Ta()};N(function(){return a(m)})}for(var e=[],f=[],g=0;g<b.length;g++)e.push(0),f.push(-1);c.sort(function(h,l){return h-l});return function(){for(var h=0;h<b.length;h++){var l=Qo(b[h]);if(l>e[h])for(;f[h]<c.length-1&&l>=c[f[h]+1];)d(b[h],l),f[h]++;else if(l<e[h])for(;0<=f[h]&&l<=c[f[h]];)d(b[h],l),f[h]--;e[h]=l}}},Wo=function(a,b,c){for(var d=0;d<c.length;d++)1<c[d]?c[d]=1:0>c[d]&&(c[d]=0);if(To){var e=!1;N(function(){e||
Vo(a,b,c)()});return Uo(function(f){e=!0;for(var g={ab:0};g.ab<f.length;g={ab:g.ab},g.ab++)N(function(h){return function(){return a(f[h.ab])}}(g))},b,c)}return B.setInterval(Vo(a,b,c),1E3)},Xo=function(a){To?0<=a&&a<So.length&&So[a]&&(So[a].disconnect(),So[a]=void 0):B.clearInterval(a)};var Zo=B.clearTimeout,$o=B.setTimeout,P=function(a,b,c){if(ij()){b&&N(b)}else return yf(a,b,c)},ap=function(){return new Date},bp=function(){return B.location.href},cp=function(a){return th(vh(a),"fragment")},dp=function(a){return uh(vh(a))},ep=function(a,b){return gh(a,b||2)},fp=function(a,b,c){var d;b?(a.eventCallback=b,c&&(a.eventTimeout=c),d=ho(a)):d=ho(a);return d},gp=function(a,b){B[a]=b},V=function(a,b,c){b&&
(void 0===B[a]||c&&!B[a])&&(B[a]=b);return B[a]},hp=function(a,b,c){return zh(a,b,void 0===c?!0:!!c)},ip=function(a,b,c){return 0===Jh(a,b,c)},jp=function(a,b){if(ij()){b&&N(b)}else Af(a,b)},kp=function(a){return!!wo(a,"init",!1)},lp=function(a){uo(a,"init",!0)},mp=function(a,b){var c=(void 0===b?0:b)?"www.googletagmanager.com/gtag/js":zg;c+="?id="+encodeURIComponent(a)+"&l=dataLayer";P(kj("https://","http://",c))},np=function(a,
b){var c=a[b];return c};var op=po.eh;function Lp(a,b){a=String(a);b=String(b);var c=a.length-b.length;return 0<=c&&a.indexOf(b,c)==c}var Mp=new La;function Np(a,b){function c(g){var h=vh(g),l=th(h,"protocol"),n=th(h,"host",!0),m=th(h,"port"),r=th(h,"path").toLowerCase().replace(/\/$/,"");if(void 0===l||"http"==l&&"80"==m||"https"==l&&"443"==m)l="web",m="default";return[l,n,m,r]}for(var d=c(String(a)),e=c(String(b)),f=0;f<d.length;f++)if(d[f]!==e[f])return!1;return!0}
function Op(a){return Pp(a)?1:0}
function Pp(a){var b=a.arg0,c=a.arg1;if(a.any_of&&Ha(c)){for(var d=0;d<c.length;d++)if(Op({"function":a["function"],arg0:b,arg1:c[d]}))return!0;return!1}switch(a["function"]){case "_cn":return 0<=String(b).indexOf(String(c));case "_css":var e;a:{if(b){var f=["matches","webkitMatchesSelector","mozMatchesSelector","msMatchesSelector","oMatchesSelector"];try{for(var g=0;g<f.length;g++)if(b[f[g]]){e=b[f[g]](c);break a}}catch(t){}}e=!1}return e;case "_ew":return Lp(b,c);case "_eq":return String(b)==String(c);
case "_ge":return Number(b)>=Number(c);case "_gt":return Number(b)>Number(c);case "_lc":var h;h=String(b).split(",");return 0<=Ia(h,String(c));case "_le":return Number(b)<=Number(c);case "_lt":return Number(b)<Number(c);case "_re":var l;var n=a.ignore_case?"i":void 0;try{var m=String(c)+n,r=Mp.get(m);r||(r=new RegExp(c,n),Mp.set(m,r));l=r.test(b)}catch(t){l=!1}return l;case "_sw":return 0==String(b).indexOf(String(c));case "_um":return Np(b,c)}return!1};var Qp={},Rp=encodeURI,W=encodeURIComponent,Sp=Bf;var Tp=function(a,b){if(!a)return!1;var c=th(vh(a),"host");if(!c)return!1;for(var d=0;b&&d<b.length;d++){var e=b[d]&&b[d].toLowerCase();if(e){var f=c.length-e.length;0<f&&"."!=e.charAt(0)&&(f--,e="."+e);if(0<=f&&c.indexOf(e,f)==f)return!0}}return!1};
var Up=function(a,b,c){for(var d={},e=!1,f=0;a&&f<a.length;f++)a[f]&&a[f].hasOwnProperty(b)&&a[f].hasOwnProperty(c)&&(d[a[f][b]]=a[f][c],e=!0);return e?d:null};Qp.Tg=function(){var a=!1;return a};function sr(){return B.gaGlobal=B.gaGlobal||{}}var tr=function(){var a=sr();a.hid=a.hid||Ka();return a.hid},ur=function(a,b){var c=sr();if(void 0==c.vid||b&&!c.from_cookie)c.vid=a,c.from_cookie=b};var Dr=window,Er=document,Fr=function(a){var b=Dr._gaUserPrefs;if(b&&b.ioo&&b.ioo()||a&&!0===Dr["ga-disable-"+a])return!0;try{var c=Dr.external;if(c&&c._gaUserPrefs&&"oo"==c._gaUserPrefs)return!0}catch(f){}for(var d=xh("AMP_TOKEN",String(Er.cookie),!0),e=0;e<d.length;e++)if("$OPT_OUT"==d[e])return!0;return Er.getElementById("__gaOptOutExtension")?!0:!1};function Ir(a){delete a.eventModel[H.hb];Kr(a.eventModel)}var Kr=function(a){Na(a,function(c){"_"===c.charAt(0)&&delete a[c]});var b=a[H.oa]||{};Na(b,function(c){"_"===c.charAt(0)&&delete b[c]})};var Nr=function(a,b,c){Em(b,c,a)},Or=function(a,b,c){Em(b,c,a,!0)},Qr=function(a,b){};
function Pr(a,b){}var X={b:{}};
X.b.sdl=["google"],function(){function a(){return!!(Object.keys(l("horiz.pix")).length||Object.keys(l("horiz.pct")).length||Object.keys(l("vert.pix")).length||Object.keys(l("vert.pct")).length)}function b(x){for(var A=[],C=x.split(","),z=0;z<C.length;z++){var D=Number(C[z]);if(isNaN(D))return[];m.test(C[z])||A.push(D)}return A}function c(){var x=0,A=0;return function(){var C=Po(),z=C.height;x=Math.max(v.scrollLeft+C.width,x);A=Math.max(v.scrollTop+z,A);return{vg:x,wg:A}}}function d(){q=V("self");
u=q.document;v=u.scrollingElement||u.body&&u.body.parentNode;y=c()}function e(x,A,C,z){var D=l(A),G={},L;for(L in D){G.Na=L;if(D.hasOwnProperty(G.Na)){var Q=Number(G.Na);x<Q||(fp({event:"gtm.scrollDepth","gtm.scrollThreshold":Q,"gtm.scrollUnits":C.toLowerCase(),"gtm.scrollDirection":z,"gtm.triggers":D[G.Na].join(",")}),vo("sdl",A,function(R){return function(da){delete da[R.Na];return da}}(G),{}))}G={Na:G.Na}}}function f(){var x=y(),A=x.vg,C=x.wg,z=A/v.scrollWidth*100,D=C/v.scrollHeight*100;e(A,"horiz.pix",
r.Ub,t.Sd);e(z,"horiz.pct",r.Tb,t.Sd);e(C,"vert.pix",r.Ub,t.qe);e(D,"vert.pct",r.Tb,t.qe);uo("sdl","pending",!1)}function g(){var x=250,A=!1;u.scrollingElement&&u.documentElement&&q.addEventListener&&(x=50,A=!0);var C=0,z=!1,D=function(){z?C=$o(D,x):(C=0,f(),kp("sdl")&&!a()&&(Df(q,"scroll",G),Df(q,"resize",G),uo("sdl","init",!1)));z=!1},G=function(){A&&y();C?z=!0:(C=$o(D,x),uo("sdl","pending",!0))};return G}function h(x,A,C){if(A){var z=b(String(x));vo("sdl",C,function(D){for(var G=0;G<z.length;G++){var L=
String(z[G]);D.hasOwnProperty(L)||(D[L]=[]);D[L].push(A)}return D},{})}}function l(x){return wo("sdl",x,{})}function n(x){N(x.vtp_gtmOnSuccess);var A=x.vtp_uniqueTriggerId,C=x.vtp_horizontalThresholdsPixels,z=x.vtp_horizontalThresholdsPercent,D=x.vtp_verticalThresholdUnits,G=x.vtp_verticalThresholdsPixels,L=x.vtp_verticalThresholdsPercent;switch(x.vtp_horizontalThresholdUnits){case r.Ub:h(C,A,"horiz.pix");break;case r.Tb:h(z,A,"horiz.pct")}switch(D){case r.Ub:h(G,A,"vert.pix");break;case r.Tb:h(L,
A,"vert.pct")}kp("sdl")?wo("sdl","pending")||(w||(d(),w=!0),N(function(){return f()})):(d(),w=!0,v&&(lp("sdl"),uo("sdl","pending",!0),N(function(){f();if(a()){var Q=g();Cf(q,"scroll",Q);Cf(q,"resize",Q)}else uo("sdl","init",!1)})))}var m=/^\s*$/,r={Tb:"PERCENT",Ub:"PIXELS"},t={qe:"vertical",Sd:"horizontal"},q,u,v,w=!1,y;(function(x){X.__sdl=x;X.__sdl.g="sdl";X.__sdl.h=!0;X.__sdl.priorityOverride=0})(function(x){x.vtp_triggerStartOption?n(x):Nn(function(){n(x)})})}();

X.b.jsm=["customScripts"],function(){(function(a){X.__jsm=a;X.__jsm.g="jsm";X.__jsm.h=!0;X.__jsm.priorityOverride=0})(function(a){if(void 0!==a.vtp_javascript){var b=a.vtp_javascript;try{var c=V("google_tag_manager");return c&&c.e&&c.e(b)}catch(d){}}})}();
X.b.c=["google"],function(){(function(a){X.__c=a;X.__c.g="c";X.__c.h=!0;X.__c.priorityOverride=0})(function(a){return a.vtp_value})}();
X.b.e=["google"],function(){(function(a){X.__e=a;X.__e.g="e";X.__e.h=!0;X.__e.priorityOverride=0})(function(a){return String(lh(a.vtp_gtmEventId,"event"))})}();
X.b.f=["google"],function(){(function(a){X.__f=a;X.__f.g="f";X.__f.h=!0;X.__f.priorityOverride=0})(function(a){var b=ep("gtm.referrer",1)||K.referrer;return b?a.vtp_component&&"URL"!=a.vtp_component?th(vh(String(b)),a.vtp_component,a.vtp_stripWww,a.vtp_defaultPages,a.vtp_queryKey):dp(String(b)):String(b)})}();
X.b.j=["google"],function(){(function(a){X.__j=a;X.__j.g="j";X.__j.h=!0;X.__j.priorityOverride=0})(function(a){for(var b=String(a.vtp_name).split("."),c=V(b.shift()),d=0;d<b.length;d++)c=c&&c[b[d]];return c})}();X.b.k=["google"],function(){(function(a){X.__k=a;X.__k.g="k";X.__k.h=!0;X.__k.priorityOverride=0})(function(a){return hp(a.vtp_name,ep("gtm.cookie",1),!!a.vtp_decodeCookie)[0]})}();

X.b.access_globals=["google"],function(){function a(b,c,d){var e={key:d,read:!1,write:!1,execute:!1};switch(c){case "read":e.read=!0;break;case "write":e.write=!0;break;case "readwrite":e.read=e.write=!0;break;case "execute":e.execute=!0;break;default:throw Error("Invalid access_globals request "+c);}return e}(function(b){X.__access_globals=b;X.__access_globals.g="access_globals";X.__access_globals.h=!0;X.__access_globals.priorityOverride=0})(function(b){for(var c=b.vtp_keys||[],d=b.vtp_createPermissionError,
e=[],f=[],g=[],h=0;h<c.length;h++){var l=c[h],n=l.key;l.read&&e.push(n);l.write&&f.push(n);l.execute&&g.push(n)}return{assert:function(m,r,t){if(!p(t))throw d(m,{},"Key must be a string.");if("read"===r){if(-1<Ia(e,t))return}else if("write"===r){if(-1<Ia(f,t))return}else if("readwrite"===r){if(-1<Ia(f,t)&&-1<Ia(e,t))return}else if("execute"===r){if(-1<Ia(g,t))return}else throw d(m,{},"Operation must be either 'read', 'write', or 'execute', was "+r);throw d(m,{},"Prohibited "+r+" on global variable: "+
t+".");},J:a}})}();
X.b.u=["google"],function(){var a=function(b){return{toString:function(){return b}}};(function(b){X.__u=b;X.__u.g="u";X.__u.h=!0;X.__u.priorityOverride=0})(function(b){var c;b.vtp_customUrlSource?c=b.vtp_customUrlSource:c=ep("gtm.url",1);c=c||bp();var d=b[a("vtp_component")];if(!d||"URL"==d)return dp(String(c));var e=vh(String(c)),f;if("QUERY"===d)a:{var g=b[a("vtp_multiQueryKeys").toString()],h=b[a("vtp_queryKey").toString()]||"",l=b[a("vtp_ignoreEmptyQueryParam").toString()],n;g?Ha(h)?n=h:n=String(h).replace(/\s+/g,
"").split(","):n=[String(h)];for(var m=0;m<n.length;m++){var r=th(e,"QUERY",void 0,void 0,n[m]);if(void 0!=r&&(!l||""!==r)){f=r;break a}}f=void 0}else f=th(e,d,"HOST"==d?b[a("vtp_stripWww")]:void 0,"PATH"==d?b[a("vtp_defaultPages")]:void 0,void 0);return f})}();
X.b.v=["google"],function(){(function(a){X.__v=a;X.__v.g="v";X.__v.h=!0;X.__v.priorityOverride=0})(function(a){var b=a.vtp_name;if(!b||!b.replace)return!1;var c=ep(b.replace(/\\\./g,"."),a.vtp_dataLayerVersion||1);return void 0!==c?c:a.vtp_defaultValue})}();
X.b.tl=["google"],function(){function a(b){return function(){if(b.fd&&b.jd>=b.fd)b.bd&&V("self").clearInterval(b.bd);else{b.jd++;var c=ap().getTime();fp({event:b.T,"gtm.timerId":b.bd,"gtm.timerEventNumber":b.jd,"gtm.timerInterval":b.interval,"gtm.timerLimit":b.fd,"gtm.timerStartTime":b.df,"gtm.timerCurrentTime":c,"gtm.timerElapsedTime":c-b.df,"gtm.triggers":b.Rh})}}}(function(b){X.__tl=b;X.__tl.g="tl";X.__tl.h=!0;X.__tl.priorityOverride=0})(function(b){N(b.vtp_gtmOnSuccess);if(!isNaN(b.vtp_interval)){var c=
{T:b.vtp_eventName,jd:0,interval:Number(b.vtp_interval),fd:isNaN(b.vtp_limit)?0:Number(b.vtp_limit),Rh:String(b.vtp_uniqueTriggerId||"0"),df:ap().getTime()};c.bd=V("self").setInterval(a(c),0>Number(b.vtp_interval)?0:Number(b.vtp_interval))}})}();
X.b.ua=["google"],function(){function a(m,r){if(Vf()&&!d[m]){var t=function(){var q=bk(),u="gtm"+Fg(),v=l(r),w={name:u};h(v,w,!0);q("create",m,w);q(function(){q.remove(u)})};Yf(t,H.L);Yf(t,H.o);d[m]=!0}}var b,c={},d={},e=function(m){dg(function(){n(m)},[H.L,H.o])},f={name:!0,clientId:!0,sampleRate:!0,siteSpeedSampleRate:!0,alwaysSendReferrer:!0,allowAnchor:!0,allowLinker:!0,cookieName:!0,cookieDomain:!0,cookieExpires:!0,cookiePath:!0,cookieUpdate:!0,cookieFlags:!0,legacyCookieDomain:!0,legacyHistoryImport:!0,
storage:!0,useAmpClientId:!0,storeGac:!0,_cd2l:!0},g={allowAnchor:!0,allowLinker:!0,alwaysSendReferrer:!0,anonymizeIp:!0,cookieUpdate:!0,exFatal:!0,forceSSL:!0,javaEnabled:!0,legacyHistoryImport:!0,nonInteraction:!0,useAmpClientId:!0,useBeacon:!0,storeGac:!0,allowAdFeatures:!0,allowAdPersonalizationSignals:!0,_cd2l:!0},h=function(m,r,t){var q=0;if(m)for(var u in m)if(m.hasOwnProperty(u)&&(t&&f[u]||!t&&void 0===f[u])){var v=g[u]?Qa(m[u]):m[u];"anonymizeIp"!=u||v||(v=void 0);r[u]=v;q++}return q},l=
function(m){var r={};m.vtp_gaSettings&&E(Up(m.vtp_gaSettings.vtp_fieldsToSet,"fieldName","value"),r);E(Up(m.vtp_fieldsToSet,"fieldName","value"),r);bg(H.L)||(r.storage="none");bg(H.o)||(r.allowAdFeatures=!1,r.storeGac=!1);gm()||(r.allowAdFeatures=!1);hm()||(r.allowAdPersonalizationSignals=!1);m.vtp_transportUrl&&(r._x_19=m.vtp_transportUrl);return r},n=function(m){function r(va,T){void 0!==T&&D("set",va,T)}var t={},q={},u={},v={};if(m.vtp_gaSettings){var w=m.vtp_gaSettings;E(Up(w.vtp_contentGroup,"index","group"),q);E(Up(w.vtp_dimension,"index","dimension"),u);E(Up(w.vtp_metric,"index","metric"),v);var y=E(w);y.vtp_fieldsToSet=void 0;y.vtp_contentGroup=void 0;y.vtp_dimension=void 0;y.vtp_metric=void 0;m=E(m,y)}E(Up(m.vtp_contentGroup,"index","group"),q);E(Up(m.vtp_dimension,
"index","dimension"),u);E(Up(m.vtp_metric,"index","metric"),v);var x=l(m),A=dk(m.vtp_functionName);if(Fa(A)){var C="",z="";m.vtp_setTrackerName&&"string"==typeof m.vtp_trackerName?""!==m.vtp_trackerName&&(z=m.vtp_trackerName,C=z+"."):(z="gtm"+Fg(),C=z+".");var D=function(va){var T=[].slice.call(arguments,0);T[0]=C+T[0];A.apply(window,T)},G=function(va,T){return void 0===T?T:va(T)},L=function(va,T){if(T)for(var Bb in T)T.hasOwnProperty(Bb)&&D("set",va+Bb,T[Bb])},Q=function(){},R={name:z};h(x,R,!0);var da=m.vtp_trackingId||t.trackingId;A("create",da,R);D("set","&gtm",Ok(!0));Vf()&&(D("set","&gcs",cg()),a(da,m));x._x_19&&(null==vf&&
delete x._x_19,x._x_20&&!c[z]&&(c[z]=!0,A(hk(z,String(x._x_20)))));m.vtp_enableRecaptcha&&D("require","recaptcha","recaptcha.js");(function(va,T){void 0!==m[T]&&D("set",va,m[T])})("nonInteraction","vtp_nonInteraction");L("contentGroup",q);L("dimension",u);L("metric",v);var Y={};h(x,Y,!1)&&D("set",Y);var S;
m.vtp_enableLinkId&&D("require","linkid","linkid.js");D("set","hitCallback",function(){var va=x&&x.hitCallback;Fa(va)&&va();m.vtp_gtmOnSuccess()});if("TRACK_EVENT"==m.vtp_trackType){m.vtp_enableEcommerce&&(D("require","ec","ec.js"),Q());var M={hitType:"event",eventCategory:String(m.vtp_eventCategory||t.category),eventAction:String(m.vtp_eventAction||t.action),eventLabel:G(String,m.vtp_eventLabel||t.label),eventValue:G(Pa,m.vtp_eventValue||
t.value)};h(S,M,!1);D("send",M);}else if("TRACK_SOCIAL"==m.vtp_trackType){}else if("TRACK_TRANSACTION"==m.vtp_trackType){}else if("TRACK_TIMING"==
m.vtp_trackType){}else if("DECORATE_LINK"==m.vtp_trackType){}else if("DECORATE_FORM"==m.vtp_trackType){}else if("TRACK_DATA"==m.vtp_trackType){}else{m.vtp_enableEcommerce&&(D("require","ec","ec.js"),Q());if(m.vtp_doubleClick||"DISPLAY_FEATURES"==m.vtp_advertisingFeaturesType){var Aa=
"_dc_gtm_"+String(m.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");D("require","displayfeatures",void 0,{cookieName:Aa})}if("DISPLAY_FEATURES_WITH_REMARKETING_LISTS"==m.vtp_advertisingFeaturesType){var ad="_dc_gtm_"+String(m.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");D("require","adfeatures",{cookieName:ad})}S?D("send","pageview",S):D("send","pageview");}if(!b){var Xd=m.vtp_useDebugVersion?"u/analytics_debug.js":"analytics.js";m.vtp_useInternalVersion&&!m.vtp_useDebugVersion&&(Xd="internal/"+Xd);b=!0;var Ll=Ak(x._x_19,"/analytics.js"),Wr=kj("https:","http:","//www.google-analytics.com/"+Xd,x&&!!x.forceSSL);P("analytics.js"===Xd&&Ll?Ll:Wr,function(){var va=bk();va&&va.loaded||m.vtp_gtmOnFailure();},m.vtp_gtmOnFailure)}}else N(m.vtp_gtmOnFailure)};
X.__ua=e;X.__ua.g="ua";X.__ua.h=!0;X.__ua.priorityOverride=0}();

X.b.inject_script=["google"],function(){function a(b,c){return{url:c}}(function(b){X.__inject_script=b;X.__inject_script.g="inject_script";X.__inject_script.h=!0;X.__inject_script.priorityOverride=0})(function(b){var c=b.vtp_urls||[],d=b.vtp_createPermissionError;return{assert:function(e,f){if(!p(f))throw d(e,{},"Script URL must be a string.");try{if(qe(vh(f),c))return}catch(g){throw d(e,{},"Invalid script URL filter.");}throw d(e,{},"Prohibited script URL: "+f);},J:a}})}();


X.b.opt=["google"],function(){var a,b=function(c){var d={};if(c.vtp_gaSettings){var e=c.vtp_gaSettings;E(Up(e.vtp_fieldsToSet,"fieldName","value"),d);c.vtp_gaSettings=null;e.vtp_fieldsToSet=void 0;var f=E(e);c=E(c,f)||{}}E(Up(c.vtp_fieldsToSet,"fieldName","value"),d);var g=dk(c.vtp_functionName);if(Fa(g)){g.r=!0;var h="",l="";c.vtp_setTrackerName&&"string"===typeof c.vtp_trackerName?""!==c.vtp_trackerName&&(l=c.vtp_trackerName,h=l+"."):(l="gtm"+Fg(),h=l+".");var n={name:!0,clientId:!0,sampleRate:!0,
siteSpeedSampleRate:!0,alwaysSendReferrer:!0,allowAnchor:!0,allowLinker:!0,cookieName:!0,cookieDomain:!0,cookieExpires:!0,cookiePath:!0,cookieUpdate:!0,legacyCookieDomain:!0,legacyHistoryImport:!0,storage:!0,useAmpClientId:!0,storeGac:!0},m={allowAnchor:!0,allowLinker:!0,alwaysSendReferrer:!0,anonymizeIp:!0,cookieUpdate:!0,exFatal:!0,forceSSL:!0,javaEnabled:!0,legacyHistoryImport:!0,nonInteraction:!0,useAmpClientId:!0,useBeacon:!0,storeGac:!0},r=function(y,x,A){var C=0,z;for(z in y)if(y.hasOwnProperty(z)&&
(A&&n[z]||!A&&void 0===n[z])){var D=m[z]?Qa(y[z]):y[z];"anonymizeIp"!==z||D||(D=void 0);x[z]=D;C++}return C},t={name:l};r(d,t,!0);var q={"&gtm":Ok(!0)};r(d,q,!1);var u=encodeURI(kj("https:","http:","//www.google-analytics.com/"+(c.vtp_useDebugVersion?"u/analytics_debug.js":"analytics.js"),!!d.forceSSL));g("create",c.vtp_trackingId,t);g(h+"set",q);g(h+"require",c.vtp_optimizeContainerId,{dataLayer:"dataLayer"});g(c.vtp_gtmOnSuccess);g(h+"require","render");a||(a=!0,P(u,function(){return bk().loaded||
c.vtp_gtmOnFailure()},c.vtp_gtmOnFailure));var v=V("dataLayer"),w=v&&v.hide;w&&(w.end||!0===w["GTM-NWDMT9Q"])&&(w[c.vtp_optimizeContainerId]=!0)}else N(c.vtp_gtmOnFailure)};X.__opt=b;X.__opt.g="opt";X.__opt.h=!0;X.__opt.priorityOverride=0}();



X.b.aev=["google"],function(){function a(q,u){var v=lh(q,"gtm");if(v)return v[u]}function b(q,u,v,w){w||(w="element");var y=q+"."+u,x;if(m.hasOwnProperty(y))x=m[y];else{var A=a(q,w);if(A&&(x=v(A),m[y]=x,r.push(y),35<r.length)){var C=r.shift();delete m[C]}}return x}function c(q,u,v){var w=a(q,t[u]);return void 0!==w?w:v}function d(q,u){if(!q)return!1;var v=e(bp());Ha(u)||(u=String(u||"").replace(/\s+/g,"").split(","));for(var w=[v],y=0;y<u.length;y++)if(u[y]instanceof RegExp){if(u[y].test(q))return!1}else{var x=
u[y];if(0!=x.length){if(0<=e(q).indexOf(x))return!1;w.push(e(x))}}return!Tp(q,w)}function e(q){n.test(q)||(q="http://"+q);return th(vh(q),"HOST",!0)}function f(q,u,v){switch(q){case "SUBMIT_TEXT":return b(u,"FORM."+q,g,"formSubmitElement")||v;case "LENGTH":var w=b(u,"FORM."+q,h);return void 0===w?v:w;case "INTERACTED_FIELD_ID":return l(u,"id",v);case "INTERACTED_FIELD_NAME":return l(u,"name",v);case "INTERACTED_FIELD_TYPE":return l(u,"type",v);case "INTERACTED_FIELD_POSITION":var y=a(u,"interactedFormFieldPosition");
return void 0===y?v:y;case "INTERACT_SEQUENCE_NUMBER":var x=a(u,"interactSequenceNumber");return void 0===x?v:x;default:return v}}function g(q){switch(q.tagName.toLowerCase()){case "input":return Ef(q,"value");case "button":return Ff(q);default:return null}}function h(q){if("form"===q.tagName.toLowerCase()&&q.elements){for(var u=0,v=0;v<q.elements.length;v++)zo(q.elements[v])&&u++;return u}}function l(q,u,v){var w=a(q,"interactedFormField");return w&&Ef(w,u)||v}var n=/^https?:\/\//i,m={},r=[],t={ATTRIBUTE:"elementAttribute",
CLASSES:"elementClasses",ELEMENT:"element",ID:"elementId",HISTORY_CHANGE_SOURCE:"historyChangeSource",HISTORY_NEW_STATE:"newHistoryState",HISTORY_NEW_URL_FRAGMENT:"newUrlFragment",HISTORY_OLD_STATE:"oldHistoryState",HISTORY_OLD_URL_FRAGMENT:"oldUrlFragment",TARGET:"elementTarget"};(function(q){X.__aev=q;X.__aev.g="aev";X.__aev.h=!0;X.__aev.priorityOverride=0})(function(q){var u=q.vtp_gtmEventId,v=q.vtp_defaultValue,w=q.vtp_varType;switch(w){case "TAG_NAME":var y=a(u,"element");return y&&y.tagName||
v;case "TEXT":return b(u,w,Ff)||v;case "URL":var x;a:{var A=String(a(u,"elementUrl")||v||""),C=vh(A),z=String(q.vtp_component||"URL");switch(z){case "URL":x=A;break a;case "IS_OUTBOUND":x=d(A,q.vtp_affiliatedDomains);break a;default:x=th(C,z,q.vtp_stripWww,q.vtp_defaultPages,q.vtp_queryKey)}}return x;case "ATTRIBUTE":var D;if(void 0===q.vtp_attribute)D=c(u,w,v);else{var G=q.vtp_attribute,L=a(u,"element");D=L&&Ef(L,G)||v||""}return D;case "MD":var Q=q.vtp_mdValue,R=b(u,"MD",Lo);return Q&&R?Oo(R,Q)||
v:R||v;case "FORM":return f(String(q.vtp_component||"SUBMIT_TEXT"),u,v);default:return c(u,w,v)}})}();
X.b.gas=["google"],function(){(function(a){X.__gas=a;X.__gas.g="gas";X.__gas.h=!0;X.__gas.priorityOverride=0})(function(a){var b=E(a),c=b;c[wd.Oa]=null;c[wd.wf]=null;var d=b=c;d.vtp_fieldsToSet=d.vtp_fieldsToSet||[];var e=d.vtp_cookieDomain;void 0!==e&&(d.vtp_fieldsToSet.push({fieldName:"cookieDomain",value:e}),delete d.vtp_cookieDomain);return b})}();

X.b.baut=["nonGoogleScripts"],function(){var a=!1,b=function(c){var d=c.vtp_uetqName||"uetq",e=V(d,[],!0);if("VARIABLE_REVENUE"==c.vtp_eventType)e.push({gv:c.vtp_goalValue}),c.vtp_gtmOnSuccess();else if("CUSTOM"==c.vtp_eventType){var f={},g=function(h,l){void 0!==c[h]&&(f[l]=c[h])};g("vtp_goalValue","gv");g("vtp_eventCategory","ec");g("vtp_eventAction","ea");g("vtp_eventLabel","el");g("vtp_eventValue","ev");e.push(f);c.vtp_gtmOnSuccess()}else if(a)c.vtp_gtmOnSuccess();else try{P("//bat.bing.com/bat.js",
function(){var h=ef(V("UET"),{ti:c.vtp_tagId,q:e});B[d]=h;h.push("pageLoad");c.vtp_gtmOnSuccess()},c.vtp_gtmOnFailure),a=!0}catch(h){N(c.vtp_gtmOnFailure)}};X.__baut=b;X.__baut.g="baut";X.__baut.h=!0;X.__baut.priorityOverride=0}();





X.b.html=["customScripts"],function(){function a(d,e,f,g){return function(){try{if(0<e.length){var h=e.shift(),l=a(d,e,f,g);if("SCRIPT"==String(h.nodeName).toUpperCase()&&"text/gtmscript"==h.type){var n=K.createElement("script");n.async=!1;n.type="text/javascript";n.id=h.id;n.text=h.text||h.textContent||h.innerHTML||"";h.charset&&(n.charset=h.charset);var m=h.getAttribute("data-gtmsrc");m&&(n.src=m,xf(n,l));d.insertBefore(n,null);m||l()}else if(h.innerHTML&&0<=h.innerHTML.toLowerCase().indexOf("<script")){for(var r=
[];h.firstChild;)r.push(h.removeChild(h.firstChild));d.insertBefore(h,null);a(h,r,l,g)()}else d.insertBefore(h,null),l()}else f()}catch(t){N(g)}}}var b=function(d,e,f){Nj(function(){var g,h=O;h.postscribe||(h.postscribe=se);g=h.postscribe;var l={done:e},n=K.createElement("div");n.style.display="none";n.style.visibility="hidden";K.body.appendChild(n);try{g(n,d,l)}catch(m){N(f)}})};var c=function(d){if(K.body){var e=
d.vtp_gtmOnFailure,f=op(d.vtp_html,d.vtp_gtmOnSuccess,e),g=f.ad,h=f.I;if(d.vtp_useIframe){}else d.vtp_supportDocumentWrite?b(g,h,e):a(K.body,Gf(g),h,e)()}else $o(function(){c(d)},
200)};X.__html=c;X.__html.g="html";X.__html.h=!0;X.__html.priorityOverride=0}();






X.b.lcl=[],function(){function a(){var c=V("document"),d=0,e=function(f){var g=f.target;if(g&&3!==f.which&&!(f.Rg||f.timeStamp&&f.timeStamp===d)){d=f.timeStamp;g=Hf(g,["a","area"],100);if(!g)return f.returnValue;var h=f.defaultPrevented||!1===f.returnValue,l=wo("lcl",h?"nv.mwt":"mwt",0),n;n=h?wo("lcl","nv.ids",[]):wo("lcl","ids",[]);if(n.length){var m=so(g,"gtm.linkClick",n);if(b(f,g,c)&&!h&&l&&g.href){var r=String(np(g,"rel")||""),t=!!Ja(r.split(" "),function(v){return"noreferrer"===v.toLowerCase()});
t&&I(36);var q=V((np(g,"target")||"_self").substring(1)),u=!0;if(fp(m,io(function(){var v;if(v=u&&q){var w;a:if(t){var y;try{y=new MouseEvent(f.type)}catch(x){if(!c.createEvent){w=!1;break a}y=c.createEvent("MouseEvents");y.initEvent(f.type,!0,!0)}y.Rg=!0;f.target.dispatchEvent(y);w=!0}else w=!1;v=!w}v&&(q.location.href=np(g,"href"))}),l))u=!1;else return f.preventDefault&&f.preventDefault(),f.returnValue=!1}else fp(m,function(){},l||2E3);return!0}}};Cf(c,"click",e,!1);Cf(c,"auxclick",e,!1)}function b(c,
d,e){if(2===c.which||c.ctrlKey||c.shiftKey||c.altKey||c.metaKey)return!1;var f=np(d,"href"),g=f.indexOf("#"),h=np(d,"target");if(h&&"_self"!==h&&"_parent"!==h&&"_top"!==h||0===g)return!1;if(0<g){var l=dp(f),n=dp(e.location);return l!==n}return!0}(function(c){X.__lcl=c;X.__lcl.g="lcl";X.__lcl.h=!0;X.__lcl.priorityOverride=0})(function(c){var d=void 0===c.vtp_waitForTags?!0:c.vtp_waitForTags,e=void 0===c.vtp_checkValidation?!0:c.vtp_checkValidation,f=Number(c.vtp_waitForTagsTimeout);if(!f||0>=f)f=2E3;
var g=c.vtp_uniqueTriggerId||"0";if(d){var h=function(n){return Math.max(f,n)};vo("lcl","mwt",h,0);e||vo("lcl","nv.mwt",h,0)}var l=function(n){n.push(g);return n};vo("lcl","ids",l,[]);e||vo("lcl","nv.ids",l,[]);kp("lcl")||(a(),lp("lcl"));N(c.vtp_gtmOnSuccess)})}();
X.b.evl=["google"],function(){function a(){var f=Number(ep("gtm.start"))||0;return ap().getTime()-f}function b(f,g,h,l){function n(){if(!Ro(f.target)){g.has(d.Vb)||g.set(d.Vb,""+a());g.has(d.Nc)||g.set(d.Nc,""+a());var r=0;g.has(d.Xb)&&(r=Number(g.get(d.Xb)));r+=100;g.set(d.Xb,""+r);if(r>=h){var t=so(f.target,"gtm.elementVisibility",[g.a]),q=Qo(f.target);t["gtm.visibleRatio"]=Math.round(1E3*q)/10;t["gtm.visibleTime"]=h;t["gtm.visibleFirstTime"]=Number(g.get(d.Nc));t["gtm.visibleLastTime"]=Number(g.get(d.Vb));
fp(t);l()}}}if(!g.has(d.lb)&&(0==h&&n(),!g.has(d.Pa))){var m=V("self").setInterval(n,100);g.set(d.lb,m)}}function c(f){f.has(d.lb)&&(V("self").clearInterval(Number(f.get(d.lb))),f.i(d.lb))}var d={lb:"polling-id-",Nc:"first-on-screen-",Vb:"recent-on-screen-",Xb:"total-visible-time-",Pa:"has-fired-"},e=function(f,g){this.element=f;this.a=g};e.prototype.has=function(f){return!!this.element.getAttribute("data-gtm-vis-"+f+this.a)};e.prototype.get=function(f){return this.element.getAttribute("data-gtm-vis-"+
f+this.a)};e.prototype.set=function(f,g){this.element.setAttribute("data-gtm-vis-"+f+this.a,g)};e.prototype.i=function(f){this.element.removeAttribute("data-gtm-vis-"+f+this.a)};(function(f){X.__evl=f;X.__evl.g="evl";X.__evl.h=!0;X.__evl.priorityOverride=0})(function(f){function g(){var y=!1,x=null;if("CSS"===l){try{x=fg(n)}catch(G){I(46)}y=!!x&&v.length!=x.length}else if("ID"===l){var A=K.getElementById(n);A&&(x=[A],y=1!=v.length||v[0]!==A)}x||(x=[],y=0<v.length);if(y){for(var C=0;C<v.length;C++){var z=
new e(v[C],q);c(z)}v=[];for(var D=0;D<x.length;D++)v.push(x[D]);0<=w&&Xo(w);0<v.length&&(w=Wo(h,v,[t]))}}function h(y){var x=new e(y.target,q);y.intersectionRatio>=t?x.has(d.Pa)||b(y,x,r,"ONCE"===u?function(){for(var A=0;A<v.length;A++){var C=new e(v[A],q);C.set(d.Pa,"1");c(C)}Xo(w);if(m&&Do)for(var z=0;z<Do.length;z++)Do[z]===g&&Do.splice(z,1)}:function(){x.set(d.Pa,"1");c(x)}):(c(x),"MANY_PER_ELEMENT"===u&&x.has(d.Pa)&&(x.i(d.Pa),x.i(d.Xb)),x.i(d.Vb))}var l=f.vtp_selectorType,n;"ID"===l?n=String(f.vtp_elementId):
"CSS"===l&&(n=String(f.vtp_elementSelector));var m=!!f.vtp_useDomChangeListener,r=f.vtp_useOnScreenDuration&&Number(f.vtp_onScreenDuration)||0,t=(Number(f.vtp_onScreenRatio)||50)/100,q=f.vtp_uniqueTriggerId,u=f.vtp_firingFrequency,v=[],w=-1;g();m&&Eo(g);N(f.vtp_gtmOnSuccess)})}();


var Rr={};Rr.macro=function(a){if(po.Oc.hasOwnProperty(a))return po.Oc[a]},Rr.onHtmlSuccess=po.De(!0),Rr.onHtmlFailure=po.De(!1);Rr.dataLayer=hh;Rr.callback=function(a){Dg.hasOwnProperty(a)&&Fa(Dg[a])&&Dg[a]();delete Dg[a]};function Sr(){O[Ld.C]=Rr;Wa(Eg,X.b);od=od||po;pd=Hd}
function Tr(){Kf.gtm_3pds=!0;Kf.gtag_cs_api=!0;O=B.google_tag_manager=B.google_tag_manager||{};var a=!1;ol(),a=!0;if(O[Ld.C]){var b=O.zones;b&&b.unregisterChild(Ld.C);}else{for(var c=data.resource||{},d=c.macros||[],e=0;e<d.length;e++)hd.push(d[e]);for(var f=c.tags||[],g=0;g<f.length;g++)kd.push(f[g]);for(var h=c.predicates||[],l=0;l<h.length;l++)jd.push(h[l]);for(var n=c.rules||[],m=0;m<n.length;m++){for(var r=n[m],t={},q=0;q<r.length;q++)t[r[q][0]]=Array.prototype.slice.call(r[q],1);id.push(t)}md=X;nd=Op;var u=data.permissions||{},v=data.sandboxed_scripts,w=data.security_groups;tn();Pd=new Od(u);if(void 0!==
v)for(var y=["sandboxedScripts"],x=0;x<v.length;x++){var A=v[x].replace(/^_*/,"");Eg[A]=y}wn(w);Sr();oo();Ij=!1;Jj=0;if("interactive"==K.readyState&&!K.createEventObject||"complete"==K.readyState)Lj();else{Cf(K,"DOMContentLoaded",Lj);Cf(K,"readystatechange",Lj);if(K.createEventObject&&K.documentElement.doScroll){var C=!0;try{C=!B.frameElement}catch(L){}C&&Mj()}Cf(B,"load",Lj)}Kn=!1;"complete"===K.readyState?Mn():Cf(B,"load",Mn);a:{if(!Xg)break a;B.setInterval(Yg,864E5);}
Bg=(new Date).getTime();}}
(function(a){
a()})(Tr);

})()
