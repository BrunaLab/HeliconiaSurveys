(function() {
  (function($) {
    $.inlineFootnote = function(el, options) {
      this.el = $(el);
      this.el.data("inlineFootnote", this);
      this.initialize = function() {
        this.options = $.extend({}, $.inlineFootnote.defaultOptions, options);
        this.footnoteId = this.el.attr("href").match(/#(.*)/)[1];
        if (this.footnoteId) {
          this.el.mouseenter(this.openBox);
          return $("body").mousemove(this.closeBox);
        }
      };
      this.openBox = (function(_this) {
        return function(event) {
          var footnoteContent, linkOffset;
          if (!_this.box) {
            footnoteContent = $("[id='" + _this.footnoteId + "']").children().filter(":not('" + _this.options.hideFromContent + "')");
            linkOffset = _this.el.offset();
            _this.box = $("<div />", {
              id: _this.options.boxId,
              html: footnoteContent.clone().find(_this.options.hideFromContent).remove().end(),
              css: {
                position: "absolute",
                top: linkOffset.top + _this.options.lineHeight,
                left: linkOffset.left + _this.el.outerWidth()
              }
            }).appendTo("body");
            return _this.positionBox();
          }
        };
      })(this);
      this.closeBox = (function(_this) {
        return function(event) {
          if (_this.box) {
            if (_this.isHoveringFootnote(event)) {
              clearTimeout(_this.closeTimeout);
              return _this.closeTimeout = null;
            } else {
              if (!_this.closeTimeout) {
                return _this.closeTimeout = setTimeout((function() {
                  _this.box.remove();
                  return _this.box = null;
                }), _this.options.hideDelay);
              }
            }
          }
        };
      })(this);
      this.isHoveringFootnote = function(event) {
        return this.box.is(event.target) || $(event.target).closest(this.box).length > 0 || event.target === this.el[0];
      };
      this.positionBox = function() {
        var boxHorizontalPadding, boxLeft, boxWidth, linkLeftOffset, windowWidth;
        boxHorizontalPadding = parseInt(this.box.css("padding-left")) + parseInt(this.box.css("padding-right"));
        linkLeftOffset = this.el.offset().left;
        windowWidth = $(window).width();
        if ((windowWidth / 2) > linkLeftOffset) {
          boxLeft = linkLeftOffset + 20;
          boxWidth = windowWidth - boxLeft - boxHorizontalPadding - this.options.boxMargin * 2;
          if (boxWidth > this.options.maximumBoxWidth) {
            boxWidth = this.options.maximumBoxWidth;
          }
        } else {
          boxWidth = linkLeftOffset - boxHorizontalPadding - this.options.boxMargin * 2;
          if (boxWidth > this.options.maximumBoxWidth) {
            boxWidth = this.options.maximumBoxWidth;
          }
          boxLeft = linkLeftOffset - boxWidth - this.options.boxMargin * 2;
        }
        return this.box.css({
          width: boxWidth,
          left: boxLeft
        });
      };
      return this.initialize();
    };
    $.inlineFootnote.defaultOptions = {
      boxMargin: 20,
      lineHeight: 20,
      hideDelay: 200,
      hideFromContent: "[rev=footnote]",
      maximumBoxWidth: 500,
      boxId: "footnote_box"
    };
    return $.fn.inlineFootnote = function(options) {
      return this.each(function() {
        return new $.inlineFootnote(this, options);
      });
    };
  })(jQuery);

}).call(this);
