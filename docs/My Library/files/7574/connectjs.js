$( document ).ready(function() {
    
     if ($('.article-header .article-info .not-enum.left li:first-of-type a').length > 2 ){
$('.article-header .article-info .not-enum.left li:first-of-type a:not(:last-child)').after(',')
}

 if ($('.article-header .article-info .not-enum.left li:first-of-type a').length > 1){
 	$('.article-header .article-info .not-enum.left li:first-of-type a:last-of-type').before('and ')
 }
 
    /* Pagination fix */
    $("ol.pagination").each(function() {
        var pagination = $(this);
        var next = pagination.find("li:eq(-1)");
        var previous = pagination.find("li:eq(0)");
        var currentPage = pagination.find("a[aria-selected='true']").text();
        if (next && next.text() == "Next") {
            var lastPage = pagination.find("li:eq(-2)");
            if (lastPage && currentPage == lastPage.text()) next.remove();
        }
        if (previous && previous.text() == "Previous") {
            var firstPage = pagination.find("li:eq(1)");
            if (firstPage && currentPage == firstPage.text()) previous.remove();
        }
    });
    /* End Pagination fix */
    
  var commentNumber = $('.comment-content').length;
  $('#archived-comments h3 span').html(commentNumber);

    // 2.4 Format comments
    function formatComments(){

        // NOTE THIS IS A TEMPORARY FIX!!!!
        $('.article-listing p').each(function (k, v) {
            $(this).html($(this).html().replace(/\[[^\]]+\]/g, ''));
        });

        //And do this again in the main article content!
        if ($('.article-content').length > 0 && $('.tag-community').length < 1 ) {
            var theHtml = $('.article-content').html().replace(/\[caption/g, '<div class="article-inner-replaced"');
            theHtml = theHtml.replace(/\[pullquote/g, '<div class="pullquote"');
            theHtml = theHtml.replace(/\[note/g, '<div class="box"');
            theHtml = theHtml.replace(/\[\/pullquote\]/g, '</div>');
            theHtml = theHtml.replace(/\[\/caption\]/g, '</div>');
            theHtml = theHtml.replace(/\[\/note\]/g, '</div>');
            theHtml = theHtml.replace(/\[divider\]/g, '<div class="su-divider"></div><br class="clearfix">');
            theHtml = theHtml.replace(/\[topdivider\]/g, '<div class="su-divider"><a href="#top">TOP</a></div><br class="clearfix">');
            theHtml = theHtml.replace(/\]/g, '>');
            theHtml = theHtml.indexOf('[0>') > -1 ? theHtml.replace('[0>', '[0]') : theHtml;

            $('.article-content').html(theHtml);

            $('.article-inner-replaced ').each(function (k, v) {
                $(this).addClass($(this).attr('align'));
            });
        }

        //count comments
        if ($('.comment-responses').length > 0) {
            $('.comment-responses').html($('.comment-list p').length + ' ');
        }
        //pagination
        $(".listing_pagination .prevnext").each(function () {
            if ($(this).parents("a").length == 0) $(this).remove();
        });


        /* Videos FlexSlider */
        if (jQuery('.videos-container .slides')) {
            jQuery('.videos-container').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: true,
                slideshow: true,
                itemWidth: 160,
                itemMargin: 10,
                move: 4,
                maxItems: 4
            });
        }

        /* Commented on: 15 Aug 2013 by Bwalters
        //Replace Dividers
        $('divider').replaceWith('<div class="su-divider"></div>');
        $('topdivider').replaceWith('<div class="su-divider"><a href="#top">TOP</a></div>');
        */

        //Set certain attr
        $('.box[align]').each(function (k, v) {
            $(this).addClass($(this).attr('align')).removeAttr('align');
        });

        if ($('.listing-sorting').length > 0) {
            $('.listing-sorting select').change(function () {
                $(this).closest('form').submit();
            });
        };

        //Parse comment contents
        if ($('.comment-list p').length > 0) {
            $('.comment-list p').each(function (k, v) {
                $(this).html($(this).text().replace(/((http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#]))/g, '<a href="$1">$1</a>').replace('&lt;p&gt;', '<p>'));
            });
        }

        //Clear search field on pages that are not results
        if (window.location.href.indexOf('?mode=results') < 0 && $(this).find('input[type="text"]').val() != '') {
            $(this).find('input[type="text"]').val('');
        }

        $('.search').outside('click', function () {
            if (window.location.href.indexOf('?mode=results') < 0 && $(this).find('input[type="text"]').val() != '') {
                $(this).find('input[type="text"]').val('');
            }
        });

        $('.article-content a, .comment-list a').each(function (k, v) {
            if ($(this).attr('target') != '_self' && !$(this).hasClass('target-self')) $(this).attr('target', '_blank');
        });

        //Remove target blank from top dividers - Mark T 12.09.2013
        $('.su-divider').find('a').attr('target', '_self');

        $('.comment-reply').click(function (e) {
            e.preventDefault();
            var offset = $('#disqus_thread').offset();
            console.log(offset.top)
            window.scrollTo(0,offset.top);
        });
        $('.comment-reply-form, #hidden-reply-form').hide();
       // if($('#disqus_thread').length > 0) {
            var commentNumber = $('.comment-content').length;
            $('#archived-comments h3 span').html(commentNumber);
      //  }

    }

//Parse comment contents
    if ($('.comment-list p').length > 0) {
            $('.comment-list p').each(function (k, v) {
                $(this).html($(this).text().replace(/((http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#]))/g, '<a href="$1">$1</a>').replace('&lt;p&gt;', '<p>'));
            });
     }

//Show hide for menu
$(".spine-level-2 .show").on("click", function(e){
  if($(this).find(".spine-level-3") !==""){
    e.preventDefault();
    if(!$(this).hasClass("open")){
        $(this).parent("li").find(".spine-level-3, span.show").show();
        $(this).addClass("open");
    }
    else{
        $(this).removeClass("open");
        $(this).parent("li").find(".spine-level-3, span.hide").hide();
    }
  
  }
  else{
    $(this).parent("li").find(".spine-level-3").hide();
  }
});

$(".spine-level-2 .hide").on("click", function(e){
  if($(this).find(".spine-level-3") !==""){
    e.preventDefault();
    if(!$(this).hasClass("open")){
        $(this).parent("li").find(".spine-level-3, span.show").show();
        $(this).addClass("open");
    }
    else{
        $(this).removeClass("open");
        $(this).parent("li").find(".spine-level-3, span.hide").hide();
    }
  
  }
  else{
    $(this).parent("li").find(".spine-level-3").hide();
  }
});

$(".spine-level-3 a").on("click", function(e){
    window.location = $(this).attr("href");
})



/* Search page direct */
//jQuery(".spine-section .search").click(function(){window.location.assign("/connect/search")});

$(".communities.connect form.search").attr('action', '/connect/search');

$(".communities.authors-update form.search").attr('action', '/authors-update/search');

$(".communities.reviewers-update form.search").attr('action', '/reviewers-update/search');

$(".communities.atlas form.search").attr('action', '/atlas/search');

$(".communities.editors-update form.search").attr('action', '/editors-update/search');


/**** Shortcodes ****/
        if ($('.article-content').length > 0 && $('.tag-community').length < 1) {
            var theHtml = $('.article-content').html().replace(/\[caption/g, '<div class="article-inner-replaced"');
            theHtml = theHtml.replace(/\[pullquote/g, '<div class="pullquote"');
            theHtml = theHtml.replace(/\[note/g, '<div class="box"');
            theHtml = theHtml.replace(/\[\/pullquote\]/g, '</div>');
            theHtml = theHtml.replace(/\[\/caption\]/g, '</div>');
            theHtml = theHtml.replace(/\[\/note\]/g, '</div>');
            theHtml = theHtml.replace(/\[divider\]/g, '<div class="su-divider"></div><br class="clearfix">');
            theHtml = theHtml.replace(/\[topdivider\]/g, '<div class="su-divider"><a href="#top">TOP</a></div><br class="clearfix">');
            theHtml = theHtml.replace(/\]/g, '>');
            theHtml = theHtml.indexOf('[0>') > -1 ? theHtml.replace('[0>', '[0]') : theHtml;

            $('.article-content').html(theHtml);

            $('.article-inner-replaced ').each(function (k, v) {
                $(this).addClass($(this).attr('align'));
            });
        }

/**** Article sorting ****/
if ($('.listing-sorting').length > 0) {
            $('.listing-sorting select').change(function () {
                $(this).closest('form').submit();
            });
        };


// 1.1 On page load, expand the relevant selected node and highlight the parent nodes 
        $('.category-main').each(function(){
            expandSelectedCats($(this));
        });

        // 1.2 On click of plus/minus icon expand the relavant category
        $('.category-main .category-link .show-hide.expandable').on("click", function(){
            showCategories($(this));
        });

        // 1.3 Set LH category active state
        $('.content-left a').each(function (k, v) {
            setCurrentCategory($(this));
        });



/*
*  2. CATEGORY FUNCTIONS
*/

    // 2.1 Expand the relevant categories on page load
    function showCategories($this){

        var $thisMenu = $this.parents(".category-main"),
            child = ".category-sub-all",
            expandedClass = "expanded";

        if($thisMenu.hasClass(expandedClass)){
            $thisMenu.find(child).slideUp("fast");
            $thisMenu.removeClass(expandedClass);
        }else{

            //Collapse all current open categories
            //$(".category-main").each(function(){
            //    if($(this).hasClass(expandedClass)){
            //        $(this).find(child).hide();
            //        $(this).removeClass(expandedClass);
            //    }
            //});

            $thisMenu.find(child).slideDown("fast");

            $thisMenu.addClass(expandedClass);
        }
    }

    // 2.2 Expand the relevant categories on category click
    function expandSelectedCats($this){

            var pageID = $this.parent().attr("data-page-id"),
                $thisCategory = $this,
                $subCategory =  $thisCategory.find(".category-sub-all"),
                $showHideSection = $thisCategory.find(".category-link .show-hide"),
                expandableClass = "expandable",
                expandedClass = "expanded";
            
            if($subCategory.length){
                $showHideSection.addClass(expandableClass);
                console.log("added");
            }
 
            $thisCategory.find(".category-sub").each(function(){
                if($(this).attr("data-link-id") === pageID){
                    expandCategory();
                }
            });

            if($thisCategory.attr("data-category-id")  === pageID){
                expandCategory();
            }

            function expandCategory(){
                $subCategory.show();
                $thisCategory.addClass(expandedClass);
            }
    }

    // 2.3 Set LH category active state
    function setCurrentCategory($this){
        
        if (window.location.href === $this.attr('href')) {
            $this.addClass('current');
        }
    }


});

    function borderPictures() {
        //Add borders to all content images after they load - changed due to #101792
        $('.article-inner-replaced').each(function (k, v) {
            if ($(this).find('img').length > 0) {
                $(this).css('width', $(this).find('img').width() + 'px');
            }
        });
        $('img.caption').each(function(k,v) {
            var text = ($(this).attr('caption')) ? $(this).attr('caption') : $(this).attr('alt');
            var classes = 'align' + $(this).css('float') + ' article-inner-replaced';
            $(this).wrap('<div class="' + classes + '" style="font-size:0.85rem;width:' + $(this).css('width') + '" />');
            $(this).after(text);
            $(this).css('margin-top', '0');
        });
    }

/*
*  3. WINDOW LOAD EVENT
*/
    $(window).load(function(){
        borderPictures();
    });
    $('#ees_modePreviewFrame').load(function() {
        borderPictures();
    });