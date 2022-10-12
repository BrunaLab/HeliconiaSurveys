(function() {
  $(function() {
    var $rel;
    $rel = $('[rel=footnote]');
    $rel.inlineFootnote({
      boxMargin: 20,
      lineHeight: 24
    });
    return $rel.on('click', function(e) {
      var id;
      id = e.currentTarget.hash;
      $(id).on('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', function() {
        return $(id).removeClass('footnote-flash');
      });
      return $(id).addClass('footnote-flash');
    });
  });

}).call(this);
