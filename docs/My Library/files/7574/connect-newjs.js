$(document).on("ready", function() {
    //Dropdown to switch to another Community landing page
    
    $(".select-community").on("change", function() {
        var value = $(this).find(":selected").attr("value");
        window.location.href = "/connect/" + value;
    });
    var paramArr = [];
    var param, selectedParam, ajaxURL, totalPage, restAssetURL;
    var numRanks = 10;
    if ($("body").hasClass("communities connect others")) {
        restAssetURL = window.location.origin + "/_resources/rests/other-community-landing-rest";
        
        // %asset_url:175400%
    } 
    else if ($("body").hasClass("communities connect tags-landing")) {
        restAssetURL = window.location.origin + "/_resources/rests/tag-landing-rest" + "?f.Tags|terms=" + $(".tag-landing-section").attr("data-attr-tag") + "&";
    }
    else {
        restAssetURL = window.location.origin + "/_resources/rests/connect-landing-rest-facetsload-more"
    }

    function initEvents() {
        $(".article-filter-block .btn-ui").hide();
    
        $(".tags li a:not(.js_ignore)").on("click", function(event) {
            param = $(this).attr("href").replace("?","");
            numRanks = numRanks;
            checkParam();
            fetchStories();
            return false;
        });
        addFilter();
        $(".article-filter-block .btn-ui").on("click", function(event) {
            var clearBtn = $(this).data("btn-clear");
            var tagsToClear = [];
            $.each(paramArr, function(a, val) {
                var checkValueExists = paramArr[a].toString().indexOf(clearBtn);
                if (checkValueExists >= 0) {
                    tagsToClear.push(val);
                }
            });
            for (var i = paramArr.length - 1; i >= 0; i--) {
                for (var j = 0; j < tagsToClear.length; j++) {
                    if (paramArr[i] === tagsToClear[j]) {
                        paramArr.splice(i, 1);
                    }
                }
            }
            selectParam();
            fetchStories();
        });
        var totalPages = $(".results-container .cta-primary").attr("data-totalpage");
        if (totalPages > 1) {
            $(".results-container .cta-primary").show();
        } else {
            $(".results-container .cta-primary").hide();
        }
    }
    $(document).on("click", ".results-container .results .cta-primary", function(event) {
        numRanks = numRanks + 10;
        checkUrl();
        fetchStories();
        return false;
    });

    function fetchStories() {
        $.ajax({
            url: ajaxURL,
        }).done(function(response) {
            updateResults(response);
            getDisqusComments();
        }).fail(function( jqXHR, textStatus, errorThrown ) {
            console.log(textStatus, errorThrown);
           // updateResults({});
        });
        if (ajaxURL != window.location) {
            window.history.pushState({
                path: ajaxURL
            }, '', selectedParam);
        }
    }

    function updateResults(response) {
        $('#maincontent .row.results-container').html(response);
        if ($(".article-macro").length <= 0) {
            $(".results").html("<p>No results found.</p>");
        }
        initEvents();
        $('.toggle-hidden-content').showHideContent();
    }

    function checkParam() {
        if (param.indexOf("&")) {
            param = param.replace("&", "%26");
        }
        var checkParamExists = $.inArray(param, paramArr);
        if (checkParamExists == "-1") {
            paramArr.push(param);
        } else {
            paramArr.splice(checkParamExists, 1);
        }
        selectParam();
        fetchStories();
    }

    function checkUrl() {
        var queryString = decodeURIComponent(window.location.search.substring(1));
        if (queryString) {
            queryString = queryString.replace(new RegExp("&f.", 'g'), ",f.");
            queryString = queryString.replace("&", "%26");
            paramArr = queryString.split(',');
        }
        selectParam();
    }

    function selectParam() {
        selectedParam = paramArr.join("&");
        selectedParam = "?" + selectedParam;
        if(!selectedParam.match(/Community/g)) {
            selectedParam = selectedParam + getCommunityUrlPart();
        }
        ajaxURL = restAssetURL + selectedParam + "&num_ranks=" + numRanks;
    }

    function addFilter() {
        $.each(paramArr, function(i, val) {
            var newVal = decodeURIComponent(val);
            $('.tags li a[href*="' + newVal + '"]').addClass('active');
        });
        showClearAllBtn();
    }

    function showClearAllBtn() {
        var tagsCountOne = (paramArr.toString().match(/Community/g) || []).length;
        var tagsCountTwo = (paramArr.toString().match(/Tags/g) || []).length;
        if (tagsCountOne >= 2) {
            $(".list-community .btn-ui").show();
        }
        if (tagsCountTwo >= 2) {
            $(".list-tags .btn-ui").show();
        }
    }

    function getDisqusComments(){
        //Reload comments after ajax call
        var disqus_shortname = 'elsevierconnect'; 
        window.DISQUSWIDGETS = undefined;
        $.getScript("https://" + disqus_shortname + ".disqus.com/count.js");

    }

    function getCommunityUrlPart() {
        var collectionName = $("meta[name='Community.Collection.Name']").attr('content');
        if (collectionName !== "elsevier%20connect"){
            return '&f.Community|community=' + collectionName;
        }
        else {
            return "";
        }
    }

    initEvents();
    var queryString = decodeURIComponent(window.location.search.substring(1));
    if (queryString) {
        queryString = queryString.replace(new RegExp("&f.", 'g'), ",f.");
        queryString = queryString.replace("&", "%26");
        paramArr = queryString.split(',');
        addFilter();
    }
});
