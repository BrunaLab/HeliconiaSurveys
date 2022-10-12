(function ($) {
  Drupal.behaviors.estIpAccess = {
    attach: function (context, settings) {
      if (settings.est_ip_access == undefined) {
        return;
      }
      $.ajax({
        type: "POST",
        url: Drupal.settings.basePath + 'ajax/ip-access/button',
        data: {'product_id': settings.est_ip_access.product_id},
        success: function(data) {
          if (data) {
            $(settings.est_ip_access.selector).replaceWith(data);
          }
        }
      });
    }
  };
})(jQuery);
