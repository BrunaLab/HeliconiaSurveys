function getViewportOffset($e) {
  var $window = jQuery(window),
    scrollLeft = $window.scrollLeft(),
    scrollTop = $window.scrollTop(),
    scrollBottom = $window.scrollTop() + $window.height(),
    offset = $e.offset(),
    rect1 = { x1: scrollLeft, y1: scrollTop, x2: scrollLeft + $window.width(), y2: scrollTop + $window.height() },
    rect2 = { x1: offset.left, y1: offset.top, x2: offset.left + $e.width(), y2: offset.top + $e.height() };
  return {
    left: offset.left - scrollLeft,
    top: offset.top - scrollTop,
    bottom: offset.top - scrollBottom + $(".ad-band-img").height(),//$e.height(),
    insideViewport:  rect1.y2 > rect2.y1  && rect1.y2 > rect2.y1 && (offset.top - scrollTop) > 0
  };
}
(function ($){
$(window).on("load scroll resize", function() {
    //begin
    /*
    var viewportOffset = getViewportOffset($(".ad-band"));
    var $window = $(window);
    var $top3rd = $window.height()*.3333;
    var $bot3rd = -$window.height()*.3333;
    var $postop = viewportOffset.top;
    var $imght = $(".ad-band-img").height();
    console.log("left: " + viewportOffset.left + ", top: " + viewportOffset.top + ", bottom: " + viewportOffset.bottom +
        ", insideViewport: " + viewportOffset.insideViewport);

    console.log("top third " + $top3rd);
    console.log("top pos " + $postop);
    console.log("bot third " + $bot3rd);
    console.log("image height " + $imght);
    if ( viewportOffset.top < $imght ) {
        console.log("In the top third" + $top3rd);
        $('.ad-band').css('height', viewportOffset.top);
        $(".ad-band-img").css('position','relative');
        $(".ad-band-img").css('top', viewportOffset.top - $imght);
    }
    if( viewportOffset.top > $imght ){
        $('.ad-band').css('height', $imght);
        $(".ad-band-img").css('position','relative');
        $(".ad-band-img").css('top', 0);
    }
    if( viewportOffset.bottom > -$imght && viewportOffset.bottom < 0 ){
        $('.ad-band').css('height', Math.abs(viewportOffset.bottom));
    }
    if(  viewportOffset.bottom > 0 ){
        $('.ad-band').css('height', 0);
    }
    //end
    */
    $('a#simple-menu').on('click', function (){
        //alert();
        $.sidr('close', 'sidr');
    });

});
    $(document).bind('flagGlobalAfterLinkUpdate', function(event, data) {
        if (data.flagStatus == 'unflagged') {
              $.iaoAlert({msg: "This article has been removed from bookmarks.",
                type: "warning",
                mode: "dark",
                position: "bottom-right"})
        }else{
            $.iaoAlert({msg: "This article has been bookmarked.",
                type: "notification",
                mode: "dark",
                position: "bottom-right"})
        }
    });
    $(document).ready(function (){
        //adding popup for image
    $('.pop').on('click', function() {
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $('#imagemodal').modal('show');
    });

        //adding Class to Load More Button
    //blogs
    $('.view-id-blogs .pager-load-more a').addClass('button-text button');
    //topics
    $('.view-id-topics_all_type .pager-load-more a').addClass('button-text button');
     $('.pager').parent('div.item-list').addClass('load__button clearfix');

    //magazines issues

    $('.view-id-magazine_issues .pager-load-more a').addClass('button-text button');
    $('.view-id-magazine_issues .item-list').addClass('load__button load__issues clearfix');
    $('.view-id-magazine_issues ul.media li:first').addClass('is-first');

   //for the Contact Form Dropdown
    $("#webform-client-form-247 .webform-component--category-type select").change(function (){
        var data= $("option:selected", this).text();
        $('#webform-client-form-247 .cus__formtitle h4').text(data);
    });

    //Adding Class to the Issue-type
    $('.node-type-magazine-issue .slotstyle--a .slot__wrapper').addClass('slot--thatsafire');

    });

    $(window).ajaxComplete(function(event, xhr, settings) {
    $('.cus-departments-listing .pager-load-more a').addClass('button-text button');
    $('.view-id-blogs .pager-load-more a').addClass('button-text button');

    $('.view-id-topics_all_type .pager-load-more a').addClass('button-text button');
    $('.pager').parent('div.item-list').addClass('load__button clearfix');

    $('.view-id-magazine_issues .pager-load-more a').addClass('button-text button');
    $('.view-id-magazine_issues .item-list').addClass('load__button load__issues clearfix');
    $('.view-id-magazine_issues ul.media li:first').addClass('is-first');

    });
})(jQuery);


(function ($, Drupal) {
  Drupal.behaviors.amsciExpnadable = {
    attach: function(context, settings) {
      $('.related__content').once('expanable').each(function(key, element) {
        var $related = $(this);
        var $label = $related.find('label');
        $label.on('click', function(e) {
          e.preventDefault();
          $(this).parent().find('input').toggleClass('active');
        });
      });
    }
  };

})(jQuery, Drupal);

(function ($, Drupal) {
  function setPrint() {
    this.contentWindow.__container__ = this;
    this.contentWindow.onbeforeunload = closePrint;
    this.contentWindow.onafterprint = closePrint;
    this.contentWindow.focus(); // Required for IE
    // IE 11.
    var result = this.contentWindow.document.execCommand("print", false, null);
    if (!result) {
      this.contentWindow.print();
    }
  }

  function printPage(sURL) {
    var oHiddFrame = document.createElement("iframe");
    oHiddFrame.onload = setPrint;
    oHiddFrame.style.visibility = "hidden";
    oHiddFrame.style.position = "fixed";
    oHiddFrame.style.right = "0";
    oHiddFrame.style.bottom = "0";
    oHiddFrame.src = sURL;
    document.body.appendChild(oHiddFrame);
  }

  function closePrint() {
    document.body.removeChild(this.__container__);
  }

  Drupal.behaviors.amsciCustomPrint = {
    attach: function(context, settings) {
      $('a.est-print').once('print').on('click',function (e) {
        printPage($('a.est-print').attr('st_url'));
        return false;
      });
    }
  };

  Drupal.behaviors.amsciVR = {
    attach: function(context, settings) {
      var i = 0;
      $('.vr-widget', context).once('vr').each(function(i, element) {
        $(element).addClass('vr-' + i);
        var $img = $(element).find('img.vr-preview');
        $img.hide();
        var vrView = new VRView.Player('.vr-' + i, {
          image: $img.attr('src'),
          is_stereo: false,
          width: $img.attr('width') ? $img.attr('width') : '100%',
          height: $img.attr('height') ? $img.attr('height') : '400px'
        });
        i++;

      });
    }
  };

})(jQuery, Drupal);
