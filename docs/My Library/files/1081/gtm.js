
// Copyright 2012 Google Inc. All rights reserved.
(function(w,g){w[g]=w[g]||{};w[g].e=function(s){return eval(s);};})(window,'google_tag_manager');(function(){

var data = {
"resource": {
  "version":"38",
  
  "macros":[{
      "function":"__aev",
      "vtp_varType":"TEXT"
    },{
      "function":"__v",
      "vtp_name":"gtm.elementId",
      "vtp_dataLayerVersion":1
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_name":"gtm.triggers",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":true,
      "vtp_defaultValue":""
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
      "vtp_trackingId":"UA-86516288-1",
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
      "function":"__v",
      "vtp_name":"gtm.elementClasses",
      "vtp_dataLayerVersion":1
    },{
      "function":"__vis",
      "vtp_elementSelector":".error",
      "vtp_outputMethod":"BOOLEAN",
      "vtp_selectorType":"CSS",
      "vtp_onScreenRatio":"50"
    },{
      "function":"__v",
      "vtp_name":"gtm.elementUrl",
      "vtp_dataLayerVersion":1
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",8],8,16],".split(\"\/\"),b=a.indexOf(\"journals\");return a[b+1]})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return 0\u003C=",["escape",["macro",8],8,16],".indexOf(\".pdf\")?!0:0\u003C=",["escape",["macro",0],8,16],".indexOf(\"Download PDF\")?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=\"\";-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/core-reader\")?-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/books\/\")?a=\"core_reader_chapter \":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/article\/\")?a=\"core_reader_article \":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/elements\/\")\u0026\u0026(a=\"core_reader_element \"):-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/listing\")?a=\"content_listing_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/books\/\")?a=5===",["escape",["macro",5],8,16],".split(\"\/\").length?\"book_page\":\"chapter_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/article\/\")?\na=\"article_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/elements\/\")?a=\"element_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/collections\/\")?a=\"collection_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/journals\/\")?a=\"journal_page\":-1\u003C",["escape",["macro",5],8,16],".indexOf(\"\/search\")\u0026\u0026(a=\"search_listing_page\");return a})();"]
    },{
      "function":"__v",
      "vtp_name":"gtm.element",
      "vtp_dataLayerVersion":1
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){sendToType=",["escape",["macro",12],8,16],".getAttribute(\"aria-label\");if(-1\u003CsendToType.indexOf(\"to Kindle\"))return\"kindle\";if(-1\u003CsendToType.indexOf(\"to Google Drive\"))return\"google_drive\";if(-1\u003CsendToType.indexOf(\"to Dropbox\"))return\"dropbox\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return document.querySelectorAll(\".unsilo-article\").length})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return document.querySelectorAll(\"#trendmd-suggestions\").length})();"]
    },{
      "function":"__u",
      "vtp_component":"URL",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=!1,b=",["escape",["macro",16],8,16],".split(\"\/\"),c=b.indexOf(\"books\");0\u003C=c\u0026\u0026(a=b[c+1]);return a})();"]
    },{
      "function":"__j",
      "vtp_name":"AOP.isInternalTraffic"
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",12],8,16],".parentElement.parentElement.className;a=a.split(\" \");var b=!1;for(i=0;i\u003Ca.length;i++)\"breadcrumbs\"===a[i]\u0026\u0026(b=!0);return b})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",12],8,16],".parentElement.parentElement.querySelectorAll(\"a, span\"),b=[];for(i=0;i\u003Ca.length;i++)b.push(a[i].innerHTML);a=",["escape",["macro",0],8,16],"+\": \"+b.join(\" \\x3e \");return\"\"!=a?a:\"debug: \"+",["escape",["macro",12],8,16],"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){if(\"icon switch off\"===",["escape",["macro",6],8,16],")return\"toggle_on\";if(\"icon switch on\"===",["escape",["macro",6],8,16],")return\"toggle_off\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return-1\u003C",["escape",["macro",12],8,16],".parentElement.className.indexOf(\"export-buttons\")||-1\u003C",["escape",["macro",12],8,16],".parentElement.parentElement.id.indexOf(\"selectedStyle\")||-1\u003C",["escape",["macro",12],8,16],".id.indexOf(\"copyCitationData\")?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=document.getElementById(\"counter5ReportTypeSelect\").value;a\u0026\u0026(a=\"download_\"+a);return a})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return document.getElementById(\"format\").value})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=!1;\"multilingual-suggestion-modal-accept-option\"==",["escape",["macro",1],8,16],"?a=\"prompt_accept\":\"multilingual-suggestion-modal-decline-option\"==",["escape",["macro",1],8,16],"?a=\"prompt_decline\":\"close-reveal-modal\"==",["escape",["macro",6],8,16],"\u0026\u0026\"multilingual-suggestion-modal\"==",["escape",["macro",12],8,16],".parentElement.parentElement.id\u0026\u0026(a=\"prompt_decline\");return a})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",16],8,16],".split(\"\/\"),b=a.indexOf(\"journals\");return a[b+1]})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return\"Fran\\u00e7ais\"==",["escape",["macro",0],8,16],"||\"English\"==",["escape",["macro",0],8,16],"?!0:!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=\"fts\"==",["escape",["macro",1],8,16],"\u0026\u0026$(\"#fts\").prop(\"checked\"),b=\"ftsCheckbox\"==",["escape",["macro",1],8,16],"\u0026\u0026$(\"#ftsCheckbox\").prop(\"checked\");return a||b?\"tick\":\"untick\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return\"fts\"==",["escape",["macro",1],8,16],"?\"facet\":\"ftsCheckbox\"==",["escape",["macro",1],8,16],"?\"header\":!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=",["escape",["macro",12],8,16],";return\"string\"===typeof a.text?a.text.trim().toLowerCase().replace(\/\\s\/g,\"_\"):\"undefined\"})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=document.getElementsByClassName(\"annotator-frame\");return a\u0026\u0026a[0]?!a[0].classList.contains(\"annotator-collapsed\"):!1})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=!1,b=",["escape",["macro",12],8,16],".parentElement.parentElement.className;-1\u003Cb.indexOf(\"kbart-list-entry\")\u0026\u0026(a=!0);return a})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){var a=!1;\"login-modal\"==",["escape",["macro",12],8,16],".parentElement.parentElement.id\u0026\u0026\"close-reveal-modal\"==",["escape",["macro",6],8,16],"?a=\"prompt_decline\":\"login-modal\"==",["escape",["macro",12],8,16],".parentElement.parentElement.parentElement.parentElement.id\u0026\u0026\"Cancel\"==",["escape",["macro",0],8,16],"\u0026\u0026(a=\"prompt_decline\");return a})();"]
    },{
      "function":"__jsm",
      "vtp_javascript":["template","(function(){return 0\u003C=",["escape",["macro",8],8,16],".indexOf(\"_TrendMD_0\")?\"internal\":\"external\"})();"]
    },{
      "function":"__u",
      "vtp_component":"HOST",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__f",
      "vtp_component":"URL"
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_name":"gtm.elementTarget",
      "vtp_dataLayerVersion":1
    }],
  "tags":[{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"core_share",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_copy_to_clipboard",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":1
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"core_share",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_via_email",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":2
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"core_share",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_within_pdf",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":3
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"my_core_orders",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_eba_summary",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":4
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"my_core_orders",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_order_export",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":5
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"my_core_orders",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_holding_list",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":6
    },{
      "function":"__paused",
      "vtp_originalTagType":"ua",
      "tag_id":7
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_author_unsilo",
      "vtp_eventLabel":["macro",0],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":8
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_journal_unsilo",
      "vtp_eventLabel":["macro",0],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":9
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_article_title_unsilo",
      "vtp_eventLabel":["macro",9],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":10
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"downloads",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"view_pdf",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":11
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"downloads",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"view_html",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":12
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"downloads",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["template","send_to_",["macro",13]],
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":13
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_book_trendmd",
      "vtp_eventLabel":["macro",0],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":14
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_article_trendmd",
      "vtp_eventLabel":["macro",9],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":15
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_competitor_trendmd",
      "vtp_eventLabel":["macro",8],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":16
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"unsilo_links_displayed",
      "vtp_eventLabel":["macro",14],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":17
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"trendmd_widget_displayed",
      "vtp_eventLabel":"1",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":18
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"related_content",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_tab_on_book_page_trendmd",
      "vtp_eventLabel":["macro",17],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":19
    },{
      "function":"__paused",
      "vtp_originalTagType":"html",
      "tag_id":20
    },{
      "function":"__cegg",
      "once_per_event":true,
      "vtp_usersNumericId":"00232529",
      "tag_id":21
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"navigation",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_breadcrumb",
      "vtp_eventLabel":["macro",20],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":23
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"MathJax",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["macro",21],
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":24
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"citation",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_export_citation",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":25
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"citation",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["template","click_",["macro",0]],
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":26
    },{
      "function":"__ua",
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"counter5",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["macro",23],
      "vtp_eventLabel":["macro",24],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":27
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"multilingual",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["macro",25],
      "vtp_eventLabel":["template",["macro",11],"_",["macro",26]],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":28
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"multilingual",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["template","switch_to_",["macro",0]],
      "vtp_eventLabel":["template",["macro",11],"_",["macro",26]],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":29
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"content_actions",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_nasa_ads",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":30
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"search",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["template",["macro",28],"_fulltextsearch_",["macro",29]],
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":31
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"content_actions",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"resize_text_large",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":32
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"content_actions",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"resize_text_small",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":33
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"tabs",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":["template","click_",["macro",30],"_tab"],
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":35
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"bookmark",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"click_add_bookmark",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":36
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"bookmark",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"bulk_remove_bookmark",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":37
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"bookmark",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"prompt_cancel",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":38
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"bookmark",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"prompt_login",
      "vtp_eventLabel":["macro",11],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":39
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"bookmark",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"remove_bookmark",
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":40
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"annotations",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"open_hypothesis_sidebar",
      "vtp_eventLabel":["macro",5],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":41
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"KBART",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",4],
      "vtp_eventAction":"list_download",
      "vtp_eventLabel":["macro",0],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":86
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_7",
      "tag_id":87
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_8",
      "tag_id":88
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_9",
      "tag_id":89
    },{
      "function":"__cl",
      "tag_id":90
    },{
      "function":"__cl",
      "tag_id":91
    },{
      "function":"__cl",
      "tag_id":92
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_16",
      "tag_id":93
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_18",
      "tag_id":94
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_19",
      "tag_id":95
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_20",
      "tag_id":96
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_21",
      "tag_id":97
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_22",
      "tag_id":98
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_23",
      "tag_id":99
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_27",
      "tag_id":100
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_28",
      "tag_id":101
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_30",
      "tag_id":102
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_43",
      "tag_id":103
    },{
      "function":"__cl",
      "tag_id":104
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_51",
      "tag_id":105
    },{
      "function":"__cl",
      "tag_id":106
    },{
      "function":"__fsl",
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_54",
      "tag_id":107
    },{
      "function":"__cl",
      "tag_id":108
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_57",
      "tag_id":109
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_60",
      "tag_id":110
    },{
      "function":"__cl",
      "tag_id":111
    },{
      "function":"__cl",
      "tag_id":112
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_65",
      "tag_id":113
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_66",
      "tag_id":114
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_67",
      "tag_id":115
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_69",
      "tag_id":116
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_70",
      "tag_id":117
    },{
      "function":"__cl",
      "tag_id":118
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_72",
      "tag_id":119
    },{
      "function":"__tg",
      "vtp_triggerIds":["list","9662913_73_75","9662913_73_69"],
      "vtp_uniqueTriggerId":"9662913_73",
      "tag_id":120
    },{
      "function":"__tg",
      "vtp_isListeningTag":true,
      "vtp_firingId":"9662913_73_75",
      "tag_id":121
    },{
      "function":"__tg",
      "vtp_isListeningTag":true,
      "vtp_firingId":"9662913_73_69",
      "tag_id":123
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_74",
      "tag_id":124
    },{
      "function":"__cl",
      "tag_id":125
    },{
      "function":"__tg",
      "vtp_triggerIds":["list","9662913_76_75","9662913_76_70"],
      "vtp_uniqueTriggerId":"9662913_76",
      "tag_id":126
    },{
      "function":"__tg",
      "vtp_isListeningTag":true,
      "vtp_firingId":"9662913_76_75",
      "tag_id":127
    },{
      "function":"__tg",
      "vtp_isListeningTag":true,
      "vtp_firingId":"9662913_76_70",
      "tag_id":129
    },{
      "function":"__cl",
      "tag_id":130
    },{
      "function":"__cl",
      "tag_id":131
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"9662913_85",
      "tag_id":132
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_html":"\n\n\u003Cscript type=\"text\/javascript\"\u003Ewindow.lightningjs||function(c){function g(b,d){d\u0026\u0026(d+=(\/\\?\/.test(d)?\"\\x26\":\"?\")+\"lv\\x3d1\");c[b]||function(){var k=window,h=document,l=b,g=h.location.protocol,n=\"load\",m=0;(function(){function b(){a.P(n);a.w=1;c[l](\"_load\")}c[l]=function(){function p(){p.id=e;return c[l].apply(p,arguments)}var e=++m;var b=this\u0026\u0026this!=k?this.id||0:0;(a.s=a.s||[]).push([e,b,arguments]);p.then=function(b,c,h){var d=a.fh[e]=a.fh[e]||[],l=a.eh[e]=a.eh[e]||[],f=a.ph[e]=a.ph[e]||[];b\u0026\u0026d.push(b);c\u0026\u0026l.push(c);h\u0026\u0026f.push(h);\nreturn p};return p};var a=c[l]._={};a.fh={};a.eh={};a.ph={};a.l=d?d.replace(\/^\\\/\\\/\/,(\"https:\"==g?g:\"http:\")+\"\/\/\"):d;a.p={0:+new Date};a.P=function(b){a.p[b]=new Date-a.p[0]};a.w\u0026\u0026b();k.addEventListener?k.addEventListener(n,b,!1):k.attachEvent(\"on\"+n,b);var t=function(){function b(){return[\"\\x3chead\\x3e\\x3c\/head\\x3e\\x3c\",e,' onload\\x3d\"var d\\x3d',q,\";d.getElementsByTagName('head')[0].\",d,\"(d.\",g,\"('script')).\",k,\"\\x3d'\",a.l,\"'\\\"\\x3e\\x3c\/\",e,\"\\x3e\"].join(\"\")}var e=\"body\",c=h[e];if(!c)return setTimeout(t,\n100);a.P(1);var d=\"appendChild\",g=\"createElement\",k=\"src\",m=h[g](\"div\"),n=m[d](h[g](\"div\")),f=h[g](\"iframe\"),q=\"document\";m.style.display=\"none\";c.insertBefore(m,c.firstChild).id=r+\"-\"+l;f.frameBorder=\"0\";f.id=r+\"-frame-\"+l;\/MSIE[ ]+6\/.test(navigator.userAgent)\u0026\u0026(f[k]=\"javascript:false\");f.allowTransparency=\"true\";n[d](f);try{f.contentWindow[q].open()}catch(w){a.domain=h.domain;var u=\"javascript:var d\\x3d\"+q+\".open();d.domain\\x3d'\"+h.domain+\"';\";f[k]=u+\"void(0);\"}try{var v=f.contentWindow[q];v.write(b());\nv.close()}catch(w){f[k]=u+'d.write(\"'+b().replace(\/\"\/g,String.fromCharCode(92)+'\"')+'\");d.close();'}a.P(2)};a.l\u0026\u0026setTimeout(t,0)})()}();c[b].lv=\"1\";return c[b]}var r=\"lightningjs\",m=window[r]=g(r);m.require=g;m.modules=c}({});navigator.userAgent.match(\/Android|BlackBerry|BB10|iPhone|iPad|iPod|Opera Mini|IEMobile\/i)?window.usabilla_live=lightningjs.require(\"usabilla_live\",\"\/\/w.usabilla.com\/fd5b55c7190e.js\"):window.usabilla_live=lightningjs.require(\"usabilla_live\",\"\/\/w.usabilla.com\/a6cb7ebcf2a6.js\");\u003C\/script\u003E",
      "vtp_supportDocumentWrite":true,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "vtp_usePostscribe":true,
      "tag_id":22
    }],
  "predicates":[{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Copy to clipboard"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"copyShareLink"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.linkClick"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_8($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Via email"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_7($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Within PDF"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_9($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"orderReportButton"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"EBA Summary"
    },{
      "function":"_eq",
      "arg0":["macro",7],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.click"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Order export"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Holding list"
    },{
      "function":"_eq",
      "arg0":["macro",6],
      "arg1":"trendmd-widget-list-item__link"
    },{
      "function":"_cn",
      "arg0":["macro",8],
      "arg1":"\/article\/"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_16($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"unsilo-author"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_18($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"unsilo-journal"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_19($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"unsilo-article"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_20($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",10],
      "arg1":"true"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_21($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",8],
      "arg1":"\/core-reader"
    },{
      "function":"_re",
      "arg0":["macro",13],
      "arg1":"kindle|dropbox|google_drive"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_22($|,)))"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_23($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",8],
      "arg1":"\/books\/"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_27($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",8],
      "arg1":"TrendMD_0"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_28($|,)))"
    },{
      "function":"_gt",
      "arg0":["macro",14],
      "arg1":"0"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.js"
    },{
      "function":"_gt",
      "arg0":["macro",15],
      "arg1":"0"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.load"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"Related content"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_30($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",18],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",19],
      "arg1":"true"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_43($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"icon switch"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"export-citation"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_51($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",22],
      "arg1":"true"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"counter5UsageReports"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.formSubmit"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_54($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",25],
      "arg1":"false"
    },{
      "function":"_eq",
      "arg0":["macro",27],
      "arg1":"true"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_57($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",0],
      "arg1":"NASA ADS Abstract Service"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_60($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"fts"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"ftsCheckbox"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"large-text"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_65($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"standard-text"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_66($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"gtm-tab"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_67($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"not-bookmarked"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"remove-selected-bookmarks"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"disabled"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_72($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",2],
      "arg1":"gtm.triggerGroup"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_73($|,)))"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_76($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"remove-single-bookmark"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_74($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"annotator-frame-button--sidebar_toggle h-icon-chevron-left"
    },{
      "function":"_eq",
      "arg0":["macro",6],
      "arg1":"annotator-frame-button h-icon-note"
    },{
      "function":"_eq",
      "arg0":["macro",31],
      "arg1":"false"
    },{
      "function":"_cn",
      "arg0":["macro",32],
      "arg1":"false"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_85($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"requires-login"
    },{
      "function":"_eq",
      "arg0":["macro",33],
      "arg1":"prompt_decline"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_69($|,)))"
    },{
      "function":"_cn",
      "arg0":["macro",6],
      "arg1":"confirm login"
    },{
      "function":"_re",
      "arg0":["macro",3],
      "arg1":"(^$|((^|,)9662913_70($|,)))"
    }],
  "rules":[
    [["if",0,1,2,3],["add",0]],
    [["if",2,4,5],["add",1]],
    [["if",2,6,7],["add",2]],
    [["if",8,9,10,11],["add",3]],
    [["if",8,10,11,12],["add",4]],
    [["if",8,10,11,13],["add",5]],
    [["if",2,14,15,16],["add",6,14]],
    [["if",2,17,18],["add",7]],
    [["if",2,19,20],["add",8]],
    [["if",2,21,22],["add",9]],
    [["if",2,23,24],["add",10]],
    [["if",2,25,27],["unless",26],["add",11]],
    [["if",2,26,28],["add",12]],
    [["if",2,14,29,30],["add",13]],
    [["if",2,14,32],["unless",31],["add",15]],
    [["if",33,34],["add",16]],
    [["if",35,36],["add",17]],
    [["if",2,37,38],["add",18]],
    [["if",36,39],["add",19,20]],
    [["if",2,40,41],["add",21]],
    [["if",11,42],["add",22]],
    [["if",2,43,44],["add",23]],
    [["if",11,45],["add",24]],
    [["if",46,47,48],["add",25]],
    [["if",11],["unless",49],["add",26]],
    [["if",2,50,51],["add",27]],
    [["if",2,52,53],["add",28]],
    [["if",11,54],["add",29]],
    [["if",11,55],["add",29]],
    [["if",2,56,57],["add",30]],
    [["if",2,58,59],["add",31]],
    [["if",2,60,61],["add",32]],
    [["if",11,62],["add",33]],
    [["if",2,63,65],["unless",64],["add",34]],
    [["if",66,67],["add",35]],
    [["if",66,68],["add",36]],
    [["if",2,69,70],["add",37]],
    [["if",11,71],["add",38]],
    [["if",11,72,73],["add",38]],
    [["if",2,75],["unless",74],["add",39]],
    [["if",34],["add",40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,76,77,78,81,82,83]],
    [["if",11,62,76],["add",74,79]],
    [["if",2,77,78],["add",75]],
    [["if",2,79,80],["add",80]],
    [["if",36],["add",84]]]
},
"runtime":[[50,"__cegg",[46,"a"],[52,"b",["require","injectScript"]],[52,"c",["require","getTimestamp"]],[52,"d",["require","makeInteger"]],[52,"e",["require","setInWindow"]],[52,"f",[17,[15,"a"],"usersNumericId"]],[22,[28,[15,"f"]],[46,[2,[15,"a"],"gtmOnFailure",[7]],[36]]],[22,[17,[15,"a"],"snapshotName"],[46,["e","CE_SNAPSHOT_NAME",[17,[15,"a"],"snapshotName"],true]]],[41,"g"],[3,"g",[2,[15,"f"],"toString",[7]]],[42,[23,[17,[15,"g"],"length"],8],[46],false,[46,[3,"g",[0,"0",[15,"g"]]]]],[52,"h",[2,[15,"g"],"match",[7,"(\\d+)(\\d{4})$"]]],[22,[28,[15,"h"]],[46,[2,[15,"a"],"gtmOnFailure",[7]],[36]]],[52,"i",[0,[0,[0,[0,[0,[0,"https://script.crazyegg.com/pages/scripts/",[16,[15,"h"],1]],"/"],[16,[15,"h"],2]],".js"],"?"],["d",[10,["c"],3600000]]]],["b",[15,"i"],[17,[15,"a"],"gtmOnSuccess"],[17,[15,"a"],"gtmOnFailure"],[2,[15,"f"],"toString",[7]]]]]
,"permissions":{"__cegg":{"access_globals":{"keys":[{"key":"CE_SNAPSHOT_NAME","read":true,"write":true,"execute":false}]},"inject_script":{"urls":["https:\/\/script.crazyegg.com\/pages\/scripts\/*"]}}}

,"security_groups":{
"nonGoogleScripts":["__cegg"]}

};
/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
var ca,da="function"==typeof Object.create?Object.create:function(a){var b=function(){};b.prototype=a;return new b},fa;if("function"==typeof Object.setPrototypeOf)fa=Object.setPrototypeOf;else{var ha;a:{var ia={eg:!0},ja={};try{ja.__proto__=ia;ha=ja.eg;break a}catch(a){}ha=!1}fa=ha?function(a,b){a.__proto__=b;if(a.__proto__!==b)throw new TypeError(a+" is not extensible");return a}:null}
var ka=fa,la=function(a,b){a.prototype=da(b.prototype);a.prototype.constructor=a;if(ka)ka(a,b);else for(var c in b)if("prototype"!=c)if(Object.defineProperties){var d=Object.getOwnPropertyDescriptor(b,c);d&&Object.defineProperty(a,c,d)}else a[c]=b[c];a.Wh=b.prototype},ma=this||self,na=/^[\w+/_-]+[=]{0,2}$/,oa=null,pa=function(a,b){function c(){}c.prototype=b.prototype;a.Wh=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.ni=function(d,e,f){for(var g=Array(arguments.length-2),h=2;h<arguments.length;h++)g[h-
2]=arguments[h];return b.prototype[e].apply(d,g)}},sa=function(a){return a};var ta=function(a,b){this.a=a;this.i=b};var va=function(a){return"number"===typeof a&&0<=a&&isFinite(a)&&0===a%1||"string"===typeof a&&"-"!==a[0]&&a===""+parseInt(a,10)},xa=function(){this.B={};this.m=!1;this.F={}};xa.prototype.get=function(a){return this.B["dust."+a]};xa.prototype.set=function(a,b){this.m||(a="dust."+a,this.F.hasOwnProperty(a)||(this.B[a]=b))};xa.prototype.has=function(a){return this.B.hasOwnProperty("dust."+a)};var ya=function(a){var b=[],c;for(c in a.B)a.B.hasOwnProperty(c)&&b.push(c.substr(5));return b};var k=function(a){this.i=new xa;this.a=[];a=a||[];for(var b in a)a.hasOwnProperty(b)&&(va(b)?this.a[Number(b)]=a[Number(b)]:this.i.set(b,a[b]))};ca=k.prototype;ca.toString=function(a){if(a&&0<=a.indexOf(this))return"";for(var b=[],c=0;c<this.a.length;c++){var d=this.a[c];null===d||void 0===d?b.push(""):d instanceof k?(a=a||[],a.push(this),b.push(d.toString(a)),a.pop()):b.push(d.toString())}return b.join(",")};
ca.set=function(a,b){if("length"==a){if(!va(b))throw Error("RangeError: Length property must be a valid integer.");this.a.length=Number(b)}else va(a)?this.a[Number(a)]=b:this.i.set(a,b)};ca.get=function(a){return"length"==a?this.length():va(a)?this.a[Number(a)]:this.i.get(a)};ca.length=function(){return this.a.length};ca.uc=function(){for(var a=ya(this.i),b=0;b<this.a.length;b++)a.push(b+"");return new k(a)};
var za=function(a,b){if(va(b))delete a.a[Number(b)];else{var c=a.i,d;d="dust."+b;c.m||c.F.hasOwnProperty(d)||delete c.B[d]}};ca=k.prototype;ca.pop=function(){return this.a.pop()};ca.push=function(a){return this.a.push.apply(this.a,Array.prototype.slice.call(arguments))};ca.shift=function(){return this.a.shift()};ca.splice=function(a,b,c){return new k(this.a.splice.apply(this.a,arguments))};ca.unshift=function(a){return this.a.unshift.apply(this.a,Array.prototype.slice.call(arguments))};
ca.has=function(a){return va(a)&&this.a.hasOwnProperty(a)||this.i.has(a)};var Aa=function(){function a(f,g){if(b[f]){if(b[f].ic+g>b[f].max)throw Error("Quota exceeded");b[f].ic+=g}}var b={},c=void 0,d=void 0,e={wh:function(f){c=f},Me:function(){c&&a(c,1)},yh:function(f){d=f},Ha:function(f){d&&a(d,f)},Th:function(f,g){b[f]=b[f]||{ic:0};b[f].max=g},Vg:function(f){return b[f]&&b[f].ic||0},reset:function(){b={}},Dg:a};e.onFnConsume=e.wh;e.consumeFn=e.Me;e.onStorageConsume=e.yh;e.consumeStorage=e.Ha;e.setMax=e.Th;e.getConsumed=e.Vg;e.reset=e.reset;e.consume=e.Dg;return e};var Ba=function(a,b){this.F=a;this.P=function(c,d,e){return c.apply(d,e)};this.m=b;this.i=new xa;this.a=this.B=void 0};Ba.prototype.add=function(a,b){Ca(this,a,b,!1)};var Ca=function(a,b,c,d){if(!a.i.m)if(a.F.Ha(("string"===typeof b?b.length:1)+("string"===typeof c?c.length:1)),d){var e=a.i;e.set(b,c);e.F["dust."+b]=!0}else a.i.set(b,c)};
Ba.prototype.set=function(a,b){this.i.m||(!this.i.has(a)&&this.m&&this.m.has(a)?this.m.set(a,b):(this.F.Ha(("string"===typeof a?a.length:1)+("string"===typeof b?b.length:1)),this.i.set(a,b)))};Ba.prototype.get=function(a){return this.i.has(a)?this.i.get(a):this.m?this.m.get(a):void 0};Ba.prototype.has=function(a){return!!this.i.has(a)||!(!this.m||!this.m.has(a))};var Da=function(a){var b=new Ba(a.F,a);a.B&&(b.B=a.B);b.P=a.P;b.a=a.a;return b};var Ea=function(){},Fa=function(a){return"function"==typeof a},p=function(a){return"string"==typeof a},Ga=function(a){return"number"==typeof a&&!isNaN(a)},Ha=function(a){return"[object Array]"==Object.prototype.toString.call(Object(a))},Ia=function(a,b){if(Array.prototype.indexOf){var c=a.indexOf(b);return"number"==typeof c?c:-1}for(var d=0;d<a.length;d++)if(a[d]===b)return d;return-1},Ja=function(a,b){if(a&&Ha(a))for(var c=0;c<a.length;c++)if(a[c]&&b(a[c]))return a[c]},Ka=function(a,b){if(!Ga(a)||
!Ga(b)||a>b)a=0,b=2147483647;return Math.floor(Math.random()*(b-a+1)+a)},Ma=function(a,b){for(var c=new La,d=0;d<a.length;d++)c.set(a[d],!0);for(var e=0;e<b.length;e++)if(c.get(b[e]))return!0;return!1},Na=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b(c,a[c])},Oa=function(a){return!!a&&("[object Arguments]"==Object.prototype.toString.call(a)||Object.prototype.hasOwnProperty.call(a,"callee"))},Pa=function(a){return Math.round(Number(a))||0},Qa=function(a){return"false"==
String(a).toLowerCase()?!1:!!a},Ra=function(a){var b=[];if(Ha(a))for(var c=0;c<a.length;c++)b.push(String(a[c]));return b},Sa=function(a){return a?a.replace(/^\s+|\s+$/g,""):""},Ta=function(){return(new Date).getTime()},La=function(){this.prefix="gtm.";this.values={}};La.prototype.set=function(a,b){this.values[this.prefix+a]=b};La.prototype.get=function(a){return this.values[this.prefix+a]};
var Ua=function(a,b,c){return a&&a.hasOwnProperty(b)?a[b]:c},Va=function(a){var b=!1;return function(){if(!b)try{a()}catch(c){}b=!0}},Xa=function(a,b){for(var c in b)b.hasOwnProperty(c)&&(a[c]=b[c])},Ya=function(a){for(var b in a)if(a.hasOwnProperty(b))return!0;return!1},$a=function(a,b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]),c.push.apply(c,b[a[d]]||[]);return c},ab=function(a){for(var b=B,c=0;c<a.length-1;c++){if(!b.hasOwnProperty(a[c]))return;b=b[a[c]]}return b},bb=function(a,b){for(var c=
{},d=c,e=a.split("."),f=0;f<e.length-1;f++)d=d[e[f]]={};d[e[e.length-1]]=b;return c},cb=function(a){var b=[];Na(a,function(c,d){10>c.length&&d&&b.push(c)});return b.join(",")};var db=function(a,b){xa.call(this);this.a=a;this.P=b};la(db,xa);db.prototype.toString=function(){return this.a};db.prototype.uc=function(){return new k(ya(this))};db.prototype.i=function(a,b){a.F.Me();return this.P.apply(eb(this,a),Array.prototype.slice.call(arguments,1))};var eb=function(a,b){var c=function(d,e){this.i=d;this.m=e};c.prototype.a=function(d){var e=this.m;return Ha(d)?fb(e,d):d};c.prototype.F=function(d){return gb(this.m,d)};c.prototype.B=function(){return b.F};return new c(a,b)};
db.prototype.Ka=function(a,b){try{return this.i.apply(this,Array.prototype.slice.call(arguments,0))}catch(c){}};var gb=function(a,b){for(var c,d=0;d<b.length&&!(c=fb(a,b[d]),c instanceof ta);d++);return c},fb=function(a,b){try{var c=a.get(String(b[0]));if(!(c&&c instanceof db))throw Error("Attempting to execute non-function "+b[0]+".");return c.i.apply(c,[a].concat(b.slice(1)))}catch(e){var d=a.B;d&&d(e,b.context?{id:b[0],line:b.context.line}:null);throw e;}};var ib=function(){xa.call(this)};la(ib,xa);ib.prototype.uc=function(){return new k(ya(this))};/*
 jQuery v1.9.1 (c) 2005, 2012 jQuery Foundation, Inc. jquery.org/license. */
var kb=/\[object (Boolean|Number|String|Function|Array|Date|RegExp)\]/,lb=function(a){if(null==a)return String(a);var b=kb.exec(Object.prototype.toString.call(Object(a)));return b?b[1].toLowerCase():"object"},mb=function(a,b){return Object.prototype.hasOwnProperty.call(Object(a),b)},nb=function(a){if(!a||"object"!=lb(a)||a.nodeType||a==a.window)return!1;try{if(a.constructor&&!mb(a,"constructor")&&!mb(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}for(var b in a);return void 0===
b||mb(a,b)},E=function(a,b){var c=b||("array"==lb(a)?[]:{}),d;for(d in a)if(mb(a,d)){var e=a[d];"array"==lb(e)?("array"!=lb(c[d])&&(c[d]=[]),c[d]=E(e,c[d])):nb(e)?(nb(c[d])||(c[d]={}),c[d]=E(e,c[d])):c[d]=e}return c};var pb=function(a,b,c){var d=[],e=[],f=function(h,l){for(var m=ya(h),n=0;n<m.length;n++)l[m[n]]=g(h.get(m[n]))},g=function(h){var l=Ia(d,h);if(-1<l)return e[l];if(h instanceof k){var m=[];d.push(h);e.push(m);for(var n=h.uc(),r=0;r<n.length();r++)m[n.get(r)]=g(h.get(n.get(r)));return m}if(h instanceof ib){var t={};d.push(h);e.push(t);f(h,t);return t}if(h instanceof db){var q=function(){for(var v=Array.prototype.slice.call(arguments,0),u=0;u<v.length;u++)v[u]=ob(v[u],b);var w=b?b.F:Aa(),y=new Ba(w);
b&&(y.a=b.a);return g(h.i.apply(h,[y].concat(v)))};d.push(h);e.push(q);f(h,q);return q}switch(typeof h){case "boolean":case "number":case "string":case "undefined":return h;case "object":if(null===h)return null;default:if(c)return c(h,b)}};return g(a)},ob=function(a,b,c){var d=[],e=[],f=function(h,l){for(var m in h)h.hasOwnProperty(m)&&l.set(m,g(h[m]))},g=function(h){var l=Ia(d,h);if(-1<l)return e[l];if(Ha(h)||Oa(h)){var m=new k([]);d.push(h);e.push(m);for(var n in h)h.hasOwnProperty(n)&&m.set(n,
g(h[n]));return m}if(nb(h)){var r=new ib;d.push(h);e.push(r);f(h,r);return r}if("function"===typeof h){var t=new db("",function(v){for(var u=Array.prototype.slice.call(arguments,0),w=0;w<u.length;w++)u[w]=pb(this.a(u[w]),b);return g((0,this.m.P)(h,h,u))});d.push(h);e.push(t);f(h,t);return t}var q=typeof h;if(null===h||"string"===q||"number"===q||"boolean"===q)return h;if(void 0!==h&&c)return c(h,b)};return g(a)};var qb={control:function(a,b){return new ta(a,this.a(b))},fn:function(a,b,c){var d=this.m,e=this.a(b);if(!(e instanceof k))throw Error("Error: non-List value given for Fn argument names.");var f=Array.prototype.slice.call(arguments,2);this.B().Ha(a.length+f.length);return new db(a,function(){return function(g){var h=Da(d);void 0===h.a&&(h.a=this.m.a);for(var l=Array.prototype.slice.call(arguments,0),m=0;m<l.length;m++)if(l[m]=this.a(l[m]),l[m]instanceof ta)return l[m];for(var n=e.get("length"),r=
0;r<n;r++)r<l.length?h.add(e.get(r),l[r]):h.add(e.get(r),void 0);h.add("arguments",new k(l));var t=gb(h,f);if(t instanceof ta)return"return"===t.a?t.i:t}}())},list:function(a){var b=this.B();b.Ha(arguments.length);for(var c=new k,d=0;d<arguments.length;d++){var e=this.a(arguments[d]);"string"===typeof e&&b.Ha(e.length?e.length-1:0);c.push(e)}return c},map:function(a){for(var b=this.B(),c=new ib,d=0;d<arguments.length-1;d+=2){var e=this.a(arguments[d])+"",f=this.a(arguments[d+1]),g=e.length;g+="string"===
typeof f?f.length:1;b.Ha(g);c.set(e,f)}return c},undefined:function(){}};var rb=function(){this.m=Aa();this.a=new Ba(this.m)},sb=function(a,b,c){var d=new db(b,c);d.m=!0;a.a.set(b,d)};rb.prototype.oc=function(a,b){var c=Array.prototype.slice.call(arguments,0);return this.i(c)};rb.prototype.i=function(a){for(var b,c=0;c<arguments.length;c++)b=fb(this.a,arguments[c]);return b};rb.prototype.B=function(a,b){var c=Da(this.a);c.a=a;for(var d,e=1;e<arguments.length;e++)d=d=fb(c,arguments[e]);return d};var tb=function(a){if(a instanceof tb)return a;this.oa=a};tb.prototype.toString=function(){return String(this.oa)};var ub=function(a,b){return pb(a,b,function(c){})},vb=function(a,b){var c=void 0;return ob(a,b,c)};var wb=function(a){for(var b=[],c=0;c<a.length();c++)a.has(c)&&(b[c]=a.get(c));return b},xb=function(a){if(void 0==a||Ha(a)||nb(a))return!0;switch(typeof a){case "boolean":case "number":case "string":case "function":return!0}return!1};var yb={supportedMethods:"concat every filter forEach hasOwnProperty indexOf join lastIndexOf map pop push reduce reduceRight reverse shift slice some sort splice unshift toString".split(" "),concat:function(a,b){for(var c=[],d=0;d<this.length();d++)c.push(this.get(d));for(var e=1;e<arguments.length;e++)if(arguments[e]instanceof k)for(var f=arguments[e],g=0;g<f.length();g++)c.push(f.get(g));else c.push(arguments[e]);return new k(c)},every:function(a,b){for(var c=this.length(),d=0;d<this.length()&&
d<c;d++)if(this.has(d)&&!b.i(a,this.get(d),d,this))return!1;return!0},filter:function(a,b){for(var c=this.length(),d=[],e=0;e<this.length()&&e<c;e++)this.has(e)&&b.i(a,this.get(e),e,this)&&d.push(this.get(e));return new k(d)},forEach:function(a,b){for(var c=this.length(),d=0;d<this.length()&&d<c;d++)this.has(d)&&b.i(a,this.get(d),d,this)},hasOwnProperty:function(a,b){return this.has(b)},indexOf:function(a,b,c){var d=this.length(),e=void 0===c?0:Number(c);0>e&&(e=Math.max(d+e,0));for(var f=e;f<d;f++)if(this.has(f)&&
this.get(f)===b)return f;return-1},join:function(a,b){for(var c=[],d=0;d<this.length();d++)c.push(this.get(d));return c.join(b)},lastIndexOf:function(a,b,c){var d=this.length(),e=d-1;void 0!==c&&(e=0>c?d+c:Math.min(c,e));for(var f=e;0<=f;f--)if(this.has(f)&&this.get(f)===b)return f;return-1},map:function(a,b){for(var c=this.length(),d=[],e=0;e<this.length()&&e<c;e++)this.has(e)&&(d[e]=b.i(a,this.get(e),e,this));return new k(d)},pop:function(){return this.pop()},push:function(a,b){return this.push.apply(this,
Array.prototype.slice.call(arguments,1))},reduce:function(a,b,c){var d=this.length(),e,f=0;if(void 0!==c)e=c;else{if(0==d)throw Error("TypeError: Reduce on List with no elements.");for(var g=0;g<d;g++)if(this.has(g)){e=this.get(g);f=g+1;break}if(g==d)throw Error("TypeError: Reduce on List with no elements.");}for(var h=f;h<d;h++)this.has(h)&&(e=b.i(a,e,this.get(h),h,this));return e},reduceRight:function(a,b,c){var d=this.length(),e,f=d-1;if(void 0!==c)e=c;else{if(0==d)throw Error("TypeError: ReduceRight on List with no elements.");
for(var g=1;g<=d;g++)if(this.has(d-g)){e=this.get(d-g);f=d-(g+1);break}if(g>d)throw Error("TypeError: ReduceRight on List with no elements.");}for(var h=f;0<=h;h--)this.has(h)&&(e=b.i(a,e,this.get(h),h,this));return e},reverse:function(){for(var a=wb(this),b=a.length-1,c=0;0<=b;b--,c++)a.hasOwnProperty(b)?this.set(c,a[b]):za(this,c);return this},shift:function(){return this.shift()},slice:function(a,b,c){var d=this.length();void 0===b&&(b=0);b=0>b?Math.max(d+b,0):Math.min(b,d);c=void 0===c?d:0>c?
Math.max(d+c,0):Math.min(c,d);c=Math.max(b,c);for(var e=[],f=b;f<c;f++)e.push(this.get(f));return new k(e)},some:function(a,b){for(var c=this.length(),d=0;d<this.length()&&d<c;d++)if(this.has(d)&&b.i(a,this.get(d),d,this))return!0;return!1},sort:function(a,b){var c=wb(this);void 0===b?c.sort():c.sort(function(e,f){return Number(b.i(a,e,f))});for(var d=0;d<c.length;d++)c.hasOwnProperty(d)?this.set(d,c[d]):za(this,d)},splice:function(a,b,c,d){return this.splice.apply(this,Array.prototype.splice.call(arguments,
1,arguments.length-1))},toString:function(){return this.toString()},unshift:function(a,b){return this.unshift.apply(this,Array.prototype.slice.call(arguments,1))}};var zb="charAt concat indexOf lastIndexOf match replace search slice split substring toLowerCase toLocaleLowerCase toString toUpperCase toLocaleUpperCase trim".split(" "),Ab=new ta("break"),Bb=new ta("continue"),Cb=function(a,b){return this.a(a)+this.a(b)},Hb=function(a,b){return this.a(a)&&this.a(b)},Ib=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);if(!(c instanceof k))throw Error("Error: Non-List argument given to Apply instruction.");if(null===a||void 0===a)throw Error("TypeError: Can't read property "+
b+" of "+a+".");if("boolean"==typeof a||"number"==typeof a){if("toString"==b)return a.toString();throw Error("TypeError: "+a+"."+b+" is not a function.");}if("string"==typeof a){if(0<=Ia(zb,b))return vb(a[b].apply(a,wb(c)),this.m);throw Error("TypeError: "+b+" is not a function");}if(a instanceof k){if(a.has(b)){var d=a.get(b);if(d instanceof db){var e=wb(c);e.unshift(this.m);return d.i.apply(d,e)}throw Error("TypeError: "+b+" is not a function");}if(0<=Ia(yb.supportedMethods,b)){var f=wb(c);f.unshift(this.m);
return yb[b].apply(a,f)}}if(a instanceof db||a instanceof ib){if(a.has(b)){var g=a.get(b);if(g instanceof db){var h=wb(c);h.unshift(this.m);return g.i.apply(g,h)}throw Error("TypeError: "+b+" is not a function");}if("toString"==b)return a instanceof db?a.a:a.toString();if("hasOwnProperty"==b)return a.has.apply(a,wb(c))}if(a instanceof tb&&"toString"===b)return a.toString();throw Error("TypeError: Object has no '"+b+"' property.");},Jb=function(a,b){a=this.a(a);if("string"!=typeof a)throw Error("Invalid key name given for assignment.");
var c=this.m;if(!c.has(a))throw Error("Attempting to assign to undefined value "+b);var d=this.a(b);c.set(a,d);return d},Kb=function(a){var b=Da(this.m),c=gb(b,Array.prototype.slice.apply(arguments));if(c instanceof ta)return c},Lb=function(){return Ab},Mb=function(a){for(var b=this.a(a),c=0;c<b.length;c++){var d=this.a(b[c]);if(d instanceof ta)return d}},Nb=function(a){for(var b=this.m,c=0;c<arguments.length-1;c+=2){var d=arguments[c];if("string"===typeof d){var e=this.a(arguments[c+1]);Ca(b,d,e,
!0)}}},Ob=function(){return Bb},Pb=function(a,b,c){var d=new k;b=this.a(b);for(var e=0;e<b.length;e++)d.push(b[e]);var f=[51,a,d].concat(Array.prototype.splice.call(arguments,2,arguments.length-2));this.m.add(a,this.a(f))},Qb=function(a,b){return this.a(a)/this.a(b)},Rb=function(a,b){a=this.a(a);b=this.a(b);var c=a instanceof tb,d=b instanceof tb;return c||d?c&&d?a.oa==b.oa:!1:a==b},Sb=function(a){for(var b,c=0;c<arguments.length;c++)b=this.a(arguments[c]);return b};
function Tb(a,b,c){if("string"==typeof b)for(var d=0;d<b.length;d++){var e=a(d),f=gb(e,c);if(f instanceof ta){if("break"==f.a)break;if("return"==f.a)return f}}else if(b instanceof ib||b instanceof k||b instanceof db)for(var g=b.uc(),h=g.length(),l=0;l<h;l++){var m=a(g.get(l)),n=gb(m,c);if(n instanceof ta){if("break"==n.a)break;if("return"==n.a)return n}}}
var Ub=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Tb(function(e){d.set(a,e);return d},b,c)},Wb=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Tb(function(e){var f=Da(d);Ca(f,a,e,!0);return f},b,c)},Xb=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);var d=this.m;return Tb(function(e){var f=Da(d);f.add(a,e);return f},b,c)},Yb=function(a,b,c,d){function e(n,r){for(var t=0;t<f.length();t++){var q=f.get(t);r.add(q,n.get(q))}}var f=this.a(a);if(!(f instanceof
k))throw Error("TypeError: Non-List argument given to ForLet instruction.");var g=this.m;d=this.a(d);var h=Da(g);for(e(g,h);fb(h,b);){var l=gb(h,d);if(l instanceof ta){if("break"===l.a)break;if("return"===l.a)return l}var m=Da(g);e(h,m);fb(m,c);h=m}},Zb=function(a){return this.m.get(this.a(a))},$b=function(a,b){var c;a=this.a(a);b=this.a(b);if(void 0===a||null===a)throw Error("TypeError: cannot access property of "+a+".");if(a instanceof ib||a instanceof k||a instanceof db)c=a.get(b);else if("string"==
typeof a)"length"==b?c=a.length:va(b)&&(c=a[b]);else if(a instanceof tb)return;return c},ac=function(a,b){return this.a(a)>this.a(b)},bc=function(a,b){return this.a(a)>=this.a(b)},cc=function(a,b){a=this.a(a);b=this.a(b);a instanceof tb&&(a=a.oa);b instanceof tb&&(b=b.oa);return a===b},ec=function(a,b){return!cc.call(this,a,b)},fc=function(a,b,c){var d=[];this.a(a)?d=this.a(b):c&&(d=this.a(c));var e=this.F(d);if(e instanceof ta)return e},gc=function(a,b){return this.a(a)<this.a(b)},hc=function(a,
b){return this.a(a)<=this.a(b)},ic=function(a,b){return this.a(a)%this.a(b)},jc=function(a,b){return this.a(a)*this.a(b)},kc=function(a){return-this.a(a)},lc=function(a){return!this.a(a)},mc=function(a,b){return!Rb.call(this,a,b)},nc=function(){return null},oc=function(a,b){return this.a(a)||this.a(b)},pc=function(a,b){var c=this.a(a);this.a(b);return c},qc=function(a){return this.a(a)},rc=function(a){return Array.prototype.slice.apply(arguments)},sc=function(a){return new ta("return",this.a(a))},
tc=function(a,b,c){a=this.a(a);b=this.a(b);c=this.a(c);if(null===a||void 0===a)throw Error("TypeError: Can't set property "+b+" of "+a+".");(a instanceof db||a instanceof k||a instanceof ib)&&a.set(b,c);return c},uc=function(a,b){return this.a(a)-this.a(b)},vc=function(a,b,c){a=this.a(a);var d=this.a(b),e=this.a(c);if(!Ha(d)||!Ha(e))throw Error("Error: Malformed switch instruction.");for(var f,g=!1,h=0;h<d.length;h++)if(g||a===this.a(d[h]))if(f=this.a(e[h]),f instanceof ta){var l=f.a;if("break"==
l)return;if("return"==l||"continue"==l)return f}else g=!0;if(e.length==d.length+1&&(f=this.a(e[e.length-1]),f instanceof ta&&("return"==f.a||"continue"==f.a)))return f},wc=function(a,b,c){return this.a(a)?this.a(b):this.a(c)},xc=function(a){a=this.a(a);return a instanceof db?"function":typeof a},yc=function(a){for(var b=this.m,c=0;c<arguments.length;c++){var d=arguments[c];"string"!=typeof d||b.add(d,void 0)}},zc=function(a,b,c,d){var e,f=this.a(d);if(this.a(c)&&(e=this.F(f),e instanceof ta)){if("break"==
e.a)return;if("return"==e.a)return e}for(;this.a(a);){e=this.F(f);if(e instanceof ta){if("break"==e.a)break;if("return"==e.a)return e}this.a(b)}},Ac=function(a){return~Number(this.a(a))},Bc=function(a,b){return Number(this.a(a))<<Number(this.a(b))},Cc=function(a,b){return Number(this.a(a))>>Number(this.a(b))},Dc=function(a,b){return Number(this.a(a))>>>Number(this.a(b))},Ec=function(a,b){return Number(this.a(a))&Number(this.a(b))},Fc=function(a,b){return Number(this.a(a))^Number(this.a(b))},Gc=function(a,
b){return Number(this.a(a))|Number(this.a(b))};var Ic=function(){this.a=new rb;Hc(this)};Ic.prototype.oc=function(a){return Jc(this.a.i(a))};
var Lc=function(a,b){return Jc(Kc.a.B(a,b))},Hc=function(a){var b=function(d,e){var f=a.a,g=String(e);qb.hasOwnProperty(d)&&sb(f,g||d,qb[d])};b("control",49);b("fn",51);b("list",7);b("map",8);b("undefined",44);var c=function(d,e){sb(a.a,String(d),e)};c(0,Cb);c(1,Hb);c(2,Ib);c(3,Jb);c(53,Kb);c(4,Lb);c(5,Mb);c(52,Nb);c(6,Ob);c(9,Mb);c(50,Pb);c(10,Qb);c(12,Rb);c(13,Sb);c(47,Ub);c(54,Wb);c(55,Xb);c(63,Yb);c(15,Zb);c(16,$b);c(17,$b);c(18,ac);c(19,bc);c(20,cc);c(21,ec);c(22,fc);c(23,gc);c(24,hc);c(25,ic);
c(26,jc);c(27,kc);c(28,lc);c(29,mc);c(45,nc);c(30,oc);c(32,pc);c(33,pc);c(34,qc);c(35,qc);c(46,rc);c(36,sc);c(43,tc);c(37,uc);c(38,vc);c(39,wc);c(40,xc);c(41,yc);c(42,zc);c(58,Ac);c(57,Bc);c(60,Cc);c(61,Dc);c(56,Ec);c(62,Fc);c(59,Gc)},Nc=function(){var a=Kc,b=Mc();sb(a.a,"require",b)},Oc=function(a,b){a.a.a.P=b};function Jc(a){if(a instanceof ta||a instanceof db||a instanceof k||a instanceof ib||null===a||void 0===a||"string"===typeof a||"number"===typeof a||"boolean"===typeof a)return a};
var Pc=[],Qc={"\x00":"&#0;",'"':"&quot;","&":"&amp;","'":"&#39;","<":"&lt;",">":"&gt;","\t":"&#9;","\n":"&#10;","\x0B":"&#11;","\f":"&#12;","\r":"&#13;"," ":"&#32;","-":"&#45;","/":"&#47;","=":"&#61;","`":"&#96;","\u0085":"&#133;","\u00a0":"&#160;","\u2028":"&#8232;","\u2029":"&#8233;"},Rc=function(a){return Qc[a]},Sc=/[\x00\x22\x26\x27\x3c\x3e]/g;var Wc=/[\x00\x08-\x0d\x22\x26\x27\/\x3c-\x3e\\\x85\u2028\u2029]/g,Xc={"\x00":"\\x00","\b":"\\x08","\t":"\\t","\n":"\\n","\x0B":"\\x0b",
"\f":"\\f","\r":"\\r",'"':"\\x22","&":"\\x26","'":"\\x27","/":"\\/","<":"\\x3c","=":"\\x3d",">":"\\x3e","\\":"\\\\","\u0085":"\\x85","\u2028":"\\u2028","\u2029":"\\u2029",$:"\\x24","(":"\\x28",")":"\\x29","*":"\\x2a","+":"\\x2b",",":"\\x2c","-":"\\x2d",".":"\\x2e",":":"\\x3a","?":"\\x3f","[":"\\x5b","]":"\\x5d","^":"\\x5e","{":"\\x7b","|":"\\x7c","}":"\\x7d"},Yc=function(a){return Xc[a]};
Pc[8]=function(a){if(null==a)return" null ";switch(typeof a){case "boolean":case "number":return" "+a+" ";default:return"'"+String(String(a)).replace(Wc,Yc)+"'"}};var fd=/[\x00- \x22\x27-\x29\x3c\x3e\\\x7b\x7d\x7f\x85\xa0\u2028\u2029\uff01\uff03\uff04\uff06-\uff0c\uff0f\uff1a\uff1b\uff1d\uff1f\uff20\uff3b\uff3d]/g,gd={"\x00":"%00","\u0001":"%01","\u0002":"%02","\u0003":"%03","\u0004":"%04","\u0005":"%05","\u0006":"%06","\u0007":"%07","\b":"%08","\t":"%09","\n":"%0A","\x0B":"%0B","\f":"%0C","\r":"%0D","\u000e":"%0E","\u000f":"%0F","\u0010":"%10",
"\u0011":"%11","\u0012":"%12","\u0013":"%13","\u0014":"%14","\u0015":"%15","\u0016":"%16","\u0017":"%17","\u0018":"%18","\u0019":"%19","\u001a":"%1A","\u001b":"%1B","\u001c":"%1C","\u001d":"%1D","\u001e":"%1E","\u001f":"%1F"," ":"%20",'"':"%22","'":"%27","(":"%28",")":"%29","<":"%3C",">":"%3E","\\":"%5C","{":"%7B","}":"%7D","\u007f":"%7F","\u0085":"%C2%85","\u00a0":"%C2%A0","\u2028":"%E2%80%A8","\u2029":"%E2%80%A9","\uff01":"%EF%BC%81","\uff03":"%EF%BC%83","\uff04":"%EF%BC%84","\uff06":"%EF%BC%86",
"\uff07":"%EF%BC%87","\uff08":"%EF%BC%88","\uff09":"%EF%BC%89","\uff0a":"%EF%BC%8A","\uff0b":"%EF%BC%8B","\uff0c":"%EF%BC%8C","\uff0f":"%EF%BC%8F","\uff1a":"%EF%BC%9A","\uff1b":"%EF%BC%9B","\uff1d":"%EF%BC%9D","\uff1f":"%EF%BC%9F","\uff20":"%EF%BC%A0","\uff3b":"%EF%BC%BB","\uff3d":"%EF%BC%BD"},jd=function(a){return gd[a]};Pc[16]=function(a){return a};var ld;
var md=[],nd=[],od=[],pd=[],qd=[],rd={},sd,td,ud,vd=function(a,b){var c={};c["function"]="__"+a;for(var d in b)b.hasOwnProperty(d)&&(c["vtp_"+d]=b[d]);return c},wd=function(a,b){var c=a["function"];if(!c)throw Error("Error: No function name given for function call.");var d=rd[c],e={},f;for(f in a)a.hasOwnProperty(f)&&0===f.indexOf("vtp_")&&(d&&b&&b.Je&&b.Je(a[f]),e[void 0!==d?f:f.substr(4)]=a[f]);return void 0!==d?d(e):ld(c,e,b)},yd=function(a,b,c){c=c||[];var d={},e;for(e in a)a.hasOwnProperty(e)&&
(d[e]=xd(a[e],b,c));return d},zd=function(a){var b=a["function"];if(!b)throw"Error: No function name given for function call.";var c=rd[b];return c?c.priorityOverride||0:0},xd=function(a,b,c){if(Ha(a)){var d;switch(a[0]){case "function_id":return a[1];case "list":d=[];for(var e=1;e<a.length;e++)d.push(xd(a[e],b,c));return d;case "macro":var f=a[1];if(c[f])return;var g=md[f];if(!g||b.qd(g))return;c[f]=!0;try{var h=yd(g,b,c);h.vtp_gtmEventId=b.id;d=wd(h,b);ud&&(d=ud.Fg(d,h))}catch(y){b.We&&b.We(y,Number(f)),
d=!1}c[f]=!1;return d;case "map":d={};for(var l=1;l<a.length;l+=2)d[xd(a[l],b,c)]=xd(a[l+1],b,c);return d;case "template":d=[];for(var m=!1,n=1;n<a.length;n++){var r=xd(a[n],b,c);td&&(m=m||r===td.Zb);d.push(r)}return td&&m?td.Ig(d):d.join("");case "escape":d=xd(a[1],b,c);if(td&&Ha(a[1])&&"macro"===a[1][0]&&td.ih(a))return td.Dh(d);d=String(d);for(var t=2;t<a.length;t++)Pc[a[t]]&&(d=Pc[a[t]](d));return d;case "tag":var q=a[1];if(!pd[q])throw Error("Unable to resolve tag reference "+q+".");return d=
{Pe:a[2],index:q};case "zb":var v={arg0:a[2],arg1:a[3],ignore_case:a[5]};v["function"]=a[1];var u=Ad(v,b,c),w=!!a[4];return w||2!==u?w!==(1===u):null;default:throw Error("Attempting to expand unknown Value type: "+a[0]+".");}}return a},Ad=function(a,b,c){try{return sd(yd(a,b,c))}catch(d){JSON.stringify(a)}return 2};var Bd=function(){var a=function(b){return{toString:function(){return b}}};return{kf:a("consent"),Pd:a("convert_case_to"),Qd:a("convert_false_to"),Rd:a("convert_null_to"),Sd:a("convert_true_to"),Td:a("convert_undefined_to"),fi:a("debug_mode_metadata"),Ga:a("function"),Wf:a("instance_name"),Yf:a("live_only"),Zf:a("malware_disabled"),$f:a("metadata"),ii:a("original_vendor_template_id"),bg:a("once_per_event"),ze:a("once_per_load"),De:a("setup_tags"),Ee:a("tag_id"),Fe:a("teardown_tags")}}();var Cd=function(a,b,c){var d;d=Error.call(this);this.message=d.message;"stack"in d&&(this.stack=d.stack);this.i=a;this.a=c};la(Cd,Error);function Dd(a,b){if(Ha(a)){Object.defineProperty(a,"context",{value:{line:b[0]}});for(var c=1;c<a.length;c++)Dd(a[c],b[c])}};var Ed=function(a,b){var c;c=Error.call(this);this.message=c.message;"stack"in c&&(this.stack=c.stack);this.m=a;this.i=b;this.a=[]};la(Ed,Error);var Fd=function(a){var b=a.a.slice();a.i&&(b=a.i(b));return b};var Hd=function(){return function(a,b){a instanceof Ed||(a=new Ed(a,Gd));b&&a.a.push(b);throw a;}};function Gd(a){if(!a.length)return a;a.push({id:"main",line:0});for(var b=a.length-1;0<b;b--)Ga(a[b].id)&&a.splice(b++,1);for(var c=a.length-1;0<c;c--)a[c].line=a[c-1].line;a.splice(0,1);return a};var Id=null,Ld=function(a){function b(r){for(var t=0;t<r.length;t++)d[r[t]]=!0}var c=[],d=[];Id=Jd(a);for(var e=0;e<nd.length;e++){var f=nd[e],g=Kd(f);if(g){for(var h=f.add||[],l=0;l<h.length;l++)c[h[l]]=!0;b(f.block||[])}else null===g&&b(f.block||[])}for(var m=[],n=0;n<pd.length;n++)c[n]&&!d[n]&&(m[n]=!0);return m},Kd=function(a){for(var b=a["if"]||[],c=0;c<b.length;c++){var d=Id(b[c]);if(0===d)return!1;if(2===d)return null}for(var e=a.unless||[],f=0;f<e.length;f++){var g=Id(e[f]);if(2===g)return null;
if(1===g)return!1}return!0},Jd=function(a){var b=[];return function(c){void 0===b[c]&&(b[c]=Ad(od[c],a));return b[c]}};var Md={Fg:function(a,b){b[Bd.Pd]&&"string"===typeof a&&(a=1==b[Bd.Pd]?a.toLowerCase():a.toUpperCase());b.hasOwnProperty(Bd.Rd)&&null===a&&(a=b[Bd.Rd]);b.hasOwnProperty(Bd.Td)&&void 0===a&&(a=b[Bd.Td]);b.hasOwnProperty(Bd.Sd)&&!0===a&&(a=b[Bd.Sd]);b.hasOwnProperty(Bd.Qd)&&!1===a&&(a=b[Bd.Qd]);return a}};var Nd=function(){this.a={}};function Od(a,b,c,d){if(a)for(var e=0;e<a.length;e++){var f=void 0,g="A policy function denied the permission request";try{f=a[e].call(void 0,b,c,d),g+="."}catch(h){g="string"===typeof h?g+(": "+h):h instanceof Error?g+(": "+h.message):g+"."}if(!f)throw new Cd(c,d,g);}}function Pd(a,b,c){return function(){var d=arguments[0];if(d){var e=a.a[d],f=a.a.all;if(e||f){var g=c.apply(void 0,Array.prototype.slice.call(arguments,0));Od(e,b,d,g);Od(f,b,d,g)}}}};var Td=function(a){var b=Qd.C,c=this;this.i=new Nd;this.a={};var d={},e=Pd(this.i,b,function(){var f=arguments[0];return f&&d[f]?d[f].apply(void 0,Array.prototype.slice.call(arguments,0)):{}});Na(a,function(f,g){var h={};Na(g,function(l,m){var n=Rd(l,m);h[l]=n.assert;d[l]||(d[l]=n.K)});c.a[f]=function(l,m){var n=h[l];if(!n)throw Sd(l,{},"The requested permission "+l+" is not configured.");var r=Array.prototype.slice.call(arguments,0);n.apply(void 0,r);e.apply(void 0,r)}})},Vd=function(a){return Ud.a[a]||
function(){}};function Rd(a,b){var c=vd(a,b);c.vtp_permissionName=a;c.vtp_createPermissionError=Sd;try{return wd(c)}catch(d){return{assert:function(e){throw new Cd(e,{},"Permission "+e+" is unknown.");},K:function(){for(var e={},f=0;f<arguments.length;++f)e["arg"+(f+1)]=arguments[f];return e}}}}function Sd(a,b,c){return new Cd(a,b,c)};var Wd=!1;var Xd={};Xd.ai=Qa('');Xd.Og=Qa('');var Yd=Wd,Zd=Xd.Og,$d=Xd.ai;
var oe=function(a,b){return a.length&&b.length&&a.lastIndexOf(b)===a.length-b.length},pe=function(a,b){var c="*"===b.charAt(b.length-1)||"/"===b||"/*"===b;oe(b,"/*")&&(b=b.slice(0,-2));oe(b,"?")&&(b=b.slice(0,-1));var d=b.split("*");if(!c&&1===d.length)return a===d[0];for(var e=-1,f=0;f<d.length;f++){var g=d[f];if(g){e=a.indexOf(g,e);if(-1===e||0===f&&0!==e)return!1;e+=g.length}}if(c||e===a.length)return!0;var h=d[d.length-1];return a.lastIndexOf(h)===a.length-h.length},qe=/^[a-z0-9-]+$/i,re=/^https:\/\/(\*\.|)((?:[a-z0-9-]+\.)+[a-z0-9-]+)\/(.*)$/i,
te=function(a,b){var c;if(!(c=!se(a))){var d;a:{var e=a.hostname.split(".");if(2>e.length)d=!1;else{for(var f=0;f<e.length;f++)if(!qe.exec(e[f])){d=!1;break a}d=!0}}c=!d}if(c)return!1;for(var g=0;g<b.length;g++){var h;var l=a,m=b[g];if(!re.exec(m))throw Error("Invalid Wildcard");var n=m.slice(8),r=n.slice(0,n.indexOf("/")),t;var q=l.hostname,v=r;if(0!==v.indexOf("*."))t=q.toLowerCase()===v.toLowerCase();else{v=v.slice(2);var u=q.toLowerCase().indexOf(v.toLowerCase());t=-1===u?!1:q.length===v.length?
!0:q.length!==v.length+u?!1:"."===q[u-1]}if(t){var w=n.slice(n.indexOf("/"));h=pe(l.pathname+l.search,w)?!0:!1}else h=!1;if(h)return!0}return!1},se=function(a){return"https:"===a.protocol&&(!a.port||"443"===a.port)};/*
 Copyright (c) 2014 Derek Brans, MIT license https://github.com/krux/postscribe/blob/master/LICENSE. Portions derived from simplehtmlparser, which is licensed under the Apache License, Version 2.0 */

