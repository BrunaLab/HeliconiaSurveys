(function ($, Drupal) {

  // VRView configuration.
  Drupal.behaviors.amsciVR = {
    attach: function(context, settings) {
      var i = 0;
      var is_stereo;
      $('.vr-widget', context).once('vr').each(function(i, element) {
        $(element).addClass('vr-' + i);
        var $img = $(element).find('img.vr-preview');

        $img.hide();

        var tmpImg = new Image();
        tmpImg.src = $img.attr('src');
        $(tmpImg).one('load',function() {
          var
            tmpImageWidth = tmpImg.width,
            tmpImageHeigth = tmpImg.height;

          is_stereo = (tmpImageWidth / tmpImageHeigth) == 1;

          var vrView = new VRView.Player('.vr-' + i, {
            image: $img.attr('src'),
            is_stereo: is_stereo,
            is_vr_off: !is_stereo,
            width: $img.attr('width') ? $img.attr('width') : '100%',
            height: $img.attr('height') ? $img.attr('height') : '400px'
          });
          i++;
        });
      });
    }
  };

})(jQuery, Drupal);