var ue,ve=function(){};(function(){function a(h,l){h=h||"";l=l||{};for(var m in b)b.hasOwnProperty(m)&&(l.rg&&(l["fix_"+m]=!0),l.Re=l.Re||l["fix_"+m]);var n={comment:/^\x3c!--/,endTag:/^<\//,atomicTag:/^<\s*(script|style|noscript|iframe|textarea)[\s\/>]/i,startTag:/^</,chars:/^[^<]/},r={comment:function(){var q=h.indexOf("--\x3e");if(0<=q)return{content:h.substr(4,q),length:q+3}},endTag:function(){var q=h.match(d);if(q)return{tagName:q[1],length:q[0].length}},atomicTag:function(){var q=r.startTag();
if(q){var v=h.slice(q.length);if(v.match(new RegExp("</\\s*"+q.tagName+"\\s*>","i"))){var u=v.match(new RegExp("([\\s\\S]*?)</\\s*"+q.tagName+"\\s*>","i"));if(u)return{tagName:q.tagName,Y:q.Y,content:u[1],length:u[0].length+q.length}}}},startTag:function(){var q=h.match(c);if(q){var v={};q[2].replace(e,function(u,w,y,x,C){var A=y||x||C||f.test(w)&&w||null,z=document.createElement("div");z.innerHTML=A;v[w]=z.textContent||z.innerText||A});return{tagName:q[1],Y:v,Gc:!!q[3],length:q[0].length}}},chars:function(){var q=
h.indexOf("<");return{length:0<=q?q:h.length}}},t=function(){for(var q in n)if(n[q].test(h)){var v=r[q]();return v?(v.type=v.type||q,v.text=h.substr(0,v.length),h=h.slice(v.length),v):null}};l.Re&&function(){var q=/^(AREA|BASE|BASEFONT|BR|COL|FRAME|HR|IMG|INPUT|ISINDEX|LINK|META|PARAM|EMBED)$/i,v=/^(COLGROUP|DD|DT|LI|OPTIONS|P|TD|TFOOT|TH|THEAD|TR)$/i,u=[];u.Ve=function(){return this[this.length-1]};u.sd=function(z){var D=this.Ve();return D&&D.tagName&&D.tagName.toUpperCase()===z.toUpperCase()};u.Eg=
function(z){for(var D=0,G;G=this[D];D++)if(G.tagName===z)return!0;return!1};var w=function(z){z&&"startTag"===z.type&&(z.Gc=q.test(z.tagName)||z.Gc);return z},y=t,x=function(){h="</"+u.pop().tagName+">"+h},C={startTag:function(z){var D=z.tagName;"TR"===D.toUpperCase()&&u.sd("TABLE")?(h="<TBODY>"+h,A()):l.vi&&v.test(D)&&u.Eg(D)?u.sd(D)?x():(h="</"+z.tagName+">"+h,A()):z.Gc||u.push(z)},endTag:function(z){u.Ve()?l.Qg&&!u.sd(z.tagName)?x():u.pop():l.Qg&&(y(),A())}},A=function(){var z=h,D=w(y());h=z;if(D&&
C[D.type])C[D.type](D)};t=function(){A();return w(y())}}();return{append:function(q){h+=q},Jh:t,Ai:function(q){for(var v;(v=t())&&(!q[v.type]||!1!==q[v.type](v)););},clear:function(){var q=h;h="";return q},Bi:function(){return h},stack:[]}}var b=function(){var h={},l=this.document.createElement("div");l.innerHTML="<P><I></P></I>";h.Di="<P><I></P></I>"!==l.innerHTML;l.innerHTML="<P><i><P></P></i></P>";h.Ci=2===l.childNodes.length;return h}(),c=/^<([\-A-Za-z0-9_]+)((?:\s+[\w\-]+(?:\s*=?\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/,
d=/^<\/([\-A-Za-z0-9_]+)[^>]*>/,e=/([\-A-Za-z0-9_]+)(?:\s*=\s*(?:(?:"((?:\\.|[^"])*)")|(?:'((?:\\.|[^'])*)')|([^>\s]+)))?/g,f=/^(checked|compact|declare|defer|disabled|ismap|multiple|nohref|noresize|noshade|nowrap|readonly|selected)$/i;a.supports=b;for(var g in b);ue=a})();(function(){function a(){}function b(r){return void 0!==r&&null!==r}function c(r,t,q){var v,u=r&&r.length||0;for(v=0;v<u;v++)t.call(q,r[v],v)}function d(r,t,q){for(var v in r)r.hasOwnProperty(v)&&t.call(q,v,r[v])}function e(r,t){d(t,
function(q,v){r[q]=v});return r}function f(r,t){r=r||{};d(t,function(q,v){b(r[q])||(r[q]=v)});return r}function g(r){try{return m.call(r)}catch(q){var t=[];c(r,function(v){t.push(v)});return t}}var h={ig:a,jg:a,kg:a,lg:a,sg:a,ug:function(r){return r},done:a,error:function(r){throw r;},Mh:!1},l=this;if(!l.postscribe){var m=Array.prototype.slice,n=function(){function r(q,v,u){var w="data-ps-"+v;if(2===arguments.length){var y=q.getAttribute(w);return b(y)?String(y):y}b(u)&&""!==u?q.setAttribute(w,u):
q.removeAttribute(w)}function t(q,v){var u=q.ownerDocument;e(this,{root:q,options:v,Kb:u.defaultView||u.parentWindow,Ua:u,xc:ue("",{rg:!0}),cd:[q],Cd:"",Dd:u.createElement(q.nodeName),Hb:[],Na:[]});r(this.Dd,"proxyof",0)}t.prototype.write=function(){[].push.apply(this.Na,arguments);for(var q;!this.kc&&this.Na.length;)q=this.Na.shift(),"function"===typeof q?this.zg(q):this.Md(q)};t.prototype.zg=function(q){var v={type:"function",value:q.name||q.toString()};this.yd(v);q.call(this.Kb,this.Ua);this.Xe(v)};
t.prototype.Md=function(q){this.xc.append(q);for(var v,u=[],w,y;(v=this.xc.Jh())&&!(w=v&&"tagName"in v?!!~v.tagName.toLowerCase().indexOf("script"):!1)&&!(y=v&&"tagName"in v?!!~v.tagName.toLowerCase().indexOf("style"):!1);)u.push(v);this.di(u);w&&this.ah(v);y&&this.bh(v)};t.prototype.di=function(q){var v=this.wg(q);v.He&&(v.od=this.Cd+v.He,this.Cd+=v.Hh,this.Dd.innerHTML=v.od,this.bi())};t.prototype.wg=function(q){var v=this.cd.length,u=[],w=[],y=[];c(q,function(x){u.push(x.text);if(x.Y){if(!/^noscript$/i.test(x.tagName)){var C=
v++;w.push(x.text.replace(/(\/?>)/," data-ps-id="+C+" $1"));"ps-script"!==x.Y.id&&"ps-style"!==x.Y.id&&y.push("atomicTag"===x.type?"":"<"+x.tagName+" data-ps-proxyof="+C+(x.Gc?" />":">"))}}else w.push(x.text),y.push("endTag"===x.type?x.text:"")});return{Ei:q,raw:u.join(""),He:w.join(""),Hh:y.join("")}};t.prototype.bi=function(){for(var q,v=[this.Dd];b(q=v.shift());){var u=1===q.nodeType;if(!u||!r(q,"proxyof")){u&&(this.cd[r(q,"id")]=q,r(q,"id",null));var w=q.parentNode&&r(q.parentNode,"proxyof");
w&&this.cd[w].appendChild(q)}v.unshift.apply(v,g(q.childNodes))}};t.prototype.ah=function(q){var v=this.xc.clear();v&&this.Na.unshift(v);q.src=q.Y.src||q.Y.ki;q.src&&this.Hb.length?this.kc=q:this.yd(q);var u=this;this.ci(q,function(){u.Xe(q)})};t.prototype.bh=function(q){var v=this.xc.clear();v&&this.Na.unshift(v);q.type=q.Y.type||q.Y.TYPE||"text/css";this.ei(q);v&&this.write()};t.prototype.ei=function(q){var v=this.yg(q);this.fh(v);q.content&&(v.styleSheet&&!v.sheet?v.styleSheet.cssText=q.content:
v.appendChild(this.Ua.createTextNode(q.content)))};t.prototype.yg=function(q){var v=this.Ua.createElement(q.tagName);v.setAttribute("type",q.type);d(q.Y,function(u,w){v.setAttribute(u,w)});return v};t.prototype.fh=function(q){this.Md('<span id="ps-style"/>');var v=this.Ua.getElementById("ps-style");v.parentNode.replaceChild(q,v)};t.prototype.yd=function(q){q.zh=this.Na;this.Na=[];this.Hb.unshift(q)};t.prototype.Xe=function(q){q!==this.Hb[0]?this.options.error({message:"Bad script nesting or script finished twice"}):
(this.Hb.shift(),this.write.apply(this,q.zh),!this.Hb.length&&this.kc&&(this.yd(this.kc),this.kc=null))};t.prototype.ci=function(q,v){var u=this.xg(q),w=this.Vh(u),y=this.options.ig;q.src&&(u.src=q.src,this.Qh(u,w?y:function(){v();y()}));try{this.eh(u),q.src&&!w||v()}catch(x){this.options.error(x),v()}};t.prototype.xg=function(q){var v=this.Ua.createElement(q.tagName);d(q.Y,function(u,w){v.setAttribute(u,w)});q.content&&(v.text=q.content);return v};t.prototype.eh=function(q){this.Md('<span id="ps-script"/>');
var v=this.Ua.getElementById("ps-script");v.parentNode.replaceChild(q,v)};t.prototype.Qh=function(q,v){function u(){q=q.onload=q.onreadystatechange=q.onerror=null}var w=this.options.error;e(q,{onload:function(){u();v()},onreadystatechange:function(){/^(loaded|complete)$/.test(q.readyState)&&(u(),v())},onerror:function(){var y={message:"remote script failed "+q.src};u();w(y);v()}})};t.prototype.Vh=function(q){return!/^script$/i.test(q.nodeName)||!!(this.options.Mh&&q.src&&q.hasAttribute("async"))};
return t}();l.postscribe=function(){function r(){var w=v.shift(),y;w&&(y=w[w.length-1],y.jg(),w.stream=t.apply(null,w),y.kg())}function t(w,y,x){function C(G){G=x.ug(G);u.write(G);x.lg(G)}u=new n(w,x);u.id=q++;u.name=x.name||u.id;var A=w.ownerDocument,z={close:A.close,open:A.open,write:A.write,writeln:A.writeln};e(A,{close:a,open:a,write:function(){return C(g(arguments).join(""))},writeln:function(){return C(g(arguments).join("")+"\n")}});var D=u.Kb.onerror||a;u.Kb.onerror=function(G,L,O){x.error({yi:G+
" - "+L+":"+O});D.apply(u.Kb,arguments)};u.write(y,function(){e(A,z);u.Kb.onerror=D;x.done();u=null;r()});return u}var q=0,v=[],u=null;return e(function(w,y,x){"function"===typeof x&&(x={done:x});x=f(x,h);w=/^#/.test(w)?l.document.getElementById(w.substr(1)):w.xi?w[0]:w;var C=[w,y,x];w.Ch={cancel:function(){C.stream?C.stream.abort():C[1]=a}};x.sg(C);v.push(C);u||r();return w.Ch},{streams:{},zi:v,mi:n})}();ve=l.postscribe}})();var we=/^([a-z][a-z0-9]*):(!|\?)(\*|string|boolean|number|Fn|DustMap|List|OpaqueValue)$/i,xe={Fn:"function",DustMap:"Object",List:"Array"},F=function(a,b,c){for(var d=0;d<b.length;d++){var e=we.exec(b[d]);if(!e)throw Error("Internal Error in "+a);var f=e[1],g="!"===e[2],h=e[3],l=c[d],m=typeof l;if(null===l||"undefined"===m){if(g)throw Error("Error in "+a+". Required argument "+f+" not supplied.");}else if("*"!==h){var n=typeof l;l instanceof db?n="Fn":l instanceof k?n="List":l instanceof ib?n="DustMap":
l instanceof tb&&(n="OpaqueValue");if(n!=h)throw Error("Error in "+a+". Argument "+f+" has type "+n+", which does not match required type "+(xe[h]||h)+".");}}};function ye(a){return""+a}
function ze(a,b){var c=[];return c};var Ae=function(a,b){var c=new db(a,function(){for(var d=Array.prototype.slice.call(arguments,0),e=0;e<d.length;e++)d[e]=this.a(d[e]);return b.apply(this,d)});c.m=!0;return c},Be=function(a,b){var c=new ib,d;for(d in b)if(b.hasOwnProperty(d)){var e=b[d];Fa(e)?c.set(d,Ae(a+"_"+d,e)):(Ga(e)||p(e)||"boolean"==typeof e)&&c.set(d,e)}c.m=!0;return c};var Ce=function(a,b){F(this.i.a,["apiName:!string","message:?string"],arguments);var c={},d=new ib;return d=Be("AssertApiSubject",c)};var De=function(a,b){F(this.i.a,["actual:?*","message:?string"],arguments);var c={},d=new ib;return d=Be("AssertThatSubject",c)};function Ee(a){return function(){for(var b=[],c=this.m,d=0;d<arguments.length;++d)b.push(ub(arguments[d],c));return vb(a.apply(null,b))}}var Ge=function(){for(var a=Math,b=Fe,c={},d=0;d<b.length;d++){var e=b[d];a.hasOwnProperty(e)&&(c[e]=Ee(a[e].bind(a)))}return c};var He=function(a){var b;return b};var Ie=function(a){var b;return b};var Je=function(a){F(this.i.a,["uri:!string"],arguments);return encodeURI(a)};var Ke=function(a){F(this.i.a,["uri:!string"],arguments);return encodeURIComponent(a)};var Le=function(a){F(this.i.a,["message:?string"],arguments);};var Me=function(a,b){F(this.i.a,["min:!number","max:!number"],arguments);return Ka(a,b)};var Ne=function(a,b,c){var d=a.m.a;if(!d)throw Error("Missing program state.");d.qg.apply(null,Array.prototype.slice.call(arguments,1))};var Oe=function(){Ne(this,"read_container_data");var a=new ib;a.set("containerId",'GTM-NTX72TG');a.set("version",'38');a.set("environmentName",'');a.set("debugMode",Yd);a.set("previewMode",$d);a.set("environmentMode",Zd);a.m=!0;return a};var Pe=function(){return(new Date).getTime()};var Qe=function(a){if(null===a)return"null";if(a instanceof k)return"array";if(a instanceof db)return"function";if(a instanceof tb){a=a.oa;if(void 0===a.constructor||void 0===a.constructor.name){var b=String(a);return b.substring(8,b.length-1)}return String(a.constructor.name)}return typeof a};var Re=function(a){function b(c){return function(d){try{return c(d)}catch(e){(Yd||$d)&&a.call(this,e.message)}}}return{parse:b(function(c){return vb(JSON.parse(c))}),stringify:b(function(c){return JSON.stringify(ub(c))})}};var Se=function(a){return Pa(ub(a,this.m))};var Te=function(a){return Number(ub(a,this.m))};var Ue=function(a){return null===a?"null":void 0===a?"undefined":a.toString()};var Ve=function(a,b,c){var d=null,e=!1;return e?d:null};var Fe="floor ceil round max min abs pow sqrt".split(" ");var We=function(){var a={};return{Wg:function(b){return a.hasOwnProperty(b)?a[b]:void 0},Uh:function(b,c){a[b]=c},reset:function(){a={}}}},Xe=function(a,b){F(this.i.a,["apiName:!string","mock:?*"],arguments);};var Ye=function(){this.a={};this.i={}};Ye.prototype.get=function(a,b){var c=this.a.hasOwnProperty(a)?this.a[a]:void 0;return c};
Ye.prototype.add=function(a,b,c){if(this.a.hasOwnProperty(a))throw"Attempting to add a function which already exists: "+a+".";if(this.i.hasOwnProperty(a))throw"Attempting to add an API with an existing private API name: "+a+".";this.a[a]=c?void 0:Fa(b)?Ae(a,b):Be(a,b)};
var $e=function(a){var b=Ze;if(a.i.hasOwnProperty("getUserAgent"))throw"Attempting to add a private function which already exists: getUserAgent.";if(a.a.hasOwnProperty("getUserAgent"))throw"Attempting to add a private function with an existing API name: getUserAgent.";a.i.getUserAgent=Fa(b)?Ae("getUserAgent",b):Be("getUserAgent",b)};function af(){var a={};return a};var H={ub:"_ee",ad:"_syn",li:"_uei",ji:"_pci",Nc:"event_callback",Vb:"event_timeout",ka:"gtag.config"};H.fa="allow_ad_personalization_signals";H.Uc="restricted_data_processing";H.gb="allow_google_signals";H.ia="cookie_expires";H.Ub="cookie_update";H.qb="session_duration";H.na="user_properties";H.Fa="transport_url";H.N="ads_data_redaction";H.o="ad_storage";
H.M="analytics_storage";H.lf="region";H.nf="wait_for_update";H.se=[H.fa,H.gb,H.Ub];H.te=[H.ia,H.Vb,H.qb];var bf={},cf=function(a,b){bf[a]=bf[a]||[];bf[a][b]=!0},df=function(a){for(var b=[],c=bf[a]||[],d=0;d<c.length;d++)c[d]&&(b[Math.floor(d/6)]^=1<<d%6);for(var e=0;e<b.length;e++)b[e]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(b[e]||0);return b.join("")};var I=function(a){cf("GTM",a)};function ef(a){if(Error.captureStackTrace)Error.captureStackTrace(this,ef);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))}pa(ef,Error);ef.prototype.name="CustomError";var ff=function(a,b){for(var c=a.split("%s"),d="",e=c.length-1,f=0;f<e;f++)d+=c[f]+(f<b.length?b[f]:"%s");ef.call(this,d+c[e])};pa(ff,ef);ff.prototype.name="AssertionError";var gf=function(a,b){throw new ff("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));};var hf=function(a,b){var c=function(){};c.prototype=a.prototype;var d=new c;a.apply(d,Array.prototype.slice.call(arguments,1));return d},jf=function(a){var b=a;return function(){if(b){var c=b;b=null;c()}}};var kf;var lf=/^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i;var mf;a:{var nf=ma.navigator;if(nf){var of=nf.userAgent;if(of){mf=of;break a}}mf=""}var pf=function(a){return-1!=mf.indexOf(a)};var rf=function(a,b,c){this.a=c===qf?a:""};rf.prototype.toString=function(){return"SafeHtml{"+this.a+"}"};var sf=function(a){if(a instanceof rf&&a.constructor===rf)return a.a;var b=typeof a;gf("expected object of type SafeHtml, got '"+a+"' of type "+("object"!=b?b:a?Array.isArray(a)?"array":b:"null"));return"type_error:SafeHtml"},qf={},tf=new rf(ma.trustedTypes&&ma.trustedTypes.emptyHTML||"",0,qf);var uf={MATH:!0,SCRIPT:!0,STYLE:!0,SVG:!0,TEMPLATE:!0},vf=function(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}}(function(){if("undefined"===typeof document)return!1;var a=document.createElement("div"),b=document.createElement("div");b.appendChild(document.createElement("div"));a.appendChild(b);if(!a.firstChild)return!1;var c=a.firstChild.firstChild;a.innerHTML=sf(tf);return!c.parentElement}),wf=function(a,b){if(a.tagName&&uf[a.tagName.toUpperCase()])throw Error("goog.dom.safe.setInnerHtml cannot be used to set content of "+
a.tagName+".");if(vf())for(;a.lastChild;)a.removeChild(a.lastChild);a.innerHTML=sf(b)};var xf=function(a){var b;if(void 0===kf){var c=null,d=ma.trustedTypes;if(d&&d.createPolicy){try{c=d.createPolicy("goog#html",{createHTML:sa,createScript:sa,createScriptURL:sa})}catch(f){ma.console&&ma.console.error(f.message)}kf=c}else kf=c}var e=(b=kf)?b.createHTML(a):a;return new rf(e,null,qf)};var B=window,M=document,yf=navigator,zf=M.currentScript&&M.currentScript.src,Af=function(a,b){var c=B[a];B[a]=void 0===c?b:c;return B[a]},Bf=function(a,b){b&&(a.addEventListener?a.onload=b:a.onreadystatechange=function(){a.readyState in{loaded:1,complete:1}&&(a.onreadystatechange=null,b())})},Cf=function(a,b,c){var d=M.createElement("script");d.type="text/javascript";d.async=!0;d.src=a;Bf(d,b);c&&(d.onerror=c);var e;if(null===oa)b:{var f=ma.document,g=f.querySelector&&f.querySelector("script[nonce]");
if(g){var h=g.nonce||g.getAttribute("nonce");if(h&&na.test(h)){oa=h;break b}}oa=""}e=oa;e&&d.setAttribute("nonce",e);var l=M.getElementsByTagName("script")[0]||M.body||M.head;l.parentNode.insertBefore(d,l);return d},Df=function(){if(zf){var a=zf.toLowerCase();if(0===a.indexOf("https://"))return 2;if(0===a.indexOf("http://"))return 3}return 1},Ef=function(a,b){var c=M.createElement("iframe");c.height="0";c.width="0";c.style.display="none";c.style.visibility="hidden";var d=M.body&&M.body.lastChild||
M.body||M.head;d.parentNode.insertBefore(c,d);Bf(c,b);void 0!==a&&(c.src=a);return c},Ff=function(a,b,c){var d=new Image(1,1);d.onload=function(){d.onload=null;b&&b()};d.onerror=function(){d.onerror=null;c&&c()};d.src=a;return d},Gf=function(a,b,c,d){a.addEventListener?a.addEventListener(b,c,!!d):a.attachEvent&&a.attachEvent("on"+b,c)},Hf=function(a,b,c){a.removeEventListener?a.removeEventListener(b,c,!1):a.detachEvent&&a.detachEvent("on"+b,c)},N=function(a){B.setTimeout(a,0)},If=function(a,b){return a&&
b&&a.attributes&&a.attributes[b]?a.attributes[b].value:null},Jf=function(a){var b=a.innerText||a.textContent||"";b&&" "!=b&&(b=b.replace(/^[\s\xa0]+|[\s\xa0]+$/g,""));b&&(b=b.replace(/(\xa0+|\s{2,}|\n|\r\t)/g," "));return b},Kf=function(a){var b=M.createElement("div");wf(b,xf("A<div>"+a+"</div>"));b=b.lastChild;for(var c=[];b.firstChild;)c.push(b.removeChild(b.firstChild));return c},Lf=function(a,b,c){c=c||100;for(var d={},e=0;e<b.length;e++)d[b[e]]=!0;for(var f=a,g=0;f&&g<=c;g++){if(d[String(f.tagName).toLowerCase()])return f;
f=f.parentElement}return null},Mf=function(a){yf.sendBeacon&&yf.sendBeacon(a)||Ff(a)},Nf=function(a,b){var c=a[b];c&&"string"===typeof c.animVal&&(c=c.animVal);return c};var Of={},Pf=function(a){return void 0==Of[a]?!1:Of[a]};var Qf=[];function Rf(){var a=Af("google_tag_data",{});a.ics||(a.ics={entries:{},set:Sf,update:Tf,addListener:Uf,notifyListeners:Vf,active:!1});return a.ics}
function Sf(a,b,c,d,e,f){var g=Rf();g.active=!0;if(void 0!=b){var h=g.entries,l=h[a]||{},m=l.region,n=c&&p(c)?c.toUpperCase():void 0;d=d.toUpperCase();e=e.toUpperCase();if(n===e||(n===d?m!==e:!n&&!m)){var r=!!(f&&0<f&&void 0===l.update),t={region:n,initial:"granted"===b,update:l.update,quiet:r};h[a]=t;r&&B.setTimeout(function(){h[a]===t&&t.quiet&&(t.quiet=!1,Wf(a),Vf(),cf("TAGGING",2))},f)}}}
function Tf(a,b){var c=Rf();c.active=!0;if(void 0!=b){var d=Xf(a),e=c.entries,f=e[a]=e[a]||{};f.update="granted"===b;var g=Xf(a);f.quiet?(f.quiet=!1,Wf(a)):g!==d&&Wf(a)}}function Uf(a,b){Qf.push({Le:a,Rg:b})}function Wf(a){for(var b=0;b<Qf.length;++b){var c=Qf[b];Ha(c.Le)&&-1!==c.Le.indexOf(a)&&(c.$e=!0)}}function Vf(a){for(var b=0;b<Qf.length;++b){var c=Qf[b];if(c.$e){c.$e=!1;try{c.Rg({Ke:a})}catch(d){}}}}
var Xf=function(a){var b=Rf().entries[a]||{};return void 0!==b.update?b.update:void 0!==b.initial?b.initial:void 0},Yf=function(a){return!(Rf().entries[a]||{}).quiet},Zf=function(){return Pf("gtag_cs_api")?Rf().active:!1},$f=function(a,b){Rf().addListener(a,b)},ag=function(a,b){function c(){for(var e=0;e<b.length;e++)if(!Yf(b[e]))return!0;return!1}if(c()){var d=!1;$f(b,function(e){d||c()||(d=!0,a(e))})}else a({})},bg=function(a,b){if(!1===Xf(b)){var c=!1;$f([b],function(d){!c&&Xf(b)&&(a(d),c=!0)})}};var cg=[H.o,H.M],dg=function(a){var b=a[H.lf];b&&I(40);var c=a[H.nf];c&&I(41);for(var d=Ha(b)?b:[b],e=0;e<d.length;++e)for(var f=0;f<cg.length;f++){var g=cg[f],h=a[cg[f]],l=d[e];Rf().set(g,h,l,"","",c)}},eg=function(a,b){for(var c=0;c<cg.length;c++){var d=cg[c],e=a[cg[c]];Rf().update(d,e)}Rf().notifyListeners(b)},fg=function(a){var b=Xf(a);return void 0!=b?b:!0},gg=function(){for(var a=[],b=0;b<cg.length;b++){var c=Xf(cg[b]);a[b]=!0===c?"1":!1===c?"0":"-"}return"G1"+
a.join("")},hg=function(a,b){ag(a,b)};var jg=function(a){return ig?M.querySelectorAll(a):null},kg=function(a,b){if(!ig)return null;if(Element.prototype.closest)try{return a.closest(b)}catch(e){return null}var c=Element.prototype.matches||Element.prototype.webkitMatchesSelector||Element.prototype.mozMatchesSelector||Element.prototype.msMatchesSelector||Element.prototype.oMatchesSelector,d=a;if(!M.documentElement.contains(d))return null;do{try{if(c.call(d,b))return d}catch(e){break}d=d.parentElement||d.parentNode}while(null!==d&&1===d.nodeType);
return null},lg=!1;if(M.querySelectorAll)try{var mg=M.querySelectorAll(":root");mg&&1==mg.length&&mg[0]==M.documentElement&&(lg=!0)}catch(a){}var ig=lg;var Qd={},Q=null,Ag=Math.random();Qd.C="GTM-NTX72TG";Qd.cc="9n1";Qd.hi="";var Bg={__cl:!0,__ecl:!0,__ehl:!0,__evl:!0,__fal:!0,__fil:!0,__fsl:!0,__hl:!0,__jel:!0,__lcl:!0,__sdl:!0,__tl:!0,__ytl:!0},Cg={__paused:!0,__tg:!0},Dg;for(Dg in Bg)Bg.hasOwnProperty(Dg)&&(Cg[Dg]=!0);var Eg="www.googletagmanager.com/gtm.js";
var Fg=Eg,Gg=Qa(""),Hg=null,Ig=null,Jg="//www.googletagmanager.com/a?id="+Qd.C+"&cv=38",Kg={},Lg={},Mg=function(){var a=Q.sequence||1;Q.sequence=a+1;return a};
var Ng=function(){return"&tc="+pd.filter(function(a){return a}).length},Qg=function(){2022<=Og().length&&Pg()},Sg=function(){Rg||(Rg=B.setTimeout(Pg,500))},Pg=function(){Rg&&(B.clearTimeout(Rg),Rg=void 0);void 0===Tg||Ug[Tg]&&!Vg&&!Wg||(Xg[Tg]||Yg.kh()||0>=Zg--?(I(1),Xg[Tg]=!0):(Yg.Kh(),Ff(Og()),Ug[Tg]=!0,$g=ah=bh=Wg=Vg=""))},Og=function(){var a=Tg;if(void 0===a)return"";var b=df("GTM"),c=df("TAGGING");return[ch,Ug[a]?"":"&es=1",dh[a],b?"&u="+b:"",c?"&ut="+c:"",Ng(),Vg,Wg,bh?bh:"",ah,$g,"&z=0"].join("")},
eh=function(){return[Jg,"&v=3&t=t","&pid="+Ka(),"&rv="+Qd.cc].join("")},fh="0.005000">Math.random(),ch=eh(),gh=function(){ch=eh()},Ug={},Vg="",Wg="",$g="",ah="",bh="",Tg=void 0,dh={},Xg={},Rg=void 0,Yg=function(a,b){var c=0,d=0;return{kh:function(){if(c<a)return!1;Ta()-d>=b&&(c=0);return c>=a},Kh:function(){Ta()-d>=b&&(c=0);c++;d=Ta()}}}(2,1E3),Zg=1E3,hh=function(a,b,c){if(fh&&!Xg[a]&&b){a!==Tg&&(Pg(),Tg=a);var d,e=String(b[Bd.Ga]||"").replace(/_/g,"");0===e.indexOf("cvt")&&(e="cvt");
d=e;var f=c+d;Vg=Vg?Vg+"."+f:"&tr="+f;var g=b["function"];if(!g)throw Error("Error: No function name given for function call.");var h=(rd[g]?"1":"2")+d;$g=$g?$g+"."+h:"&ti="+h;Sg();Qg()}},ih=function(a,b,c){if(fh&&!Xg[a]){a!==Tg&&(Pg(),Tg=a);var d=c+b;Wg=Wg?Wg+"."+d:"&epr="+d;Sg();Qg()}},jh=function(a,b,c){};
var kh={},lh=new La,mh={},nh={},qh={name:"dataLayer",set:function(a,b){E(bb(a,b),mh);oh()},get:function(a){return ph(a,2)},reset:function(){lh=new La;mh={};oh()}},ph=function(a,b){if(2!=b){var c=lh.get(a);fh&&c!==rh(a.split("."))&&I(5);return c}return rh(a.split("."))},rh=function(a){for(var b=mh,c=0;c<a.length;c++){if(null===b)return!1;if(void 0===b)break;b=b[a[c]]}return b},sh=function(a,b){nh.hasOwnProperty(a)||(lh.set(a,b),E(bb(a,b),mh),oh())},oh=function(a){Na(nh,function(b,c){lh.set(b,c);
E(bb(b,void 0),mh);E(bb(b,c),mh);a&&delete nh[b]})},th=function(a,b,c){kh[a]=kh[a]||{};var d=1!==c?rh(b.split(".")):lh.get(b);"array"===lb(d)||"object"===lb(d)?kh[a][b]=E(d):kh[a][b]=d},uh=function(a,b){if(kh[a])return kh[a][b]},vh=function(a,b){kh[a]&&delete kh[a][b]};var yh={},zh=function(a,b){if(B._gtmexpgrp&&B._gtmexpgrp.hasOwnProperty(a))return B._gtmexpgrp[a];void 0===yh[a]&&(yh[a]=Math.floor(Math.random()*b));return yh[a]};var Ah=/:[0-9]+$/,Bh=function(a,b,c,d){for(var e=[],f=a.split("&"),g=0;g<f.length;g++){var h=f[g].split("=");if(decodeURIComponent(h[0]).replace(/\+/g," ")===b){var l=h.slice(1).join("=");if(!c)return d?l:decodeURIComponent(l).replace(/\+/g," ");e.push(d?l:decodeURIComponent(l).replace(/\+/g," "))}}return c?e:void 0},Eh=function(a,b,c,d,e){b&&(b=String(b).toLowerCase());if("protocol"===b||"port"===b)a.protocol=Ch(a.protocol)||Ch(B.location.protocol);"port"===b?a.port=String(Number(a.hostname?a.port:
B.location.port)||("http"==a.protocol?80:"https"==a.protocol?443:"")):"host"===b&&(a.hostname=(a.hostname||B.location.hostname).replace(Ah,"").toLowerCase());return Dh(a,b,c,d,e)},Dh=function(a,b,c,d,e){var f,g=Ch(a.protocol);b&&(b=String(b).toLowerCase());switch(b){case "url_no_fragment":f=Fh(a);break;case "protocol":f=g;break;case "host":f=a.hostname.replace(Ah,"").toLowerCase();if(c){var h=/^www\d*\./.exec(f);h&&h[0]&&(f=f.substr(h[0].length))}break;case "port":f=String(Number(a.port)||("http"==
g?80:"https"==g?443:""));break;case "path":a.pathname||a.hostname||cf("TAGGING",1);f="/"==a.pathname.substr(0,1)?a.pathname:"/"+a.pathname;var l=f.split("/");0<=Ia(d||[],l[l.length-1])&&(l[l.length-1]="");f=l.join("/");break;case "query":f=a.search.replace("?","");e&&(f=Bh(f,e,!1,void 0));break;case "extension":var m=a.pathname.split(".");f=1<m.length?m[m.length-1]:"";f=f.split("/")[0];break;case "fragment":f=a.hash.replace("#","");break;default:f=a&&a.href}return f},Ch=function(a){return a?a.replace(":",
"").toLowerCase():""},Fh=function(a){var b="";if(a&&a.href){var c=a.href.indexOf("#");b=0>c?a.href:a.href.substr(0,c)}return b},Gh=function(a){var b=M.createElement("a");a&&(b.href=a);var c=b.pathname;"/"!==c[0]&&(a||cf("TAGGING",1),c="/"+c);var d=b.hostname.replace(Ah,"");return{href:b.href,protocol:b.protocol,host:b.host,hostname:d,pathname:c,search:b.search,hash:b.hash,port:b.port}},Hh=function(a){function b(m){var n=m.split("=")[0];return 0>d.indexOf(n)?m:n+"=0"}function c(m){return m.split("&").map(b).filter(function(n){return void 0!=
n}).join("&")}var d="gclid dclid gclaw gcldc gclgp gclha gclgf _gl".split(" "),e=Gh(a),f=a.split(/[?#]/)[0],g=e.search,h=e.hash;"?"===g[0]&&(g=g.substring(1));"#"===h[0]&&(h=h.substring(1));g=c(g);h=c(h);""!==g&&(g="?"+g);""!==h&&(h="#"+h);var l=""+f+g+h;"/"===l[l.length-1]&&(l=l.substring(0,l.length-1));return l};function Ih(a,b,c){for(var d=[],e=b.split(";"),f=0;f<e.length;f++){var g=e[f].split("="),h=g[0].replace(/^\s*|\s*$/g,"");if(h&&h==a){var l=g.slice(1).join("=").replace(/^\s*|\s*$/g,"");l&&c&&(l=decodeURIComponent(l));d.push(l)}}return d};var Lh=function(a,b,c,d){return Jh(d)?Ih(a,String(b||document.cookie),c):[]},Oh=function(a,b,c,d,e){if(Jh(e)){var f=Mh(a,d,e);if(1===f.length)return f[0].id;if(0!==f.length){f=Nh(f,function(g){return g.mc},b);if(1===f.length)return f[0].id;f=Nh(f,function(g){return g.Eb},c);return f[0]?f[0].id:void 0}}};function Ph(a,b,c,d){var e=document.cookie;document.cookie=a;var f=document.cookie;return e!=f||void 0!=c&&0<=Lh(b,f,!1,d).indexOf(c)}
var Th=function(a,b,c,d){function e(w,y,x){if(null==x)return delete h[y],w;h[y]=x;return w+"; "+y+"="+x}function f(w,y){if(null==y)return delete h[y],w;h[y]=!0;return w+"; "+y}if(!Jh(c.Ja))return 2;var g;void 0==b?g=a+"=deleted; expires="+(new Date(0)).toUTCString():(c.encode&&(b=encodeURIComponent(b)),b=Qh(b),g=a+"="+b);var h={};g=e(g,"path",c.path);var l;c.expires instanceof Date?l=c.expires.toUTCString():null!=c.expires&&(l=""+c.expires);g=e(g,"expires",l);g=e(g,"max-age",c.th);g=e(g,"samesite",
c.Oh);c.Rh&&(g=f(g,"secure"));var m=c.domain;if("auto"===m){for(var n=Rh(),r=void 0,t=!1,q=0;q<n.length;++q){var v="none"!==n[q]?n[q]:void 0,u=e(g,"domain",v);u=f(u,c.flags);try{d&&d(a,h)}catch(w){r=w;continue}t=!0;if(!Sh(v,c.path)&&Ph(u,a,b,c.Ja))return 0}if(r&&!t)throw r;return 1}m&&"none"!==m&&(g=e(g,"domain",m));g=f(g,c.flags);d&&d(a,h);return Sh(m,c.path)?1:Ph(g,a,b,c.Ja)?0:1},Uh=function(a,b,c){null==c.path&&(c.path="/");c.domain||(c.domain="auto");return Th(a,b,c)};
function Nh(a,b,c){for(var d=[],e=[],f,g=0;g<a.length;g++){var h=a[g],l=b(h);l===c?d.push(h):void 0===f||l<f?(e=[h],f=l):l===f&&e.push(h)}return 0<d.length?d:e}function Mh(a,b,c){for(var d=[],e=Lh(a,void 0,void 0,c),f=0;f<e.length;f++){var g=e[f].split("."),h=g.shift();if(!b||-1!==b.indexOf(h)){var l=g.shift();l&&(l=l.split("-"),d.push({id:g.join("."),mc:1*l[0]||1,Eb:1*l[1]||1}))}}return d}
var Qh=function(a){a&&1200<a.length&&(a=a.substring(0,1200));return a},Vh=/^(www\.)?google(\.com?)?(\.[a-z]{2})?$/,Wh=/(^|\.)doubleclick\.net$/i,Sh=function(a,b){return Wh.test(document.location.hostname)||"/"===b&&Vh.test(a)},Rh=function(){var a=[],b=document.location.hostname.split(".");if(4===b.length){var c=b[b.length-1];if(parseInt(c,10).toString()===c)return["none"]}for(var d=b.length-2;0<=d;d--)a.push(b.slice(d).join("."));var e=document.location.hostname;Wh.test(e)||Vh.test(e)||a.push("none");
return a},Jh=function(a){if(!Pf("gtag_cs_api")||!a||!Zf())return!0;if(!Yf(a))return!1;var b=Xf(a);return null==b?!0:!!b};var Xh=function(){for(var a=yf.userAgent+(M.cookie||"")+(M.referrer||""),b=a.length,c=B.history.length;0<c;)a+=c--^b++;var d=1,e,f,g;if(a)for(d=0,f=a.length-1;0<=f;f--)g=a.charCodeAt(f),d=(d<<6&268435455)+g+(g<<14),e=d&266338304,d=0!=e?d^e>>21:d;return[Math.round(2147483647*Math.random())^d&2147483647,Math.round(Ta()/1E3)].join(".")},$h=function(a,b,c,d,e){var f=Yh(b);return Oh(a,f,Zh(c),d,e)},ai=function(a,b,c,d){var e=""+Yh(c),f=Zh(d);1<f&&(e+="-"+f);return[b,e,a].join(".")},Yh=function(a){if(!a)return 1;
a=0===a.indexOf(".")?a.substr(1):a;return a.split(".").length},Zh=function(a){if(!a||"/"===a)return 1;"/"!==a[0]&&(a="/"+a);"/"!==a[a.length-1]&&(a+="/");return a.split("/").length-1};function bi(a,b,c){var d,e=a.Db;null==e&&(e=7776E3);0!==e&&(d=new Date((b||Ta())+1E3*e));return{path:a.path,domain:a.domain,flags:a.flags,encode:!!c,expires:d}};var ci=["1"],di={},hi=function(a){var b=ei(a.prefix);di[b]||fi(b,a.path,a.domain)||(gi(b,Xh(),a),fi(b,a.path,a.domain))};function gi(a,b,c){var d=ai(b,"1",c.domain,c.path),e=bi(c);e.Ja="ad_storage";Uh(a,d,e)}function fi(a,b,c){var d=$h(a,b,c,ci,"ad_storage");d&&(di[a]=d);return d}function ei(a){return(a||"_gcl")+"_au"};function ii(){for(var a=ji,b={},c=0;c<a.length;++c)b[a[c]]=c;return b}function ki(){var a="ABCDEFGHIJKLMNOPQRSTUVWXYZ";a+=a.toLowerCase()+"0123456789-_";return a+"."}var ji,li;function mi(a){ji=ji||ki();li=li||ii();for(var b=[],c=0;c<a.length;c+=3){var d=c+1<a.length,e=c+2<a.length,f=a.charCodeAt(c),g=d?a.charCodeAt(c+1):0,h=e?a.charCodeAt(c+2):0,l=f>>2,m=(f&3)<<4|g>>4,n=(g&15)<<2|h>>6,r=h&63;e||(r=64,d||(n=64));b.push(ji[l],ji[m],ji[n],ji[r])}return b.join("")}
function ni(a){function b(l){for(;d<a.length;){var m=a.charAt(d++),n=li[m];if(null!=n)return n;if(!/^[\s\xa0]*$/.test(m))throw Error("Unknown base64 encoding at char: "+m);}return l}ji=ji||ki();li=li||ii();for(var c="",d=0;;){var e=b(-1),f=b(0),g=b(64),h=b(64);if(64===h&&-1===e)return c;c+=String.fromCharCode(e<<2|f>>4);64!=g&&(c+=String.fromCharCode(f<<4&240|g>>2),64!=h&&(c+=String.fromCharCode(g<<6&192|h)))}};var oi;var si=function(){var a=pi,b=qi,c=ri(),d=function(g){a(g.target||g.srcElement||{})},e=function(g){b(g.target||g.srcElement||{})};if(!c.init){Gf(M,"mousedown",d);Gf(M,"keyup",d);Gf(M,"submit",e);var f=HTMLFormElement.prototype.submit;HTMLFormElement.prototype.submit=function(){b(this);f.call(this)};c.init=!0}},ti=function(a,b,c,d,e){var f={callback:a,domains:b,fragment:2===c,placement:c,forms:d,sameHost:e};ri().decorators.push(f)},ui=function(a,b,c){for(var d=ri().decorators,e={},f=0;f<d.length;++f){var g=
d[f],h;if(h=!c||g.forms)a:{var l=g.domains,m=a,n=!!g.sameHost;if(l&&(n||m!==M.location.hostname))for(var r=0;r<l.length;r++)if(l[r]instanceof RegExp){if(l[r].test(m)){h=!0;break a}}else if(0<=m.indexOf(l[r])||n&&0<=l[r].indexOf(m)){h=!0;break a}h=!1}if(h){var t=g.placement;void 0==t&&(t=g.fragment?2:1);t===b&&Xa(e,g.callback())}}return e},ri=function(){var a=Af("google_tag_data",{}),b=a.gl;b&&b.decorators||(b={decorators:[]},a.gl=b);return b};var vi=/(.*?)\*(.*?)\*(.*)/,wi=/^https?:\/\/([^\/]*?)\.?cdn\.ampproject\.org\/?(.*)/,xi=/^(?:www\.|m\.|amp\.)+/,yi=/([^?#]+)(\?[^#]*)?(#.*)?/;function zi(a){return new RegExp("(.*?)(^|&)"+a+"=([^&]*)&?(.*)")}
var Bi=function(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];void 0!==d&&d===d&&null!==d&&"[object Object]"!==d.toString()&&(b.push(c),b.push(mi(String(d))))}var e=b.join("*");return["1",Ai(e),e].join("*")},Ai=function(a,b){var c=[window.navigator.userAgent,(new Date).getTimezoneOffset(),window.navigator.userLanguage||window.navigator.language,Math.floor((new Date).getTime()/60/1E3)-(void 0===b?0:b),a].join("*"),d;if(!(d=oi)){for(var e=Array(256),f=0;256>f;f++){for(var g=f,h=0;8>h;h++)g=
g&1?g>>>1^3988292384:g>>>1;e[f]=g}d=e}oi=d;for(var l=4294967295,m=0;m<c.length;m++)l=l>>>8^oi[(l^c.charCodeAt(m))&255];return((l^-1)>>>0).toString(36)},Di=function(){return function(a){var b=Gh(B.location.href),c=b.search.replace("?",""),d=Bh(c,"_gl",!1,!0)||"";a.query=Ci(d)||{};var e=Eh(b,"fragment").match(zi("_gl"));a.fragment=Ci(e&&e[3]||"")||{}}},Ei=function(a){var b=Di(),c=ri();c.data||(c.data={query:{},fragment:{}},b(c.data));var d={},e=c.data;e&&(Xa(d,e.query),a&&Xa(d,e.fragment));return d},
Ci=function(a){var b;b=void 0===b?3:b;try{if(a){var c;a:{for(var d=a,e=0;3>e;++e){var f=vi.exec(d);if(f){c=f;break a}d=decodeURIComponent(d)}c=void 0}var g=c;if(g&&"1"===g[1]){var h=g[3],l;a:{for(var m=g[2],n=0;n<b;++n)if(m===Ai(h,n)){l=!0;break a}l=!1}if(l){for(var r={},t=h?h.split("*"):[],q=0;q<t.length;q+=2)r[t[q]]=ni(t[q+1]);return r}}}}catch(v){}};
function Fi(a,b,c,d){function e(n){var r=n,t=zi(a).exec(r),q=r;if(t){var v=t[2],u=t[4];q=t[1];u&&(q=q+v+u)}n=q;var w=n.charAt(n.length-1);n&&"&"!==w&&(n+="&");return n+m}d=void 0===d?!1:d;var f=yi.exec(c);if(!f)return"";var g=f[1],h=f[2]||"",l=f[3]||"",m=a+"="+b;d?l="#"+e(l.substring(1)):h="?"+e(h.substring(1));return""+g+h+l}
function Gi(a,b){var c="FORM"===(a.tagName||"").toUpperCase(),d=ui(b,1,c),e=ui(b,2,c),f=ui(b,3,c);if(Ya(d)){var g=Bi(d);c?Hi("_gl",g,a):Ii("_gl",g,a,!1)}if(!c&&Ya(e)){var h=Bi(e);Ii("_gl",h,a,!0)}for(var l in f)if(f.hasOwnProperty(l))a:{var m=l,n=f[l],r=a;if(r.tagName){if("a"===r.tagName.toLowerCase()){Ii(m,n,r,void 0);break a}if("form"===r.tagName.toLowerCase()){Hi(m,n,r);break a}}"string"==typeof r&&Fi(m,n,r,void 0)}}
function Ii(a,b,c,d){if(c.href){var e=Fi(a,b,c.href,void 0===d?!1:d);lf.test(e)&&(c.href=e)}}
function Hi(a,b,c){if(c&&c.action){var d=(c.method||"").toLowerCase();if("get"===d){for(var e=c.childNodes||[],f=!1,g=0;g<e.length;g++){var h=e[g];if(h.name===a){h.setAttribute("value",b);f=!0;break}}if(!f){var l=M.createElement("input");l.setAttribute("type","hidden");l.setAttribute("name",a);l.setAttribute("value",b);c.appendChild(l)}}else if("post"===d){var m=Fi(a,b,c.action);lf.test(m)&&(c.action=m)}}}
var pi=function(a){try{var b;a:{for(var c=a,d=100;c&&0<d;){if(c.href&&c.nodeName.match(/^a(?:rea)?$/i)){b=c;break a}c=c.parentNode;d--}b=null}var e=b;if(e){var f=e.protocol;"http:"!==f&&"https:"!==f||Gi(e,e.hostname)}}catch(g){}},qi=function(a){try{if(a.action){var b=Eh(Gh(a.action),"host");Gi(a,b)}}catch(c){}},Ji=function(a,b,c,d){si();ti(a,b,"fragment"===c?2:1,!!d,!1)},Ki=function(a,b){si();ti(a,[Dh(B.location,"host",!0)],b,!0,!0)},Li=function(){var a=M.location.hostname,b=wi.exec(M.referrer);if(!b)return!1;
var c=b[2],d=b[1],e="";if(c){var f=c.split("/"),g=f[1];e="s"===g?decodeURIComponent(f[2]):decodeURIComponent(g)}else if(d){if(0===d.indexOf("xn--"))return!1;e=d.replace(/-/g,".").replace(/\.\./g,"-")}var h=a.replace(xi,""),l=e.replace(xi,""),m;if(!(m=h===l)){var n="."+l;m=h.substring(h.length-n.length,h.length)===n}return m},Mi=function(a,b){return!1===a?!1:a||b||Li()};var Ni=/^\w+$/,Oi=/^[\w-]+$/,Pi=/^~?[\w-]+$/,Qi={aw:"_aw",dc:"_dc",gf:"_gf",ha:"_ha",gp:"_gp"},Ri=function(){if(!Pf("gtag_cs_api")||!Zf())return!0;var a=Xf("ad_storage");return null==a?!0:!!a},Si=function(a,b){Yf("ad_storage")?Ri()?a():bg(a,"ad_storage"):b?cf("TAGGING",3):ag(function(){Si(a,!0)},["ad_storage"])},Vi=function(a){var b=[];if(!M.cookie)return b;var c=Lh(a,M.cookie,void 0,"ad_storage");if(!c||0==c.length)return b;for(var d=0;d<c.length;d++){var e=Ti(c[d]);e&&-1===Ia(b,e)&&b.push(e)}return Ui(b)};
function Wi(a){return a&&"string"==typeof a&&a.match(Ni)?a:"_gcl"}
var Yi=function(){var a=Gh(B.location.href),b=Eh(a,"query",!1,void 0,"gclid"),c=Eh(a,"query",!1,void 0,"gclsrc"),d=Eh(a,"query",!1,void 0,"dclid");if(!b||!c){var e=a.hash.replace("#","");b=b||Bh(e,"gclid",!1,void 0);c=c||Bh(e,"gclsrc",!1,void 0)}return Xi(b,c,d)},Xi=function(a,b,c){var d={},e=function(f,g){d[g]||(d[g]=[]);d[g].push(f)};d.gclid=a;d.gclsrc=b;d.dclid=c;if(void 0!==a&&a.match(Oi))switch(b){case void 0:e(a,"aw");break;case "aw.ds":e(a,"aw");e(a,"dc");break;case "ds":e(a,"dc");break;case "3p.ds":Pf("gtm_3pds")&&
e(a,"dc");break;case "gf":e(a,"gf");break;case "ha":e(a,"ha");break;case "gp":e(a,"gp")}c&&e(c,"dc");return d},$i=function(a){var b=Yi();Si(function(){Zi(b,a)})};
function Zi(a,b,c){function d(l,m){var n=aj(l,e);n&&Uh(n,m,f)}b=b||{};var e=Wi(b.prefix);c=c||Ta();var f=bi(b,c,!0);f.Ja="ad_storage";var g=Math.round(c/1E3),h=function(l){return["GCL",g,l].join(".")};a.aw&&(!0===b.Fi?d("aw",h("~"+a.aw[0])):d("aw",h(a.aw[0])));a.dc&&d("dc",h(a.dc[0]));a.gf&&d("gf",h(a.gf[0]));a.ha&&d("ha",h(a.ha[0]));a.gp&&d("gp",h(a.gp[0]))}
var cj=function(a,b){var c=Ei(!0);Si(function(){for(var d=Wi(b.prefix),e=0;e<a.length;++e){var f=a[e];if(void 0!==Qi[f]){var g=aj(f,d),h=c[g];if(h){var l=Math.min(bj(h),Ta()),m;b:{for(var n=l,r=Lh(g,M.cookie,void 0,"ad_storage"),t=0;t<r.length;++t)if(bj(r[t])>n){m=!0;break b}m=!1}if(!m){var q=bi(b,l,!0);q.Ja="ad_storage";Uh(g,h,q)}}}}Zi(Xi(c.gclid,c.gclsrc),b)})},aj=function(a,b){var c=Qi[a];if(void 0!==c)return b+c},bj=function(a){var b=a.split(".");return 3!==b.length||"GCL"!==b[0]?0:1E3*(Number(b[1])||
0)};function Ti(a){var b=a.split(".");if(3==b.length&&"GCL"==b[0]&&b[1])return b[2]}
var dj=function(a,b,c,d,e){if(Ha(b)){var f=Wi(e),g=function(){for(var h={},l=0;l<a.length;++l){var m=aj(a[l],f);if(m){var n=Lh(m,M.cookie,void 0,"ad_storage");n.length&&(h[m]=n.sort()[n.length-1])}}return h};Si(function(){Ji(g,b,c,d)})}},Ui=function(a){return a.filter(function(b){return Pi.test(b)})},ej=function(a,b){for(var c=Wi(b.prefix),d={},e=0;e<a.length;e++)Qi[a[e]]&&(d[a[e]]=Qi[a[e]]);Si(function(){Na(d,function(f,g){var h=Lh(c+g,M.cookie,void 0,"ad_storage");if(h.length){var l=h[0],m=bj(l),
n={};n[f]=[Ti(l)];Zi(n,b,m)}})})};function fj(a,b){for(var c=0;c<b.length;++c)if(a[b[c]])return!0;return!1}
var gj=function(){function a(e,f,g){g&&(e[f]=g)}var b=["aw","dc"];if(Zf()){var c=Yi();if(fj(c,b)){var d={};a(d,"gclid",c.gclid);a(d,"dclid",c.dclid);a(d,"gclsrc",c.gclsrc);Ki(function(){return d},3);Ki(function(){var e={};return e._up="1",e},1)}}},hj=function(){var a;if(Ri()){for(var b=[],c=M.cookie.split(";"),d=/^\s*_gac_(UA-\d+-\d+)=\s*(.+?)\s*$/,e=0;e<c.length;e++){var f=c[e].match(d);f&&b.push({Jd:f[1],value:f[2]})}var g={};if(b&&b.length)for(var h=0;h<b.length;h++){var l=b[h].value.split(".");
"1"==l[0]&&3==l.length&&l[1]&&(g[b[h].Jd]||(g[b[h].Jd]=[]),g[b[h].Jd].push({timestamp:l[1],Tg:l[2]}))}a=g}else a={};return a};var ij=/^\d+\.fls\.doubleclick\.net$/;function jj(a,b){Yf(H.o)?fg(H.o)?a():bg(a,H.o):b?I(42):hg(function(){jj(a,!0)},[H.o])}function kj(a){var b=Gh(B.location.href),c=Eh(b,"host",!1);if(c&&c.match(ij)){var d=Eh(b,"path").split(a+"=");if(1<d.length)return d[1].split(";")[0].split("?")[0]}}
function lj(a,b,c){if("aw"==a||"dc"==a){var d=kj("gcl"+a);if(d)return d.split(".")}var e=Wi(b);if("_gcl"==e){c=void 0===c?!0:c;var f=!fg(H.o)&&c,g;g=Yi()[a]||[];if(0<g.length)return f?["0"]:g}var h=aj(a,e);return h?Vi(h):[]}
var mj=function(a){var b=kj("gac");if(b)return!fg(H.o)&&a?"0":decodeURIComponent(b);var c=hj(),d=[];Na(c,function(e,f){for(var g=[],h=0;h<f.length;h++)g.push(f[h].Tg);g=Ui(g);g.length&&d.push(e+":"+g.join(","))});return d.join(";")},nj=function(a,b){var c=Yi().dc||[];jj(function(){hi(b);var d=di[ei(b.prefix)],e=!1;if(d&&0<c.length){var f=Q.joined_au=Q.joined_au||{},g=b.prefix||"_gcl";if(!f[g])for(var h=0;h<c.length;h++){var l="https://adservice.google.com/ddm/regclk";l=l+"?gclid="+c[h]+"&auiddc="+d;Mf(l);e=f[g]=
!0}}null==a&&(a=e);if(a&&d){var m=ei(b.prefix),n=di[m];n&&gi(m,n,b)}})};var oj=/[A-Z]+/,pj=/\s/,qj=function(a){if(p(a)&&(a=Sa(a),!pj.test(a))){var b=a.indexOf("-");if(!(0>b)){var c=a.substring(0,b);if(oj.test(c)){for(var d=a.substring(b+1).split("/"),e=0;e<d.length;e++)if(!d[e])return;return{id:a,prefix:c,containerId:c+"-"+d[0],D:d}}}}},sj=function(a){for(var b={},c=0;c<a.length;++c){var d=qj(a[c]);d&&(b[d.id]=d)}rj(b);var e=[];Na(b,function(f,g){e.push(g)});return e};
function rj(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];"AW"===d.prefix&&d.D[1]&&b.push(d.containerId)}for(var e=0;e<b.length;++e)delete a[b[e]]};var tj=function(){var a=!1;return a};var vj=function(a,b,c,d){return(2===uj()||d||"http:"!=B.location.protocol?a:b)+c},uj=function(){var a=Df(),b;if(1===a)a:{var c=Fg;c=c.toLowerCase();for(var d="https://"+c,e="http://"+c,f=1,g=M.getElementsByTagName("script"),h=0;h<g.length&&100>h;h++){var l=g[h].src;if(l){l=l.toLowerCase();if(0===l.indexOf(e)){b=3;break a}1===f&&0===l.indexOf(d)&&(f=2)}}b=f}else b=a;return b};
var Jj=function(a){return fg(H.o)?a:a.replace(/&url=([^&#]+)/,function(b,c){var d=Hh(decodeURIComponent(c));return"&url="+encodeURIComponent(d)})},Kj=function(){var a;if(!(a=Gg)){var b;if(!0===B._gtmdgs)b=!0;else{var c=yf&&yf.userAgent||"";b=0>c.indexOf("Safari")||/Chrome|Coast|Opera|Edg|Silk|Android/.test(c)||11>((/Version\/([\d]+)/.exec(c)||[])[1]||"")?!1:!0}a=!b}if(a)return-1;var d=Pa("0");return zh(1,100)<d?zh(2,2):-1};var Lj=new RegExp(/^(.*\.)?(google|youtube|blogger|withgoogle)(\.com?)?(\.[a-z]{2})?\.?$/),Mj={cl:["ecl"],customPixels:["nonGooglePixels"],ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],customScripts:["html","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],nonGooglePixels:[],nonGoogleScripts:["nonGooglePixels"],nonGoogleIframes:["nonGooglePixels"]},Nj={cl:["ecl"],customPixels:["customScripts","html"],
ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts"],customScripts:["html"],nonGooglePixels:["customPixels","customScripts","html","nonGoogleScripts","nonGoogleIframes"],nonGoogleScripts:["customScripts","html"],nonGoogleIframes:["customScripts","html","nonGoogleScripts"]},Oj="google customPixels customScripts html nonGooglePixels nonGoogleScripts nonGoogleIframes".split(" ");
var Qj=function(a){var b;ph("gtm.allowlist")&&I(52);b||(b=ph("gtm.whitelist"));b&&I(9);
var c=b&&$a(Ra(b),Mj),d;ph("gtm.blocklist")&&I(51);d||(d=ph("gtm.blacklist"));d||(d=ph("tagTypeBlacklist"))&&I(3);d?I(8):d=[];Pj()&&(d=Ra(d),d.push("nonGooglePixels","nonGoogleScripts","sandboxedScripts"));0<=Ia(Ra(d),"google")&&I(2);var e=
d&&$a(Ra(d),Nj),f={};return function(g){var h=g&&g[Bd.Ga];if(!h||"string"!=typeof h)return!0;h=h.replace(/^_*/,"");if(void 0!==f[h])return f[h];var l=Lg[h]||[],m=a(h,l);if(b){var n;if(n=m)a:{if(0>Ia(c,h))if(l&&0<l.length)for(var r=0;r<l.length;r++){if(0>Ia(c,l[r])){I(11);n=!1;break a}}else{n=!1;break a}n=!0}m=n}var t=!1;if(d){var q=0<=Ia(e,h);if(q)t=q;else{var v=Ma(e,l||[]);v&&I(10);t=v}}var u=!m||t;u||!(0<=Ia(l,"sandboxedScripts"))||c&&-1!==Ia(c,"sandboxedScripts")||(u=Ma(e,Oj));return f[h]=u}},
Pj=function(){return Lj.test(B.location&&B.location.hostname)};var Rj={active:!0,isAllowed:function(){return!0}},Sj=function(a){var b=Q.zones;return b?b.checkState(Qd.C,a):Rj},Tj=function(a){var b=Q.zones;!b&&a&&(b=Q.zones=a());return b};var Uj=function(){},Vj=function(){};var Wj=!1,Xj=0,Yj=[];function Zj(a){if(!Wj){var b=M.createEventObject,c="complete"==M.readyState,d="interactive"==M.readyState;if(!a||"readystatechange"!=a.type||c||!b&&d){Wj=!0;for(var e=0;e<Yj.length;e++)N(Yj[e])}Yj.push=function(){for(var f=0;f<arguments.length;f++)N(arguments[f]);return 0}}}function ak(){if(!Wj&&140>Xj){Xj++;try{M.documentElement.doScroll("left"),Zj()}catch(a){B.setTimeout(ak,50)}}}var bk=function(a){Wj?a():Yj.push(a)};var ck={},dk={},ek=function(a,b,c,d){if(!dk[a]||Cg[b]||"__zone"===b)return-1;var e={};nb(d)&&(e=E(d,e));e.id=c;e.status="timeout";return dk[a].tags.push(e)-1},fk=function(a,b,c,d){if(dk[a]){var e=dk[a].tags[b];e&&(e.status=c,e.executionTime=d)}};function gk(a){for(var b=ck[a]||[],c=0;c<b.length;c++)b[c]();ck[a]={push:function(d){d(Qd.C,dk[a])}}}
var jk=function(a,b,c){dk[a]={tags:[]};Fa(b)&&hk(a,b);c&&B.setTimeout(function(){return gk(a)},Number(c));return ik(a)},hk=function(a,b){ck[a]=ck[a]||[];ck[a].push(Va(function(){return N(function(){b(Qd.C,dk[a])})}))};function ik(a){var b=0,c=0,d=!1;return{add:function(){c++;return Va(function(){b++;d&&b>=c&&gk(a)})},pg:function(){d=!0;b>=c&&gk(a)}}};var kk=function(){function a(d){return!Ga(d)||0>d?0:d}if(!Q._li&&B.performance&&B.performance.timing){var b=B.performance.timing.navigationStart,c=Ga(qh.get("gtm.start"))?qh.get("gtm.start"):0;Q._li={cst:a(c-b),cbt:a(Ig-b)}}};var ok={},pk=function(){return B.GoogleAnalyticsObject&&B[B.GoogleAnalyticsObject]},qk=!1;
var rk=function(a){B.GoogleAnalyticsObject||(B.GoogleAnalyticsObject=a||"ga");var b=B.GoogleAnalyticsObject;if(B[b])B.hasOwnProperty(b)||I(12);else{var c=function(){c.q=c.q||[];c.q.push(arguments)};c.l=Number(new Date);B[b]=c}kk();return B[b]},sk=function(a,b,c,d){b=String(b).replace(/\s+/g,"").split(",");var e=pk();e(a+"require","linker");e(a+"linker:autoLink",b,c,d)};
var uk=function(a){},tk=function(){return B.GoogleAnalyticsObject||"ga"},vk=function(a,b){return function(){var c=pk(),d=c&&c.getByName&&c.getByName(a);if(d){var e=d.get("sendHitTask");d.set("sendHitTask",function(f){var g=f.get("hitPayload"),h=f.get("hitCallback"),l=0>g.indexOf("&tid="+b);l&&(f.set("hitPayload",g.replace(/&tid=UA-[0-9]+-[0-9]+/,"&tid="+
b),!0),f.set("hitCallback",void 0,!0));e(f);l&&(f.set("hitPayload",g,!0),f.set("hitCallback",h,!0),f.set("_x_19",void 0,!0),e(f))})}}};var Ak=function(){return!1},Bk=function(){var a={};return function(b,c,d){}};function Ck(a,b,c,d){var e=pd[a],f=Dk(a,b,c,d);if(!f)return null;var g=xd(e[Bd.De],c,[]);if(g&&g.length){var h=g[0];f=Ck(h.index,{J:f,I:1===h.Pe?b.terminate:f,terminate:b.terminate},c,d)}return f}
function Dk(a,b,c,d){function e(){if(f[Bd.Zf])h();else{var w=yd(f,c,[]);var C=ek(c.id,String(f[Bd.Ga]),Number(f[Bd.Ee]),w[Bd.$f]),A=!1;w.vtp_gtmOnSuccess=function(){if(!A){A=!0;var G=Ta()-D;hh(c.id,pd[a],"5");fk(c.id,C,"success",
G);g()}};w.vtp_gtmOnFailure=function(){if(!A){A=!0;var G=Ta()-D;hh(c.id,pd[a],"6");fk(c.id,C,"failure",G);h()}};w.vtp_gtmTagId=f.tag_id;w.vtp_gtmEventId=c.id;hh(c.id,f,"1");var z=function(){var G=Ta()-D;hh(c.id,f,"7");fk(c.id,C,"exception",G);A||(A=!0,h())};var D=Ta();try{wd(w,c)}catch(G){z(G)}}}var f=pd[a],g=b.J,h=b.I,l=b.terminate;if(c.qd(f))return null;var m=xd(f[Bd.Fe],c,[]);if(m&&m.length){var n=m[0],r=Ck(n.index,{J:g,I:h,terminate:l},c,d);if(!r)return null;g=r;h=2===n.Pe?l:r}if(f[Bd.ze]||f[Bd.bg]){var t=f[Bd.ze]?qd:c.Xh,q=g,v=h;if(!t[a]){e=Va(e);
var u=Ek(a,t,e);g=u.J;h=u.I}return function(){t[a](q,v)}}return e}function Ek(a,b,c){var d=[],e=[];b[a]=Fk(d,e,c);return{J:function(){b[a]=Gk;for(var f=0;f<d.length;f++)d[f]()},I:function(){b[a]=Hk;for(var f=0;f<e.length;f++)e[f]()}}}function Fk(a,b,c){return function(d,e){a.push(d);b.push(e);c()}}function Gk(a){a()}function Hk(a,b){b()};var Kk=function(a,b,c){for(var d=[],e=0;e<pd.length;e++)if(a[e]){var f=pd[e];var g=c.add();try{var h=Ck(e,{J:g,I:g,terminate:g},b,e);h?d.push({ff:e,af:zd(f),oc:h}):(Ik(e,b),g())}catch(m){g()}}c.pg();d.sort(Jk);for(var l=0;l<d.length;l++)d[l].oc();return 0<d.length};function Jk(a,b){var c,d=b.af,e=a.af;c=d>e?1:d<e?-1:0;var f;if(0!==c)f=c;else{var g=a.ff,h=b.ff;f=g>h?1:g<h?-1:0}return f}
function Ik(a,b){if(!fh)return;var c=function(d){var e=b.qd(pd[d])?"3":"4",f=xd(pd[d][Bd.De],b,[]);f&&f.length&&c(f[0].index);hh(b.id,pd[d],e);var g=xd(pd[d][Bd.Fe],b,[]);g&&g.length&&c(g[0].index)};c(a);}
var Lk=!1,Qk=function(a){var b=a["gtm.uniqueEventId"],c=a.event;if("gtm.js"===c){if(Lk)return!1;Lk=!0}var d=Sj(b),e=!1;if(!d.active){var f=!0;if("gtm.js"===c){f=!1,e=!0,d=Sj(Number.MAX_SAFE_INTEGER);}if(f)return!1}fh&&!Xg[b]&&Tg!==b&&(Pg(),Tg=b,$g=Vg="",dh[b]="&e="+(0===c.indexOf("gtm.")?encodeURIComponent(c):"*")+"&eid="+b,Sg());
var g={id:b,name:c,qd:Qj(d.isAllowed),Xh:[],We:function(){I(6)},Je:Mk(b)},h=jk(b,a.eventCallback,a.eventTimeout);Nk(b);var l=Ld(g);e&&(l=Ok(l));var m=Kk(l,g,h);"gtm.js"!==c&&"gtm.sync"!==c||uk(Qd.C);switch(c){case "gtm.init":I(19),m&&I(20)}return Pk(l,
m)};function Mk(a){return function(b){fh&&(xb(b)||jh(a,"input",b))}}function Nk(a){th(a,"event",1);th(a,"ecommerce",1);th(a,"gtm");}
function Ok(a){var b=[];for(var c=0;c<a.length;c++)a[c]&&Bg[String(pd[c][Bd.Ga])]&&(b[c]=!0);return b}function Pk(a,b){if(!b)return b;for(var c=0;c<a.length;c++)if(a[c]&&pd[c]&&!Cg[String(pd[c][Bd.Ga])])return!0;return!1}function Rk(a,b){if(a){var c=""+a;0!==c.indexOf("http://")&&0!==c.indexOf("https://")&&(c="https://"+c);"/"===c[c.length-1]&&(c=c.substring(0,c.length-1));return Gh(""+c+b).href}}function Sk(a,b){return Tk()?Rk(a,b):void 0}function Tk(){var a=!1;return a};var Uk=function(){this.eventModel={};this.targetConfig={};this.containerConfig={};this.a={};this.globalConfig={};this.J=function(){};this.I=function(){};this.eventId=void 0},Vk=function(a){var b=new Uk;b.eventModel=a;return b},Wk=function(a,b){a.targetConfig=b;return a},Xk=function(a,b){a.containerConfig=b;return a},Yk=function(a,b){a.a=b;return a},Zk=function(a,b){a.globalConfig=b;return a},$k=function(a,b){a.J=b;return a},al=function(a,b){a.I=b;return a};
Uk.prototype.getWithConfig=function(a){if(void 0!==this.eventModel[a])return this.eventModel[a];if(void 0!==this.targetConfig[a])return this.targetConfig[a];if(void 0!==this.containerConfig[a])return this.containerConfig[a];if(void 0!==this.a[a])return this.a[a];if(void 0!==this.globalConfig[a])return this.globalConfig[a]};
var bl=function(a){function b(e){Na(e,function(f){c[f]=null})}var c={};b(a.eventModel);b(a.targetConfig);b(a.containerConfig);b(a.globalConfig);var d=[];Na(c,function(e){d.push(e)});return d};var cl;if(3===Qd.cc.length)cl="g";else{var dl="G";cl=dl}
var el={"":"n",UA:"u",AW:"a",DC:"d",G:"e",GF:"f",HA:"h",GTM:cl,OPT:"o"},fl=function(a){var b=Qd.C.split("-"),c=b[0].toUpperCase(),d=el[c]||"i",e=a&&"GTM"===c?b[1]:"OPT"===c?b[1]:"",f;if(3===Qd.cc.length){var g="w";f="2"+g}else f="";return f+d+Qd.cc+e};var gl=function(a,b){a.addEventListener&&a.addEventListener("message",b,!1)};var hl=function(){return pf("iPhone")&&!pf("iPod")&&!pf("iPad")};pf("Opera");pf("Trident")||pf("MSIE");pf("Edge");!pf("Gecko")||-1!=mf.toLowerCase().indexOf("webkit")&&!pf("Edge")||pf("Trident")||pf("MSIE")||pf("Edge");-1!=mf.toLowerCase().indexOf("webkit")&&!pf("Edge")&&pf("Mobile");pf("Macintosh");pf("Windows");pf("Linux")||pf("CrOS");var il=ma.navigator||null;il&&(il.appVersion||"").indexOf("X11");pf("Android");hl();pf("iPad");pf("iPod");hl()||pf("iPad")||pf("iPod");mf.toLowerCase().indexOf("kaios");var jl=function(a,b){for(var c=a,d=0;50>d;++d){var e;try{e=!(!c.frames||!c.frames[b])}catch(h){e=!1}if(e)return c;var f;a:{try{var g=c.parent;if(g&&g!=c){f=g;break a}}catch(h){}f=null}if(!(c=f))break}return null};var kl=function(){};var ll=function(a,b){this.i=a;this.a=null;this.B={};this.P=0;this.F=void 0===b?500:b;this.m=null};la(ll,kl);var nl=function(a){return"function"===typeof a.i.__tcfapi||null!=ml(a)};
ll.prototype.addEventListener=function(a){var b={},c=jf(function(){return a(b)}),d=0;-1!==this.F&&(d=setTimeout(function(){b.tcString="tcunavailable";b.internalErrorState=1;c()},this.F));var e=function(f,g){clearTimeout(d);f?(b=f,b.internalErrorState=void 0!==b.tcString&&"string"!==typeof b.tcString||void 0!==b.gdprApplies&&"boolean"!==typeof b.gdprApplies||void 0!==b.listenerId&&"number"!==typeof b.listenerId||void 0!==b.addtlConsent&&"string"!==typeof b.addtlConsent?2:b.cmpStatus&&"error"!==b.cmpStatus?
0:3,g&&0===b.internalErrorState||(b.tcString="tcunavailable",g||(b.internalErrorState=3))):(b.tcString="tcunavailable",b.internalErrorState=3);a(b)};try{ol(this,"addEventListener",e)}catch(f){b.tcString="tcunavailable",b.internalErrorState=3,d&&(clearTimeout(d),d=0),c()}};ll.prototype.removeEventListener=function(a){a&&a.listenerId&&ol(this,"removeEventListener",null,a.listenerId)};
var ql=function(a,b,c){if(!a.purpose||!a.vendor)return!1;var d=pl(a.vendor.consents,void 0===c?"755":c);return d&&"1"===b&&a.purposeOneTreatment&&"DE"===a.publisherCC?!0:d&&pl(a.purpose.consents,b)},rl=function(a,b,c){var d;d=void 0===d?"755":d;var e;a:{if(a.publisher&&a.publisher.restrictions){var f=a.publisher.restrictions[b];if(void 0!==f){e=f[void 0===d?"755":d];break a}}e=void 0}var g=e;if(0===g)return!1;var h=c;2===c?(h=0,2===g&&(h=1)):3===c&&(h=1,1===g&&(h=0));return 0===h?ql(a,b,d):1===h?
a.purpose&&a.vendor?pl(a.purpose.legitimateInterests,b)&&pl(a.vendor.legitimateInterests,void 0===d?"755":d):!1:!0},pl=function(a,b){return!(!a||!a[b])},ol=function(a,b,c,d){c||(c=function(){});if("function"===typeof a.i.__tcfapi){var e=a.i.__tcfapi;e(b,2,c,d)}else if(ml(a)){sl(a);var f=++a.P;a.B[f]=c;if(a.a){var g={};a.a.postMessage((g.__tcfapiCall={command:b,version:2,callId:f,parameter:d},g),"*")}}else c({},!1)},ml=function(a){if(a.a)return a.a;a.a=jl(a.i,"__tcfapiLocator");return a.a},sl=function(a){a.m||
(a.m=function(b){try{var c,d;"string"===typeof b.data?d=JSON.parse(b.data):d=b.data;c=d.__tcfapiReturn;a.B[c.callId](c.returnValue,c.success)}catch(e){}},gl(a.i,a.m))};var tl={1:0,3:0,4:0,7:3,9:3,10:3};function ul(a,b){if(""===a)return b;var c=Number(a);return isNaN(c)?b:c}var vl=ul("",550),wl=ul("",500);function xl(){var a=Q.tcf||{};return Q.tcf=a}
var yl=function(a,b){this.m=a;this.a=b;this.i=Ta();},zl=function(a){},Al=function(a){},Gl=function(){var a=xl(),b=new ll(B,3E3),c=new yl(b,a);if((Bl()?!0===B.gtag_enable_tcf_support:!1!==B.gtag_enable_tcf_support)&&!a.active&&("function"===typeof B.__tcfapi||nl(b))){a.active=!0;a.Fb={};Cl();var d=setTimeout(function(){Dl(a);El(a);d=null},wl);try{b.addEventListener(function(e){d&&(clearTimeout(d),d=null);if(0!==e.internalErrorState)Dl(a),El(a),zl(c);else{var f;if(!1===e.gdprApplies)f=Fl(),b.removeEventListener(e);
else if("tcloaded"===e.eventStatus||"useractioncomplete"===e.eventStatus||"cmpuishown"===e.eventStatus){var g={},h;for(h in tl)tl.hasOwnProperty(h)&&("1"===h?g["1"]=!1===e.gdprApplies||"error"===e.cmpStatus||0!==e.internalErrorState||"loaded"===e.cmpStatus&&("tcloaded"===e.eventStatus||"useractioncomplete"===e.eventStatus)?!1===e.gdprApplies||"tcunavailable"===e.tcString?!0:Pf("tcf_restrictions")?rl(e,"1",0):ql(e,"1"):!1:g[h]=rl(e,h,tl[h]));f=g}f&&(a.tcString=e.tcString||"tcempty",a.Fb=f,El(a),zl(c))}}),
Al(c)}catch(e){d&&(clearTimeout(d),d=null),Dl(a),El(a)}}};function Dl(a){a.type="e";a.tcString="tcunavailable";a.Fb=Fl()}function Cl(){var a={};dg((a.ad_storage="denied",a.wait_for_update=vl,a))}var Bl=function(){var a=!1;a=!0;return a};function Fl(){var a={},b;for(b in tl)tl.hasOwnProperty(b)&&(a[b]=!0);return a}function El(a){var b={};eg((b.ad_storage=a.Fb["1"]?"granted":"denied",b))}
var Hl=function(){var a=xl();if(a.active&&void 0!==a.loadTime)return Number(a.loadTime)},Il=function(){var a=xl();return a.active?a.tcString||"":""},Jl=function(a){if(!tl.hasOwnProperty(String(a)))return!0;var b=xl();return b.active&&b.Fb?!!b.Fb[String(a)]:!0};function Kl(a,b,c){function d(r){var t;Q.reported_gclid||(Q.reported_gclid={});t=Q.reported_gclid;var q=f+(r?"gcu":"gcs");if(!t[q]){t[q]=!0;var v=[],u=function(A,z){z&&v.push(A+"="+encodeURIComponent(z))},w="https://www.google.com";if(Zf()){var y=fg(H.o);u("gcs",gg());r&&u("gcu","1");u("rnd",n);if((!f||g&&"aw.ds"!==g)&&fg(H.o)){var x=Vi("_gcl_aw");u("gclaw",x.join("."))}u("url",String(B.location).split(/[?#]/)[0]);u("dclid",Ll(b,h));!y&&b&&(w="https://pagead2.googlesyndication.com")}
u("gdpr_consent",Il());"1"===Ei(!1)._up&&u("gtm_up","1");u("gclid",Ll(b,f));u("gclsrc",g);u("gtm",fl(!c));var C=w+"/pagead/landing?"+v.join("&");Mf(C)}}var e=Yi(),f=e.gclid||"",g=e.gclsrc,h=e.dclid||"",l=!a&&(!f||g&&"aw.ds"!==g?!1:!0),m=Zf();if(l||m){var n=""+Xh();m?hg(function(){d();fg(H.o)||bg(function(r){return d(!0,r.Ke)},H.o)},[H.o]):d()}}function Ll(a,b){var c=a&&!fg(H.o);return b&&c?"0":b}var Ml=function(a){if(M.hidden)return!0;var b=a.getBoundingClientRect();if(b.top==b.bottom||b.left==b.right||!B.getComputedStyle)return!0;var c=B.getComputedStyle(a,null);if("hidden"===c.visibility)return!0;for(var d=a,e=c;d;){if("none"===e.display)return!0;var f=e.opacity,g=e.filter;if(g){var h=g.indexOf("opacity(");0<=h&&(g=g.substring(h+8,g.indexOf(")",h)),"%"==g.charAt(g.length-1)&&(g=g.substring(0,g.length-1)),f=Math.min(g,f))}if(void 0!==f&&0>=f)return!0;(d=d.parentElement)&&(e=B.getComputedStyle(d,
null))}return!1};
var Nl=function(){var a=M.body,b=M.documentElement||a&&a.parentElement,c,d;if(M.compatMode&&"BackCompat"!==M.compatMode)c=b?b.clientHeight:0,d=b?b.clientWidth:0;else{var e=function(f,g){return f&&g?Math.min(f,g):Math.max(f,g)};I(7);c=e(b?b.clientHeight:0,a?a.clientHeight:0);d=e(b?b.clientWidth:0,a?a.clientWidth:0)}return{width:d,height:c}},Ol=function(a){var b=Nl(),c=b.height,d=b.width,e=a.getBoundingClientRect(),f=e.bottom-e.top,g=e.right-e.left;return f&&g?(1-Math.min((Math.max(0-e.left,0)+Math.max(e.right-
d,0))/g,1))*(1-Math.min((Math.max(0-e.top,0)+Math.max(e.bottom-c,0))/f,1)):0};var Vl=new RegExp(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i),Xl=["SCRIPT","IMG","SVG","PATH"];function Yl(a){var b;if(a===M.body)b="body";else{var c;if(a.id)c="#"+a.id;else{var d;if(a.parentElement){var e;a:{var f=a.parentElement;if(f){for(var g=0;g<f.childElementCount;g++)if(f.children[g]===a){e=g+1;break a}e=-1}else e=1}d=Yl(a.parentElement)+">:nth-child("+e+")"}else d="";c=d}b=c}return b}
var Zl=function(){var a;var b=[],c=M.body;if(c){for(var d=c.querySelectorAll("*"),e=0;e<d.length&&1E4>e;e++){var f=d[e];0<=Xl.indexOf(f.tagName.toUpperCase())||0===f.childElementCount&&b.push(f)}a={elements:b,status:1E4<d.length?"2":"1"}}else a={elements:b,status:"4"};for(var g=a,h=g.elements,l=[],m=0;m<h.length;m++){var n=h[m],r=n.textContent;n.value&&(r=n.value);r&&r.match(Vl)&&l.push(n)}for(var t=[],q=10<l.length?"3":g.status,v=0;v<l.length&&10>v;v++){var u=l[v];t.push({querySelector:Yl(u),tagName:u.tagName,
isVisible:!Ml(u),type:1})}return{elements:t,status:q}};var Hm=function(){var a=!0;Jl(7)&&Jl(9)&&Jl(10)||(a=!1);var b=!0;b=!1;b&&!Gm()&&(a=!1);return a},Gm=function(){var a=!0;Jl(3)&&Jl(4)||(a=!1);return a};function an(){var a=Q;return a.gcq=a.gcq||new bn}
var cn=function(a,b,c){an().register(a,b,c)},dn=function(a,b,c,d){an().push("event",[b,a],c,d)},en=function(a,b){an().push("config",[a],b)},fn=function(a,b,c){an().push("get",[a,b],c)},gn={},hn=function(){this.status=1;this.containerConfig={};this.targetConfig={};this.i={};this.m=null;this.a=!1},jn=function(a,b,c,d,e){this.type=a;this.m=b;this.ca=c||"";this.a=d;this.i=e},bn=function(){this.m={};this.i={};this.a=[]},kn=function(a,b){var c=qj(b);return a.m[c.containerId]=a.m[c.containerId]||new hn},
ln=function(a,b,c){if(b){var d=qj(b);if(d&&1===kn(a,b).status){kn(a,b).status=2;var e={};fh&&(e.timeoutId=B.setTimeout(function(){I(38);Sg()},3E3));a.push("require",[e],d.containerId);gn[d.containerId]=Ta();if(tj()){}else{var g="/gtag/js?id="+
encodeURIComponent(d.containerId)+"&l=dataLayer&cx=c",h=("http:"!=B.location.protocol?"https:":"http:")+("//www.googletagmanager.com"+g),l=Sk(c,g)||h;Cf(l)}}}},mn=function(a,b,c,d){if(d.ca){var e=kn(a,d.ca),f=e.m;if(f){var g=E(c),h=E(e.targetConfig[d.ca]),l=E(e.containerConfig),m=E(e.i),n=E(a.i),r=ph("gtm.uniqueEventId"),t=qj(d.ca).prefix,q=al($k(Zk(Yk(Xk(Wk(Vk(g),h),l),m),n),function(){ih(r,t,"2");}),function(){
ih(r,t,"3");});try{ih(r,t,"1");f(d.ca,b,d.m,q)}catch(v){ih(r,t,"4");}}}};
bn.prototype.register=function(a,b,c){if(3!==kn(this,a).status){kn(this,a).m=b;kn(this,a).status=3;c&&(kn(this,a).i=c);var d=qj(a),e=gn[d.containerId];if(void 0!==e){var f=Q[d.containerId].bootstrap,g=d.prefix.toUpperCase();Q[d.containerId]._spx&&(g=g.toLowerCase());var h=ph("gtm.uniqueEventId"),l=g,m=Ta()-f;if(fh&&!Xg[h]){h!==Tg&&(Pg(),Tg=h);var n=l+"."+Math.floor(f-e)+"."+Math.floor(m);ah=ah?ah+","+n:"&cl="+n}delete gn[d.containerId]}this.flush()}};
bn.prototype.push=function(a,b,c,d){var e=Math.floor(Ta()/1E3);ln(this,c,b[0][H.Fa]||this.i[H.Fa]);this.a.push(new jn(a,e,c,b,d));d||this.flush()};
bn.prototype.flush=function(a){for(var b=this;this.a.length;){var c=this.a[0];if(c.i)c.i=!1,this.a.push(c);else switch(c.type){case "require":if(3!==kn(this,c.ca).status&&!a)return;fh&&B.clearTimeout(c.a[0].timeoutId);break;case "set":Na(c.a[0],function(n,r){E(bb(n,r),b.i)});break;case "config":var d=c.a[0],e=!!d[H.Yb];delete d[H.Yb];var f=kn(this,c.ca),g=qj(c.ca),h=g.containerId===g.id;e||(h?f.containerConfig={}:f.targetConfig[c.ca]={});f.a&&e||mn(this,H.ka,d,c);f.a=!0;delete d[H.ub];h?E(d,f.containerConfig):
E(d,f.targetConfig[c.ca]);break;case "event":mn(this,c.a[1],c.a[0],c);break;case "get":}this.a.shift()}};var nn=function(a,b,c){};var on=function(a,b,c,d){};var pn=function(a){};var qn=function(a,b,c){};var rn=function(a,b){return!0};var sn=function(a,b){var c;return c};var tn=function(a){};var un=!1,vn=[];function wn(){if(!un){un=!0;for(var a=0;a<vn.length;a++)N(vn[a])}}var xn=function(a){un?N(a):vn.push(a)};var yn=function(a){F(this.i.a,["listener:!Fn"],arguments);Ne(this,"process_dom_events","window","load");xn(pb(a))};var zn=function(a,b){var c;var d=vb(c,this.m);void 0===d&&void 0!==c&&I(45);return d};var An=function(a){var b;var h=vb(b,this.m);void 0===h&&void 0!==b&&I(45);return h};var Bn=function(a,b){var c=null;return vb(c,this.m)};var Cn=function(a){var b;return vb(b,this.m)};var Dn=function(a){var b;return b};var En=function(a,b){b=void 0===b?!0:b;var c;return c};var Fn=function(a){var b=null;return b};var Gn=function(a,b){var c;return c};var Hn=function(a,b){var c;return c};var In=function(a){var b="";return b};var Jn=function(a){var b="";return b};var Ze=function(){Ne(this,"get_user_agent");return B.navigator.userAgent};var Kn=function(a,b){};var Ln={},Mn=function(a,b,c,d){F(this.i.a,["url:!string","onSuccess:?Fn","onFailure:?Fn","cacheToken:?string"],arguments);Ne(this,"inject_script",a);var e=this.m,f=function(){b instanceof db&&b.Ka(e)},g=function(){c instanceof db&&c.Ka(e)};if(!d){Cf(a,f,g);return}var h=d;Ln[h]?(Ln[h].onSuccess.push(f),Ln[h].onFailure.push(g)):(Ln[h]={onSuccess:[f],onFailure:[g]},f=function(){for(var l=Ln[h].onSuccess,m=0;m<l.length;m++)N(l[m]);l.push=function(n){N(n);
return 0}},g=function(){for(var l=Ln[h].onFailure,m=0;m<l.length;m++)N(l[m]);Ln[h]=null},Cf(a,f,g));};var Nn=function(){return!1},On={getItem:function(a){var b=null;return b},setItem:function(a,
b){return!1},removeItem:function(a){}};var Pn=function(){};var Qn=function(a,b){var c=!1;return c};var Rn=function(){var a="";return a};var Sn=function(){var a="";return a};var Tn=function(a,b,c){};var Un=function(a,b,c,d){var e=this;d=void 0===d?!0:d;var f=!1;return f};var Vn=function(a,b,c){F(this.i.a,["path:!string","value:?*","overrideExisting:?boolean"],arguments);Ne(this,"access_globals","readwrite",a);var d=a.split("."),e=B,f;for(f=0;f<d.length-1;f++)if(e=e[d[f]],void 0===e)return!1;if(void 0===e[d[f]]||c)return e[d[f]]=ub(b,this.m),!0;return!1};var Wn=function(a){for(var b=[],c=0,d=0;d<a.length;d++){var e=a.charCodeAt(d);128>e?b[c++]=e:(2048>e?b[c++]=e>>6|192:(55296==(e&64512)&&d+1<a.length&&56320==(a.charCodeAt(d+1)&64512)?(e=65536+((e&1023)<<10)+(a.charCodeAt(++d)&1023),b[c++]=e>>18|240,b[c++]=e>>12&63|128):b[c++]=e>>12|224,b[c++]=e>>6&63|128),b[c++]=e&63|128)}return b};var Xn=function(a,b,c){var d=this;};var Yn={},Zn={};Yn.getItem=function(a){var b=null;return b};
Yn.setItem=function(a,b){};
Yn.removeItem=function(a){};Yn.clear=function(){};var $n=function(a){var b;return b};var Mc=function(){var a=new Ye;tj()?(a.add("injectHiddenIframe",Ea),a.add("injectScript",Ea)):(a.add("injectHiddenIframe",Kn),a.add("injectScript",Mn));var b=Tn;a.add("Math",Ge());a.add("TestHelper",af());a.add("addEventCallback",pn);a.add("aliasInWindow",rn);a.add("assertApi",Ce);a.add("assertThat",De);a.add("callInWindow",
sn);a.add("callLater",tn);a.add("copyFromDataLayer",zn);a.add("copyFromWindow",An);a.add("createArgumentsQueue",Bn);a.add("createQueue",Cn);a.add("decodeUri",He);a.add("decodeUriComponent",Ie);a.add("encodeUri",Je);a.add("encodeUriComponent",Ke);a.add("fail",Le);a.add("fromBase64",Dn,!("atob"in B));a.add("generateRandom",Me);a.add("getContainerVersion",Oe);a.add("getCookieValues",En);a.add("getQueryParameters",Gn);a.add("getReferrerQueryParameters",Hn);a.add("getReferrerUrl",In);a.add("getTimestamp",
Pe);a.add("getTimestampMillis",Pe);a.add("getType",Qe);a.add("getUrl",Jn);a.add("localStorage",On,!Nn());a.add("logToConsole",Pn);a.add("makeInteger",Se);a.add("makeNumber",Te);a.add("makeString",Ue);a.add("makeTableMap",Ve);a.add("mock",Xe);a.add("queryPermission",Qn);a.add("readCharacterSet",Rn);a.add("readTitle",Sn);a.add("sendPixel",b);a.add("setCookie",Un);a.add("setInWindow",Vn);a.add("sha256",Xn);a.add("templateStorage",Yn);a.add("toBase64",$n,!("btoa"in B));a.add("JSON",Re(function(c){var d=this.m.a;d&&d.log.call(this,"error",c)}));
return function(c){var d;if(a.a.hasOwnProperty(c))d=a.get(c,this);else{var e;if(e=a.i.hasOwnProperty(c))b:{var f=this.m.a;if(f){var g=f.zb();if(g&&0!==g.indexOf("__cvt_")){e=!0;break b}}e=!1}if(e)d=a.i.hasOwnProperty(c)?a.i[c]:void 0;else throw Error(c+" is not a valid API name.");}return d}};var Kc,Ud;
function ao(){var a=data.runtime||[],b=data.runtime_lines;Kc=new Ic;bo();ld=function(e,f,g){co(f);var h=new ib;Na(f,function(q,v){var u=vb(v);void 0===u&&void 0!==v&&I(44);h.set(q,u)});Kc.a.a.B=Hd();var l={qg:Vd(e),eventId:void 0!==g?g.id:void 0,zb:function(){return e},log:function(){}};if(Ak()){var m=Bk(),n=void 0,r=void 0;l.da={i:{},a:function(q,v,u){1===v&&(n=q);7===v&&(r=u);m(q,v,u)},m:We()};l.log=function(q,v){if(n){var u=Array.prototype.slice.call(arguments,1);m(n,4,{level:q,source:r,message:u})}}}var t=
Lc(l,[e,h]);Kc.a.a.B=void 0;t instanceof ta&&"return"===t.a&&(t=t.i);return ub(t)};Nc();for(var c=0;c<a.length;c++){var d=a[c];if(!Ha(d)||3>d.length){if(0===d.length)continue;break}b&&b[c]&&b[c].length&&Dd(d,b[c]);Kc.oc(d)}}function co(a){var b=a.gtmOnSuccess,c=a.gtmOnFailure;Fa(b)&&(a.gtmOnSuccess=function(){N(b)});Fa(c)&&(a.gtmOnFailure=function(){N(c)})}
function bo(){var a=Kc;Q.SANDBOXED_JS_SEMAPHORE=Q.SANDBOXED_JS_SEMAPHORE||0;Oc(a,function(b,c,d){Q.SANDBOXED_JS_SEMAPHORE++;try{return b.apply(c,d)}finally{Q.SANDBOXED_JS_SEMAPHORE--}})}function eo(a){void 0!==a&&Na(a,function(b,c){for(var d=0;d<c.length;d++){var e=c[d].replace(/^_*/,"");Lg[e]=Lg[e]||[];Lg[e].push(b)}})};var fo="HA GF G UA AW DC".split(" "),go=!1,ho={},io=!1;function jo(a,b){var c={event:a};b&&(c.eventModel=E(b),b[H.Nc]&&(c.eventCallback=b[H.Nc]),b[H.Vb]&&(c.eventTimeout=b[H.Vb]));return c}function ko(){return go}
var no={config:function(a){},event:function(a){var b=a[1];if(p(b)&&!(3<a.length)){var c;if(2<a.length){if(!nb(a[2])&&
void 0!=a[2])return;c=a[2]}var d=jo(b,c);return d}},js:function(a){if(2==a.length&&a[1].getTime)return io=!0,ko(),{event:"gtm.js","gtm.start":a[1].getTime()}},policy:function(a){if(3===a.length){var b=a[1],c=a[2],d=Ud.i;d.a[b]?d.a[b].push(c):d.a[b]=[c]}},set:function(a){var b;2==a.length&&nb(a[1])?b=E(a[1]):3==a.length&&p(a[1])&&(b={},nb(a[2])||Ha(a[2])?b[a[1]]=E(a[2]):b[a[1]]=a[2]);if(b){b._clear=!0;return b}},consent:function(a){function b(){ko()&&E(a[2],{subcommand:a[1]})}if(3===a.length){I(39);var c=Mg(),d=a[1];"default"===d?(b(),dg(a[2])):"update"===d&&(b(),eg(a[2],c))}}};var oo={policy:!0};
var po=function(a,b){var c=a.hide;if(c&&void 0!==c[b]&&c.end){c[b]=!1;var d=!0,e;for(e in c)if(c.hasOwnProperty(e)&&!0===c[e]){d=!1;break}d&&(c.end(),c.end=null)}},ro=function(a){var b=qo(),c=b&&b.hide;c&&c.end&&(c[a]=!0)};var Io=function(a){if(Ho(a))return a;this.a=a};Io.prototype.$g=function(){return this.a};var Ho=function(a){return!a||"object"!==lb(a)||nb(a)?!1:"getUntrustedUpdateValue"in a};Io.prototype.getUntrustedUpdateValue=Io.prototype.$g;var Jo=[],Ko=!1,Lo=function(a){return B["dataLayer"].push(a)},Mo=function(a){var b=Q["dataLayer"],c=b?b.subscribers:1,d=0;return function(){++d===c&&a()}};function No(a){var b=a._clear;Na(a,function(d,e){"_clear"!==d&&(b&&sh(d,void 0),sh(d,e))});Hg||(Hg=a["gtm.start"]);var c=a["gtm.uniqueEventId"];if(!a.event)return!1;c||(c=Mg(),a["gtm.uniqueEventId"]=c,sh("gtm.uniqueEventId",c));return Qk(a)}
function Oo(){for(var a=!1;!Ko&&0<Jo.length;){Ko=!0;delete mh.eventModel;oh();var b=Jo.shift();if(null!=b){var c=Ho(b);if(c){var d=b;b=Ho(d)?d.getUntrustedUpdateValue():void 0;for(var e=["gtm.allowlist","gtm.blocklist","gtm.whitelist","gtm.blacklist","tagTypeBlacklist"],f=0;f<e.length;f++){var g=e[f],h=ph(g,1);if(Ha(h)||nb(h))h=E(h);nh[g]=h}}try{if(Fa(b))try{b.call(qh)}catch(u){}else if(Ha(b)){var l=
b;if(p(l[0])){var m=l[0].split("."),n=m.pop(),r=l.slice(1),t=ph(m.join("."),2);if(void 0!==t&&null!==t)try{t[n].apply(t,r)}catch(u){}}}else{if(Oa(b)){a:{var q=b;if(q.length&&p(q[0])){var v=no[q[0]];if(v&&(!c||!oo[q[0]])){b=v(q);break a}}b=void 0}if(!b){Ko=!1;continue}}a=No(b)||a}}finally{c&&oh(!0)}}Ko=!1}return!a}
function Po(){var a=Oo();try{po(B["dataLayer"],Qd.C)}catch(b){}return a}
var Ro=function(){var a=Af("dataLayer",[]),b=Af("google_tag_manager",{});b=b["dataLayer"]=b["dataLayer"]||{};bk(function(){b.gtmDom||(b.gtmDom=!0,a.push({event:"gtm.dom"}))});xn(function(){b.gtmLoad||(b.gtmLoad=!0,a.push({event:"gtm.load"}))});b.subscribers=(b.subscribers||0)+1;var c=a.push;a.push=function(){var e;if(0<Q.SANDBOXED_JS_SEMAPHORE){e=[];for(var f=0;f<arguments.length;f++)e[f]=new Io(arguments[f])}else e=[].slice.call(arguments,0);var g=c.apply(a,e);Jo.push.apply(Jo,e);if(300<
this.length)for(I(4);300<this.length;)this.shift();var h="boolean"!==typeof g||g;return Oo()&&h};var d=a.slice(0);Jo.push.apply(Jo,d);Qo()&&N(Po)},Qo=function(){var a=!0;return a};var So={};So.Zb=new String("undefined");
var To=function(a){this.a=function(b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]===So.Zb?b:a[d]);return c.join("")}};To.prototype.toString=function(){return this.a("undefined")};To.prototype.valueOf=To.prototype.toString;So.dg=To;So.Zc={};So.Ig=function(a){return new To(a)};var Uo={};So.Lh=function(a,b){var c=Mg();Uo[c]=[a,b];return c};So.Ne=function(a){var b=a?0:1;return function(c){var d=Uo[c];if(d&&"function"===typeof d[b])d[b]();Uo[c]=void 0}};So.ih=function(a){for(var b=!1,c=!1,d=2;d<a.length;d++)b=
b||8===a[d],c=c||16===a[d];return b&&c};So.Dh=function(a){if(a===So.Zb)return a;var b=Mg();So.Zc[b]=a;return'google_tag_manager["'+Qd.C+'"].macro('+b+")"};So.uh=function(a,b,c){a instanceof So.dg&&(a=a.a(So.Lh(b,c)),b=Ea);return{od:a,J:b}};var Vo=function(a,b,c){function d(f,g){var h=f[g];return h}var e={event:b,"gtm.element":a,"gtm.elementClasses":d(a,"className"),"gtm.elementId":a["for"]||If(a,"id")||"","gtm.elementTarget":a.formTarget||d(a,"target")||""};c&&(e["gtm.triggers"]=c.join(","));e["gtm.elementUrl"]=(a.attributes&&a.attributes.formaction?a.formAction:"")||a.action||d(a,"href")||a.src||a.code||a.codebase||
"";return e},Wo=function(a){Q.hasOwnProperty("autoEventsSettings")||(Q.autoEventsSettings={});var b=Q.autoEventsSettings;b.hasOwnProperty(a)||(b[a]={});return b[a]},Xo=function(a,b,c){Wo(a)[b]=c},Yo=function(a,b,c,d){var e=Wo(a),f=Ua(e,b,d);e[b]=c(f)},Zo=function(a,b,c){var d=Wo(a);return Ua(d,b,c)};var $o=["input","select","textarea"],ap=["button","hidden","image","reset","submit"],bp=function(a){var b=a.tagName.toLowerCase();return!Ja($o,function(c){return c===b})||"input"===b&&Ja(ap,function(c){return c===a.type.toLowerCase()})?!1:!0},cp=function(a){return a.form?a.form.tagName?a.form:M.getElementById(a.form):Lf(a,["form"],100)},dp=function(a,b,c){if(!a.elements)return 0;for(var d=b.getAttribute(c),e=0,f=1;e<a.elements.length;e++){var g=a.elements[e];if(bp(g)){if(g.getAttribute(c)===d)return f;
f++}}return 0};var ep=!!B.MutationObserver,fp=void 0,gp=function(a){if(!fp){var b=function(){var c=M.body;if(c)if(ep)(new MutationObserver(function(){for(var e=0;e<fp.length;e++)N(fp[e])})).observe(c,{childList:!0,subtree:!0});else{var d=!1;Gf(c,"DOMNodeInserted",function(){d||(d=!0,N(function(){d=!1;for(var e=0;e<fp.length;e++)N(fp[e])}))})}};fp=[];M.body?b():N(b)}fp.push(a)};var sp=B.clearTimeout,tp=B.setTimeout,T=function(a,b,c){if(tj()){b&&N(b)}else return Cf(a,b,c)},up=function(){return new Date},vp=function(){return B.location.href},wp=function(a){return Eh(Gh(a),"fragment")},xp=function(a){return Fh(Gh(a))},yp=function(a,b){return ph(a,b||2)},zp=function(a,b,c){var d;b?(a.eventCallback=b,c&&(a.eventTimeout=c),d=Lo(a)):d=Lo(a);return d},Ap=function(a,b){B[a]=b},U=function(a,b,c){b&&
(void 0===B[a]||c&&!B[a])&&(B[a]=b);return B[a]},Bp=function(a,b,c){return Lh(a,b,void 0===c?!0:!!c)},Cp=function(a,b,c){return 0===Uh(a,b,c)},Dp=function(a,b){if(tj()){b&&N(b)}else Ef(a,b)},Ep=function(a){return!!Zo(a,"init",!1)},Fp=function(a){Xo(a,"init",!0)},Gp=function(a,b){var c=(void 0===b?0:b)?"www.googletagmanager.com/gtag/js":Fg;c+="?id="+encodeURIComponent(a)+"&l=dataLayer";T(vj("https://","http://",c))},Hp=function(a,
b){var c=a[b];return c},Ip=function(a,b,c){fh&&(xb(a)||jh(c,b,a))};
var Jp=So.uh;function fq(a,b){a=String(a);b=String(b);var c=a.length-b.length;return 0<=c&&a.indexOf(b,c)==c}var gq=new La;function hq(a,b){function c(g){var h=Gh(g),l=Eh(h,"protocol"),m=Eh(h,"host",!0),n=Eh(h,"port"),r=Eh(h,"path").toLowerCase().replace(/\/$/,"");if(void 0===l||"http"==l&&"80"==n||"https"==l&&"443"==n)l="web",n="default";return[l,m,n,r]}for(var d=c(String(a)),e=c(String(b)),f=0;f<d.length;f++)if(d[f]!==e[f])return!1;return!0}
function iq(a){return jq(a)?1:0}
function jq(a){var b=a.arg0,c=a.arg1;if(a.any_of&&Ha(c)){for(var d=0;d<c.length;d++){var e=E(a,{});E({arg1:c[d],any_of:void 0},e);if(iq(e))return!0}return!1}switch(a["function"]){case "_cn":return 0<=String(b).indexOf(String(c));case "_css":var f;a:{if(b){var g=["matches","webkitMatchesSelector","mozMatchesSelector","msMatchesSelector","oMatchesSelector"];try{for(var h=0;h<g.length;h++)if(b[g[h]]){f=b[g[h]](c);break a}}catch(q){}}f=!1}return f;case "_ew":return fq(b,c);case "_eq":return String(b)==
String(c);case "_ge":return Number(b)>=Number(c);case "_gt":return Number(b)>Number(c);case "_lc":var l;l=String(b).split(",");return 0<=Ia(l,String(c));case "_le":return Number(b)<=Number(c);case "_lt":return Number(b)<Number(c);case "_re":var m;var n=a.ignore_case?"i":void 0;try{var r=String(c)+n,t=gq.get(r);t||(t=new RegExp(c,n),gq.set(r,t));m=t.test(b)}catch(q){m=!1}return m;case "_sw":return 0==String(b).indexOf(String(c));case "_um":return hq(b,c)}return!1};var kq={},lq=encodeURI,X=encodeURIComponent,mq=Ff;var nq=function(a,b){if(!a)return!1;var c=Eh(Gh(a),"host");if(!c)return!1;for(var d=0;b&&d<b.length;d++){var e=b[d]&&b[d].toLowerCase();if(e){var f=c.length-e.length;0<f&&"."!=e.charAt(0)&&(f--,e="."+e);if(0<=f&&c.indexOf(e,f)==f)return!0}}return!1};
var oq=function(a,b,c){for(var d={},e=!1,f=0;a&&f<a.length;f++)a[f]&&a[f].hasOwnProperty(b)&&a[f].hasOwnProperty(c)&&(d[a[f][b]]=a[f][c],e=!0);return e?d:null};kq.jh=function(){var a=!1;return a};function Qr(){return B.gaGlobal=B.gaGlobal||{}}var Rr=function(){var a=Qr();a.hid=a.hid||Ka();return a.hid},Sr=function(a,b){var c=Qr();if(void 0==c.vid||b&&!c.from_cookie)c.vid=a,c.from_cookie=b};var as=window,bs=document,cs=function(a){var b=as._gaUserPrefs;if(b&&b.ioo&&b.ioo()||a&&!0===as["ga-disable-"+a])return!0;try{var c=as.external;if(c&&c._gaUserPrefs&&"oo"==c._gaUserPrefs)return!0}catch(f){}for(var d=Ih("AMP_TOKEN",String(bs.cookie),!0),e=0;e<d.length;e++)if("$OPT_OUT"==d[e])return!0;return bs.getElementById("__gaOptOutExtension")?!0:!1};function fs(a){delete a.eventModel[H.ub];hs(a.eventModel)}
var hs=function(a){Na(a,function(c){"_"===c.charAt(0)&&delete a[c]});var b=a[H.na]||{};Na(b,function(c){"_"===c.charAt(0)&&delete b[c]})};var ks=function(a,b,c){dn(b,c,a)},ls=function(a,b,c){dn(b,c,a,!0)},ns=function(a,b){};
function ms(a,b){}var Y={b:{}};
Y.b.vis=["google"],function(){var a={};(function(b){Y.__vis=b;Y.__vis.g="vis";Y.__vis.h=!0;Y.__vis.priorityOverride=0})(function(b){var c,d=[];d.push("CSS"===b.vtp_selectorType?b.vtp_elementSelector:"#"+b.vtp_elementId);d.push(b.vtp_outputMethod);"BOOLEAN"==b.vtp_outputMethod&&d.push(b.vtp_onScreenRatio);c=d.join("&");var e=a[c],f=Number(up());if(e&&250>f-e.time)return e.value;e={time:f,value:null};var g=b.vtp_outputMethod,h=null;if("CSS"==b.vtp_selectorType){var l=jg(b.vtp_elementSelector);l&&0<
l.length&&(h=l[0])}else h=M.getElementById(b.vtp_elementId);if(h)switch(g){case "BOOLEAN":var m=(Number(b.vtp_onScreenRatio)||50)/100;e.value=Ol(h)>=m&&!Ml(h);break;case "PERCENT":e.value=0,Ml(h)||(e.value=Math.round(1E3*Ol(h))/10)}a[c]=e;return e.value})}();

Y.b.jsm=["customScripts"],function(){(function(a){Y.__jsm=a;Y.__jsm.g="jsm";Y.__jsm.h=!0;Y.__jsm.priorityOverride=0})(function(a){if(void 0!==a.vtp_javascript){var b=a.vtp_javascript;try{var c=U("google_tag_manager");var d=c&&c.e&&c.e(b);Ip(d,"jsm",a.vtp_gtmEventId);return d}catch(e){}}})}();

Y.b.e=["google"],function(){(function(a){Y.__e=a;Y.__e.g="e";Y.__e.h=!0;Y.__e.priorityOverride=0})(function(a){return String(uh(a.vtp_gtmEventId,"event"))})}();
Y.b.f=["google"],function(){(function(a){Y.__f=a;Y.__f.g="f";Y.__f.h=!0;Y.__f.priorityOverride=0})(function(a){var b=yp("gtm.referrer",1)||M.referrer;return b?a.vtp_component&&"URL"!=a.vtp_component?Eh(Gh(String(b)),a.vtp_component,a.vtp_stripWww,a.vtp_defaultPages,a.vtp_queryKey):xp(String(b)):String(b)})}();
Y.b.cl=["google"],function(){function a(b){var c=b.target;if(c){var d=Vo(c,"gtm.click");zp(d)}}(function(b){Y.__cl=b;Y.__cl.g="cl";Y.__cl.h=!0;Y.__cl.priorityOverride=0})(function(b){if(!Ep("cl")){var c=U("document");Gf(c,"click",a,!0);Fp("cl")}N(b.vtp_gtmOnSuccess)})}();
Y.b.j=["google"],function(){(function(a){Y.__j=a;Y.__j.g="j";Y.__j.h=!0;Y.__j.priorityOverride=0})(function(a){for(var b=String(a.vtp_name).split("."),c=U(b.shift()),d=0;d<b.length;d++)c=c&&c[b[d]];Ip(c,"j",a.vtp_gtmEventId);return c})}();

Y.b.access_globals=["google"],function(){function a(b,c,d){var e={key:d,read:!1,write:!1,execute:!1};switch(c){case "read":e.read=!0;break;case "write":e.write=!0;break;case "readwrite":e.read=e.write=!0;break;case "execute":e.execute=!0;break;default:throw Error("Invalid access_globals request "+c);}return e}(function(b){Y.__access_globals=b;Y.__access_globals.g="access_globals";Y.__access_globals.h=!0;Y.__access_globals.priorityOverride=0})(function(b){for(var c=b.vtp_keys||[],d=b.vtp_createPermissionError,
e=[],f=[],g=[],h=0;h<c.length;h++){var l=c[h],m=l.key;l.read&&e.push(m);l.write&&f.push(m);l.execute&&g.push(m)}return{assert:function(n,r,t){if(!p(t))throw d(n,{},"Key must be a string.");if("read"===r){if(-1<Ia(e,t))return}else if("write"===r){if(-1<Ia(f,t))return}else if("readwrite"===r){if(-1<Ia(f,t)&&-1<Ia(e,t))return}else if("execute"===r){if(-1<Ia(g,t))return}else throw d(n,{},"Operation must be either 'read', 'write', or 'execute', was "+r);throw d(n,{},"Prohibited "+r+" on global variable: "+
t+".");},K:a}})}();
Y.b.tg=["google"],function(){function a(g){f.push(g);1<f.length||N(function(){var h=f.join(",");f=[];zp({event:"gtm.triggerGroup","gtm.triggers":h})})}function b(g,h){var l=c[h],m=l.indexOf(g);-1!==m&&(l.splice(m,1),l.length||a(h))}var c={},d={},e=[],f=[];(function(g){Y.__tg=g;Y.__tg.g="tg";Y.__tg.h=!0;Y.__tg.priorityOverride=0})(function(g){N(g.vtp_gtmOnSuccess);var h=g.vtp_uniqueTriggerId,l=g.vtp_triggerIds,m=g.vtp_firingId;
if(g.vtp_isListeningTag){var n=d[m];n?b(m,n):e.push(m)}else{c[h]=l;for(var r=0,t;t=l[r];r++)d[t]=h;for(var q=0;q<e.length;q++)b(e[q],h)}})}();
Y.b.u=["google"],function(){var a=function(b){return{toString:function(){return b}}};(function(b){Y.__u=b;Y.__u.g="u";Y.__u.h=!0;Y.__u.priorityOverride=0})(function(b){var c;b.vtp_customUrlSource?c=b.vtp_customUrlSource:c=yp("gtm.url",1);c=c||vp();var d=b[a("vtp_component")];if(!d||"URL"==d)return xp(String(c));var e=Gh(String(c)),f;if("QUERY"===d)a:{var g=b[a("vtp_multiQueryKeys").toString()],h=b[a("vtp_queryKey").toString()]||"",l=b[a("vtp_ignoreEmptyQueryParam").toString()],m;g?Ha(h)?m=h:m=String(h).replace(/\s+/g,
"").split(","):m=[String(h)];for(var n=0;n<m.length;n++){var r=Eh(e,"QUERY",void 0,void 0,m[n]);if(void 0!=r&&(!l||""!==r)){f=r;break a}}f=void 0}else f=Eh(e,d,"HOST"==d?b[a("vtp_stripWww")]:void 0,"PATH"==d?b[a("vtp_defaultPages")]:void 0,void 0);return f})}();
Y.b.v=["google"],function(){(function(a){Y.__v=a;Y.__v.g="v";Y.__v.h=!0;Y.__v.priorityOverride=0})(function(a){var b=a.vtp_name;if(!b||!b.replace)return!1;var c=yp(b.replace(/\\\./g,"."),a.vtp_dataLayerVersion||1),d=void 0!==c?c:a.vtp_defaultValue;Ip(d,"v",a.vtp_gtmEventId);return d})}();
Y.b.ua=["google"],function(){function a(m,n){if(Zf()&&!d[m]){var r=function(){var t=pk(),q="gtm"+Mg(),v=h(n),u={name:q};g(v,u,!0);t("create",m,u);t(function(){t.remove(q)})};bg(r,H.M);bg(r,H.o);d[m]=!0}}var b,c={},d={},e={name:!0,clientId:!0,sampleRate:!0,siteSpeedSampleRate:!0,alwaysSendReferrer:!0,allowAnchor:!0,allowLinker:!0,cookieName:!0,cookieDomain:!0,cookieExpires:!0,cookiePath:!0,cookieUpdate:!0,cookieFlags:!0,legacyCookieDomain:!0,legacyHistoryImport:!0,storage:!0,useAmpClientId:!0,storeGac:!0,
_cd2l:!0},f={allowAnchor:!0,allowLinker:!0,alwaysSendReferrer:!0,anonymizeIp:!0,cookieUpdate:!0,exFatal:!0,forceSSL:!0,javaEnabled:!0,legacyHistoryImport:!0,nonInteraction:!0,useAmpClientId:!0,useBeacon:!0,storeGac:!0,allowAdFeatures:!0,allowAdPersonalizationSignals:!0,_cd2l:!0},g=function(m,n,r){var t=0;if(m)for(var q in m)if(m.hasOwnProperty(q)&&(r&&e[q]||!r&&void 0===e[q])){var v=f[q]?Qa(m[q]):m[q];"anonymizeIp"!=q||v||(v=void 0);n[q]=v;t++}return t},h=function(m){var n={};m.vtp_gaSettings&&E(oq(m.vtp_gaSettings.vtp_fieldsToSet,
"fieldName","value"),n);E(oq(m.vtp_fieldsToSet,"fieldName","value"),n);fg(H.M)||(n.storage="none");fg(H.o)||(n.allowAdFeatures=!1,n.storeGac=!1);Hm()||(n.allowAdFeatures=!1);Gm()||(n.allowAdPersonalizationSignals=!1);m.vtp_transportUrl&&(n._x_19=m.vtp_transportUrl);return n},l=function(m){function n(ua,P){void 0!==P&&z("set",ua,P)}var r={},t={},q={},v={};if(m.vtp_gaSettings){var u=
m.vtp_gaSettings;E(oq(u.vtp_contentGroup,"index","group"),t);E(oq(u.vtp_dimension,"index","dimension"),q);E(oq(u.vtp_metric,"index","metric"),v);var w=E(u);w.vtp_fieldsToSet=void 0;w.vtp_contentGroup=void 0;w.vtp_dimension=void 0;w.vtp_metric=void 0;m=E(m,w)}E(oq(m.vtp_contentGroup,"index","group"),t);E(oq(m.vtp_dimension,"index","dimension"),q);E(oq(m.vtp_metric,"index","metric"),v);var y=h(m),x=rk(m.vtp_functionName);if(Fa(x)){var C="",A="";m.vtp_setTrackerName&&"string"==typeof m.vtp_trackerName?
""!==m.vtp_trackerName&&(A=m.vtp_trackerName,C=A+"."):(A="gtm"+Mg(),C=A+".");var z=function(ua){var P=[].slice.call(arguments,0);P[0]=C+P[0];x.apply(window,P)},D=function(ua,P){return void 0===P?P:ua(P)},G=function(ua,P){if(P)for(var Za in P)P.hasOwnProperty(Za)&&z("set",ua+Za,P[Za])},L=function(){},
O={name:A};g(y,O,!0);var W=m.vtp_trackingId||r.trackingId;x("create",W,O);z("set","&gtm",fl(!0));Zf()&&(z("set","&gcs",gg()),a(W,m));y._x_19&&(null==zf&&delete y._x_19,y._x_20&&!c[A]&&(c[A]=!0,x(vk(A,String(y._x_20)))));m.vtp_enableRecaptcha&&z("require","recaptcha","recaptcha.js");(function(ua,P){void 0!==m[P]&&z("set",ua,m[P])})("nonInteraction","vtp_nonInteraction");
G("contentGroup",t);G("dimension",q);G("metric",v);var ba={};g(y,ba,!1)&&z("set",ba);var ea;m.vtp_enableLinkId&&z("require","linkid","linkid.js");z("set","hitCallback",function(){var ua=y&&y.hitCallback;Fa(ua)&&ua();m.vtp_gtmOnSuccess()});if("TRACK_EVENT"==m.vtp_trackType){
m.vtp_enableEcommerce&&(z("require","ec","ec.js"),L());var J={hitType:"event",eventCategory:String(m.vtp_eventCategory||r.category),eventAction:String(m.vtp_eventAction||r.action),eventLabel:D(String,m.vtp_eventLabel||r.label),eventValue:D(Pa,m.vtp_eventValue||r.value)};g(ea,J,!1);z("send",J);}else if("TRACK_SOCIAL"==m.vtp_trackType){}else if("TRACK_TRANSACTION"==m.vtp_trackType){}else if("TRACK_TIMING"==m.vtp_trackType){}else if("DECORATE_LINK"==m.vtp_trackType){}else if("DECORATE_FORM"==m.vtp_trackType){}else if("TRACK_DATA"==
m.vtp_trackType){}else{m.vtp_enableEcommerce&&(z("require","ec","ec.js"),L());if(m.vtp_doubleClick||"DISPLAY_FEATURES"==m.vtp_advertisingFeaturesType){var ra="_dc_gtm_"+String(m.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");z("require","displayfeatures",void 0,{cookieName:ra})}if("DISPLAY_FEATURES_WITH_REMARKETING_LISTS"==m.vtp_advertisingFeaturesType){var Wa=
"_dc_gtm_"+String(m.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");z("require","adfeatures",{cookieName:Wa})}ea?z("send","pageview",ea):z("send","pageview");}if(!b){var hb=m.vtp_useDebugVersion?"u/analytics_debug.js":"analytics.js";m.vtp_useInternalVersion&&!m.vtp_useDebugVersion&&
(hb="internal/"+hb);b=!0;var dc=Sk(y._x_19,"/analytics.js"),hd=vj("https:","http:","//www.google-analytics.com/"+hb,y&&!!y.forceSSL);T("analytics.js"===hb&&dc?dc:hd,function(){var ua=pk();ua&&ua.loaded||m.vtp_gtmOnFailure();},m.vtp_gtmOnFailure)}}else N(m.vtp_gtmOnFailure)};(function(m){Y.__ua=m;Y.__ua.g="ua";Y.__ua.h=!0;Y.__ua.priorityOverride=0})(function(m){hg(function(){l(m)},
[H.M,H.o])})}();


Y.b.inject_script=["google"],function(){function a(b,c){return{url:c}}(function(b){Y.__inject_script=b;Y.__inject_script.g="inject_script";Y.__inject_script.h=!0;Y.__inject_script.priorityOverride=0})(function(b){var c=b.vtp_urls||[],d=b.vtp_createPermissionError;return{assert:function(e,f){if(!p(f))throw d(e,{},"Script URL must be a string.");try{if(te(Gh(f),c))return}catch(g){throw d(e,{},"Invalid script URL filter.");}throw d(e,{},"Prohibited script URL: "+f);},K:a}})}();





Y.b.aev=["google"],function(){function a(q,v){var u=uh(q,"gtm");if(u)return u[v]}function b(q,v,u,w){w||(w="element");var y=q+"."+v,x;if(n.hasOwnProperty(y))x=n[y];else{var C=a(q,w);if(C&&(x=u(C),n[y]=x,r.push(y),35<r.length)){var A=r.shift();delete n[A]}}return x}function c(q,v,u){var w=a(q,t[v]);return void 0!==w?w:u}function d(q,v){if(!q)return!1;var u=e(vp());Ha(v)||(v=String(v||"").replace(/\s+/g,"").split(","));for(var w=[u],y=0;y<v.length;y++){var x=v[y];if(x.hasOwnProperty("is_regex"))if(x.is_regex)try{x=
new RegExp(x.domain)}catch(A){continue}else x=x.domain;if(x instanceof RegExp){if(x.test(q))return!1}else{var C=x;if(0!=C.length){if(0<=e(q).indexOf(C))return!1;w.push(e(C))}}}return!nq(q,w)}function e(q){m.test(q)||(q="http://"+q);return Eh(Gh(q),"HOST",!0)}function f(q,v,u){switch(q){case "SUBMIT_TEXT":return b(v,"FORM."+q,g,"formSubmitElement")||u;case "LENGTH":var w=b(v,"FORM."+q,h);return void 0===w?u:w;case "INTERACTED_FIELD_ID":return l(v,"id",u);case "INTERACTED_FIELD_NAME":return l(v,"name",
u);case "INTERACTED_FIELD_TYPE":return l(v,"type",u);case "INTERACTED_FIELD_POSITION":var y=a(v,"interactedFormFieldPosition");return void 0===y?u:y;case "INTERACT_SEQUENCE_NUMBER":var x=a(v,"interactSequenceNumber");return void 0===x?u:x;default:return u}}function g(q){switch(q.tagName.toLowerCase()){case "input":return If(q,"value");case "button":return Jf(q);default:return null}}function h(q){if("form"===q.tagName.toLowerCase()&&q.elements){for(var v=0,u=0;u<q.elements.length;u++)bp(q.elements[u])&&
v++;return v}}function l(q,v,u){var w=a(q,"interactedFormField");return w&&If(w,v)||u}var m=/^https?:\/\//i,n={},r=[],t={ATTRIBUTE:"elementAttribute",CLASSES:"elementClasses",ELEMENT:"element",ID:"elementId",HISTORY_CHANGE_SOURCE:"historyChangeSource",HISTORY_NEW_STATE:"newHistoryState",HISTORY_NEW_URL_FRAGMENT:"newUrlFragment",HISTORY_OLD_STATE:"oldHistoryState",HISTORY_OLD_URL_FRAGMENT:"oldUrlFragment",TARGET:"elementTarget"};(function(q){Y.__aev=q;Y.__aev.g="aev";Y.__aev.h=!0;Y.__aev.priorityOverride=
0})(function(q){var v=q.vtp_gtmEventId,u=q.vtp_defaultValue,w=q.vtp_varType;switch(w){case "TAG_NAME":var y=a(v,"element");return y&&y.tagName||u;case "TEXT":return b(v,w,Jf)||u;case "URL":var x;a:{var C=String(a(v,"elementUrl")||u||""),A=Gh(C),z=String(q.vtp_component||"URL");switch(z){case "URL":x=C;break a;case "IS_OUTBOUND":x=d(C,q.vtp_affiliatedDomains);break a;default:x=Eh(A,z,q.vtp_stripWww,q.vtp_defaultPages,q.vtp_queryKey)}}return x;case "ATTRIBUTE":var D;if(void 0===q.vtp_attribute)D=c(v,
w,u);else{var G=q.vtp_attribute,L=a(v,"element");D=L&&If(L,G)||u||""}return D;case "MD":var O=q.vtp_mdValue,W=b(v,"MD",np);return O&&W?qp(W,O)||u:W||u;case "FORM":return f(String(q.vtp_component||"SUBMIT_TEXT"),v,u);default:var ba=c(v,w,u);Ip(ba,"aev",q.vtp_gtmEventId);return ba}})}();Y.b.gas=["google"],function(){(function(a){Y.__gas=a;Y.__gas.g="gas";Y.__gas.h=!0;Y.__gas.priorityOverride=0})(function(a){var b=E(a),c=b;c[Bd.Ga]=null;c[Bd.Wf]=null;var d=b=c;d.vtp_fieldsToSet=d.vtp_fieldsToSet||[];var e=d.vtp_cookieDomain;void 0!==e&&(d.vtp_fieldsToSet.push({fieldName:"cookieDomain",value:e}),delete d.vtp_cookieDomain);return b})}();
Y.b.fsl=[],function(){function a(){var e=U("document"),f=c(),g=HTMLFormElement.prototype.submit;Gf(e,"click",function(h){var l=h.target;if(l&&(l=Lf(l,["button","input"],100))&&("submit"==l.type||"image"==l.type)&&l.name&&If(l,"value")){var m;l.form?l.form.tagName?m=l.form:m=M.getElementById(l.form):m=Lf(l,["form"],100);m&&f.store(m,l)}},!1);Gf(e,"submit",function(h){var l=h.target;if(!l)return h.returnValue;var m=h.defaultPrevented||!1===h.returnValue,n=b(l)&&!m,r=f.get(l),t=!0;if(d(l,function(){if(t){var q;
r&&(q=e.createElement("input"),q.type="hidden",q.name=r.name,q.value=r.value,l.appendChild(q));g.call(l);q&&l.removeChild(q)}},m,n,r))t=!1;else return m||(h.preventDefault&&h.preventDefault(),h.returnValue=!1),!1;return h.returnValue},!1);HTMLFormElement.prototype.submit=function(){var h=this,l=b(h),m=!0;d(h,function(){m&&g.call(h)},!1,l)&&(g.call(h),m=!1)}}function b(e){var f=e.target;return f&&"_self"!==f&&"_parent"!==f&&"_top"!==f?!1:!0}function c(){var e=[],f=function(g){return Ja(e,function(h){return h.form===
g})};return{store:function(g,h){var l=f(g);l?l.button=h:e.push({form:g,button:h})},get:function(g){var h=f(g);return h?h.button:null}}}function d(e,f,g,h,l){var m=Zo("fsl",g?"nv.mwt":"mwt",0),n;n=g?Zo("fsl","nv.ids",[]):Zo("fsl","ids",[]);if(!n.length)return!0;var r=Vo(e,"gtm.formSubmit",n),t=e.action;t&&t.tagName&&(t=e.cloneNode(!1).action);r["gtm.elementUrl"]=t;l&&(r["gtm.formSubmitElement"]=l);if(h&&m){if(!zp(r,Mo(f),m))return!1}else zp(r,function(){},m||2E3);return!0}(function(e){Y.__fsl=e;Y.__fsl.g=
"fsl";Y.__fsl.h=!0;Y.__fsl.priorityOverride=0})(function(e){var f=e.vtp_waitForTags,g=e.vtp_checkValidation,h=Number(e.vtp_waitForTagsTimeout);if(!h||0>=h)h=2E3;var l=e.vtp_uniqueTriggerId||"0";if(f){var m=function(r){return Math.max(h,r)};Yo("fsl","mwt",m,0);g||Yo("fsl","nv.mwt",m,0)}var n=function(r){r.push(l);return r};Yo("fsl","ids",n,[]);g||Yo("fsl","nv.ids",n,[]);Ep("fsl")||(a(),Fp("fsl"));N(e.vtp_gtmOnSuccess)})}();



Y.b.paused=[],function(){(function(a){Y.__paused=a;Y.__paused.g="paused";Y.__paused.h=!0;Y.__paused.priorityOverride=0})(function(a){N(a.vtp_gtmOnFailure)})}();

Y.b.html=["customScripts"],function(){function a(d,e,f,g){return function(){try{if(0<e.length){var h=e.shift(),l=a(d,e,f,g);if("SCRIPT"==String(h.nodeName).toUpperCase()&&"text/gtmscript"==h.type){var m=M.createElement("script");m.async=!1;m.type="text/javascript";m.id=h.id;m.text=h.text||h.textContent||h.innerHTML||"";h.charset&&(m.charset=h.charset);var n=h.getAttribute("data-gtmsrc");n&&(m.src=n,Bf(m,l));d.insertBefore(m,null);n||l()}else if(h.innerHTML&&0<=h.innerHTML.toLowerCase().indexOf("<script")){for(var r=
[];h.firstChild;)r.push(h.removeChild(h.firstChild));d.insertBefore(h,null);a(h,r,l,g)()}else d.insertBefore(h,null),l()}else f()}catch(t){N(g)}}}var b=function(d,e,f){bk(function(){var g,h=Q;h.postscribe||(h.postscribe=ve);g=h.postscribe;var l={done:e},m=M.createElement("div");m.style.display="none";m.style.visibility="hidden";M.body.appendChild(m);try{g(m,d,l)}catch(n){N(f)}})};var c=function(d){if(M.body){var e=
d.vtp_gtmOnFailure,f=Jp(d.vtp_html,d.vtp_gtmOnSuccess,e),g=f.od,h=f.J;if(d.vtp_useIframe){}else d.vtp_supportDocumentWrite?b(g,h,e):a(M.body,Kf(g),h,e)()}else tp(function(){c(d)},
200)};Y.__html=c;Y.__html.g="html";Y.__html.h=!0;Y.__html.priorityOverride=0}();






Y.b.lcl=[],function(){function a(){var c=U("document"),d=0,e=function(f){var g=f.target;if(g&&3!==f.which&&!(f.hh||f.timeStamp&&f.timeStamp===d)){d=f.timeStamp;g=Lf(g,["a","area"],100);if(!g)return f.returnValue;var h=f.defaultPrevented||!1===f.returnValue,l=Zo("lcl",h?"nv.mwt":"mwt",0),m;m=h?Zo("lcl","nv.ids",[]):Zo("lcl","ids",[]);if(m.length){var n=Vo(g,"gtm.linkClick",m);if(b(f,g,c)&&!h&&l&&g.href){var r=String(Hp(g,"rel")||""),t=!!Ja(r.split(" "),function(u){return"noreferrer"===u.toLowerCase()});
t&&I(36);var q=U((Hp(g,"target")||"_self").substring(1)),v=!0;if(zp(n,Mo(function(){var u;if(u=v&&q){var w;a:if(t){var y;try{y=new MouseEvent(f.type)}catch(x){if(!c.createEvent){w=!1;break a}y=c.createEvent("MouseEvents");y.initEvent(f.type,!0,!0)}y.hh=!0;f.target.dispatchEvent(y);w=!0}else w=!1;u=!w}u&&(q.location.href=Hp(g,"href"))}),l))v=!1;else return f.preventDefault&&f.preventDefault(),f.returnValue=!1}else zp(n,function(){},l||2E3);return!0}}};Gf(c,"click",e,!1);Gf(c,"auxclick",e,!1)}function b(c,
d,e){if(2===c.which||c.ctrlKey||c.shiftKey||c.altKey||c.metaKey)return!1;var f=Hp(d,"href"),g=f.indexOf("#"),h=Hp(d,"target");if(h&&"_self"!==h&&"_parent"!==h&&"_top"!==h||0===g)return!1;if(0<g){var l=xp(f),m=xp(e.location);return l!==m}return!0}(function(c){Y.__lcl=c;Y.__lcl.g="lcl";Y.__lcl.h=!0;Y.__lcl.priorityOverride=0})(function(c){var d=void 0===c.vtp_waitForTags?!0:c.vtp_waitForTags,e=void 0===c.vtp_checkValidation?!0:c.vtp_checkValidation,f=Number(c.vtp_waitForTagsTimeout);if(!f||0>=f)f=2E3;
var g=c.vtp_uniqueTriggerId||"0";if(d){var h=function(m){return Math.max(f,m)};Yo("lcl","mwt",h,0);e||Yo("lcl","nv.mwt",h,0)}var l=function(m){m.push(g);return m};Yo("lcl","ids",l,[]);e||Yo("lcl","nv.ids",l,[]);Ep("lcl")||(a(),Fp("lcl"));N(c.vtp_gtmOnSuccess)})}();


var os={};os.macro=function(a){if(So.Zc.hasOwnProperty(a))return So.Zc[a]},os.onHtmlSuccess=So.Ne(!0),os.onHtmlFailure=So.Ne(!1);os.dataLayer=qh;os.callback=function(a){Kg.hasOwnProperty(a)&&Fa(Kg[a])&&Kg[a]();delete Kg[a]};function ps(){Q[Qd.C]=os;Xa(Lg,Y.b);td=td||So;ud=Md}
function qs(){Of.gtm_3pds=!0;Of.gtag_cs_api=!0;Q=B.google_tag_manager=B.google_tag_manager||{};Gl();if(Q[Qd.C]){var a=Q.zones;a&&a.unregisterChild(Qd.C);
}else{for(var b=data.resource||{},c=b.macros||[],d=0;d<c.length;d++)md.push(c[d]);for(var e=b.tags||[],f=0;f<e.length;f++)pd.push(e[f]);for(var g=b.predicates||[],h=0;h<g.length;h++)od.push(g[h]);for(var l=b.rules||[],m=0;m<l.length;m++){for(var n=l[m],r={},t=0;t<n.length;t++)r[n[t][0]]=Array.prototype.slice.call(n[t],1);nd.push(r)}rd=Y;sd=iq;var q=data.permissions||{},v=data.sandboxed_scripts,u=data.security_groups;
ao();Ud=new Td(q);if(void 0!==v)for(var w=["sandboxedScripts"],y=0;y<v.length;y++){var x=v[y].replace(/^_*/,"");Lg[x]=w}eo(u);ps();Ro();Wj=!1;Xj=0;if("interactive"==M.readyState&&!M.createEventObject||"complete"==M.readyState)Zj();else{Gf(M,"DOMContentLoaded",Zj);Gf(M,"readystatechange",Zj);if(M.createEventObject&&M.documentElement.doScroll){var C=!0;try{C=!B.frameElement}catch(G){}C&&ak()}Gf(B,"load",Zj)}un=!1;"complete"===M.readyState?wn():Gf(B,"load",wn);a:{if(!fh)break a;B.setInterval(gh,864E5);}Ig=(new Date).getTime();}}
(function(a){a()})(qs);

})()
